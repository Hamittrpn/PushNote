import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constant/navigation/navigation_constant.dart';
import '../service/local_notificaiton_service.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;

  @observable
  bool isFirstInit = true;

  void init() {
    startAnimationOnView();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      //Receive message when app is in background solution for on message
      _firebaseInit();
    });

    Future.delayed(const Duration(seconds: 2)).then((value) {
      navigation.navigateToPageClear(NavigationConstants.ONBOARD_VIEW, null);
    });
  }

  Future<void> controlAppState() async {
    await navigation.navigateToPageClear(
        NavigationConstants.ONBOARD_VIEW, null);
  }

  Future<void> _firebaseInit() async {
    await Firebase.initializeApp();

    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    LocalNotificationService.initialize();

    await firebaseMessaging.requestPermission();
    final token = await firebaseMessaging.getToken();
    print(token);

    //Gives you the message on wich user taps
    //and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["route"];
        print(routeFromMessage);
        navigation.navigateToPage(routeFromMessage, null);
      }
    });

    //foreground work
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }
      LocalNotificationService.display(message);
    });

    // When the app is in background but opened and user taps
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];
      navigation.navigateToPage(routeFromMessage, null);
    });
  }

  Future<void> startAnimationOnView() async {
    if (context == null) return;
    await Future.delayed(Duration(seconds: 1));
    _changeFirstInit();
  }

  @action
  void _changeFirstInit() {
    isFirstInit = !isFirstInit;
  }
}
