import 'package:flutter/material.dart';

import 'auth_disp.dart';
import 'auth_form.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLogin = true;

  void _toggleAuthType() => setState(() => _isLogin = !_isLogin);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Expanded(
                  flex: 4,
                  child: AuthDisp(
                    toggleAuthType: _toggleAuthType,
                    isLogin: _isLogin,
                  ),
                ),
                const Spacer(flex: 4),
                Expanded(flex: 5, child: AuthForm(isLogin: _isLogin)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5, top: 5),
                    child: Image.asset('assets/images/profile.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
