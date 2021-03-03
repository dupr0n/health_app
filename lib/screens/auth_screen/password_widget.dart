import 'package:flutter/material.dart';

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({
    Key key,
    @required TextEditingController passwordController,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  _PasswordWidgetState createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool _isVisible = false;

  void _toggleVisibility() => setState(() => _isVisible = !_isVisible);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.disabled,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(_isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined),
          onPressed: _toggleVisibility,
        ),
        focusColor: Colors.purple,
        focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      validator: (value) => value.length > 7 ? null : 'Atleast 8 characters',
      cursorColor: Colors.purple,
      controller: widget._passwordController,
      obscureText: !_isVisible,
    );
  }
}
