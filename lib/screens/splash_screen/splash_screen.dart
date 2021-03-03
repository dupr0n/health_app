import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../routes/router.gr.dart';

class SplashScreen extends StatelessWidget {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: 'assets/images/health.png',
      backgroundColor: const Color(0xFF6C00B2),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      screenFunction: () async {
        final curUser = optionOf(_firebaseAuth.currentUser);
        if (curUser.isNone()) {
          await ExtendedNavigator.of(context).replace(Routes.authPage);
        } else if (curUser.isSome()) {
          await ExtendedNavigator.of(context).replace(Routes.homePage);
        }
        return const SizedBox();
      },
    );
  }
}
