import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/global.dart';
import '../../routes/router.gr.dart';
import 'password_widget.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key key, @required this.isLogin}) : super(key: key);

  final bool isLogin;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _firebaseAuth = getFireAuthInstance();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 5),
          const Expanded(
            child: Text(
              'User ID:',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          Expanded(
            flex: 2,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.disabled,
              decoration: const InputDecoration(
                focusColor: Colors.purple,
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              validator: (value) {
                const emailRegex =
                    r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
                if (RegExp(emailRegex).hasMatch(value)) {
                  return null;
                } else {
                  return 'Not a valid email';
                }
              },
              cursorColor: Colors.purple,
              controller: _emailController,
            ),
          ),
          const Spacer(),
          const Expanded(
            child: Text(
              'Password:',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          Expanded(flex: 2, child: PasswordWidget(passwordController: _passwordController)),
          const Spacer(),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CupertinoButton(
                    onPressed: () async {
                      getPermissions().then((_) async {
                        try {
                          if (widget.isLogin) {
                            await _firebaseAuth.signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                          } else {
                            await _firebaseAuth.createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                          }
                          await ExtendedNavigator.of(context).replace(Routes.splashScreen);
                        } on PlatformException catch (e) {
                          if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
                            print('Email in use');
                          } else if (e.code == 'ERROR_USER_NOT_FOUND' ||
                              e.code == 'ERROR_WRONG_PASSWORD') {
                            print('Invallid Email or Password');
                          } else {
                            print('Server Error');
                          }
                        }
                      });
                    },
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    color: Colors.deepPurple,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Text(
                      widget.isLogin ? 'LOGIN' : 'SIGN UP',
                      style: const TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
