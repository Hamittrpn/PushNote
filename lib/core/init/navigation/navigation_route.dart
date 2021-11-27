import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:push_note/screen/authenticate/splash/view/splash_view.dart';
import '../../component/card/not_found_card.dart';
import '../../constant/navigation/navigation_constant.dart';
import '../../../screen/authenticate/onboard/view/onboard_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return MaterialPageRoute(
          builder: (context) => const OnBoardView(),
        );
      case NavigationConstants.ONBOARD_VIEW:
        return MaterialPageRoute(
          builder: (context) => const OnBoardView(),
        );
      case NavigationConstants.SPLASH_VIEW:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      default:
        return MaterialPageRoute(builder: (context) => const NotFoundCard());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
