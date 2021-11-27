import 'package:flutter/cupertino.dart';

import '../../init/cache/locale_manager.dart';
import '../../init/navigation/navigation_service.dart';
abstract class BaseViewModel {
  BuildContext? context;

  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();
}
