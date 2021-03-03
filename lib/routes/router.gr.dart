// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/auth_screen/auth_page.dart';
import '../screens/home_screen/home_page.dart';
import '../screens/splash_screen/splash_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String authPage = '/auth-page';
  static const String homePage = '/home-page';
  static const all = <String>{
    splashScreen,
    authPage,
    homePage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.authPage, page: AuthPage),
    RouteDef(Routes.homePage, page: HomePage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashScreen(),
        settings: data,
      );
    },
    AuthPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AuthPage(),
        settings: data,
      );
    },
    HomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
        fullscreenDialog: true,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSplashScreen() => push<dynamic>(Routes.splashScreen);

  Future<dynamic> pushAuthPage() => push<dynamic>(Routes.authPage);

  Future<dynamic> pushHomePage() => push<dynamic>(Routes.homePage);
}
