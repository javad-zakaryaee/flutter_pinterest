import 'package:flutter/material.dart';
import 'package:pinterest_flutter/routes/LoginDetails/loginDetailsRoute.dart';

class LoginRoute extends StatefulWidget {
  const LoginRoute({Key? key}) : super(key: key);

  @override
  State<LoginRoute> createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  final loginFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Welcome to Pinterest',
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.7,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                  Form(
                    key: loginFormKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'Enter a valid email';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          focusColor: null,
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20)),
                          contentPadding: EdgeInsets.only(left: 25, top: 5),
                          hintText: 'Email address',
                          hintStyle: TextStyle(fontWeight: FontWeight.bold)),
                      controller: emailController,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (loginFormKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => LoginDetails(
                                      email: emailController.text))));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xffC92127),
                        textStyle: TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text('Continue'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
