import 'package:auto_route/auto_route_annotations.dart';

import '../screens/auth_screen/auth_page.dart';
import '../screens/home_screen/home_page.dart';
import '../screens/splash_screen/splash_screen.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: AuthPage),
    MaterialRoute(page: HomePage, fullscreenDialog: true),
  ],
)
class $Router {}
