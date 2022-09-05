// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pinterest_flutter/screens/login_details/components/body.dart';

class LoginDetails extends StatelessWidget {
  LoginDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
