import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../data/global.dart';
import '../../routes/router.gr.dart';

class AuthDisp extends StatefulWidget {
  const AuthDisp({
    Key key,
    @required this.toggleAuthType,
    @required this.isLogin,
  }) : super(key: key);

  final void Function() toggleAuthType;
  final bool isLogin;

  @override
  _AuthDispState createState() => _AuthDispState();
}

class _AuthDispState extends State<AuthDisp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 5),
        Expanded(flex: 7, child: Image.asset('assets/images/health.png')),
        const Spacer(flex: 3),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${!widget.isLogin ? 'Already' : "Don't"} have an account?",
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              FlatButton(
                minWidth: 0,
                onPressed: widget.toggleAuthType,
                child: Text(
                  !widget.isLogin ? 'Login' : 'Sign Up',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              )
            ],
          ),
        ),
        const Expanded(child: Text('or', style: TextStyle(color: Colors.white, fontSize: 12))),
        const Expanded(
          child: Text(
            "Register with  ",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () async {
              final _googleSignIn = GoogleSignIn();
              getPermissions().then((_) async {
                try {
                  final googleUser = await _googleSignIn.signIn();
                  if (_googleSignIn == null) {
                    throw PlatformException(code: 'CANCELLED_BY_USER');
                  }
                  final googleAuthentication = await googleUser.authentication;
                  final authCredential = GoogleAuthProvider.credential(
                    idToken: googleAuthentication.idToken,
                    accessToken: googleAuthentication.accessToken,
                  );
                  await getFireAuthInstance().signInWithCredential(authCredential);
                  await ExtendedNavigator.of(context).replace(Routes.splashScreen);
                } on PlatformException catch (e) {
                  if (e.code == 'CANCELLED_BY_USER') {
                    print('Cancelled by user');
                  } else {
                    print('Server Error');
                  }
                }
              });
            },
            child: Image.asset(
              'assets/images/google.png',
              width: 30,
              height: 30,
            ),
          ),
        ),
        const Spacer(flex: 4),
      ],
    );
  }
}
