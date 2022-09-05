import 'package:flutter/material.dart';
import 'package:pinterest_flutter/screens/login/components/body.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
