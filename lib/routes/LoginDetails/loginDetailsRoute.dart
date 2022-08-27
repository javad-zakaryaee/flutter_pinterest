// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pinterest_flutter/routes/homepage/homePage.dart';

class LoginDetails extends StatefulWidget {
  String email;
  LoginDetails({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<LoginDetails> createState() => _LoginDetailsState();
}

class _LoginDetailsState extends State<LoginDetails> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordVisible = true;
  var clearIconVisible = false;
  final loginFormKey = GlobalKey<FormState>();
  var focusNode = FocusNode();
  @override
  void initState() {
    emailController.text = widget.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                  Form(
                    key: loginFormKey,
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: TextFormField(
                              focusNode: focusNode,
                              onChanged: ((value) {
                                if (emailController.text.isNotEmpty) {
                                  setState(() {
                                    clearIconVisible = true;
                                  });
                                } else {
                                  setState(() {
                                    clearIconVisible = false;
                                  });
                                }
                              }),
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
                                  suffixIcon: clearIconVisible
                                      ? IconButton(
                                          icon: const Icon(
                                            Icons.clear,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              emailController.text = '';
                                              clearIconVisible = false;
                                              FocusScope.of(context)
                                                  .requestFocus(focusNode);
                                            });
                                          })
                                      : null,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20)),
                                  contentPadding:
                                      const EdgeInsets.only(left: 25, top: 5),
                                  hintText: 'Enter your email',
                                  hintStyle: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              controller: emailController,
                            ),
                          ),
                          TextFormField(
                            validator: (value) => value == null ||
                                    value.length < 8
                                ? 'Password can\'t be less than 8 characters'
                                : null,
                            obscureText: passwordVisible,
                            autofocus: true,
                            decoration: InputDecoration(
                                focusColor: null,
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                suffixIcon: passwordVisible
                                    ? IconButton(
                                        icon: const Icon(
                                          Icons.visibility_rounded,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            passwordVisible = false;
                                          });
                                        })
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            passwordVisible = true;
                                          });
                                        },
                                        icon: const Icon(
                                            Icons.visibility_off_rounded,
                                            color: Colors.black)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20)),
                                contentPadding:
                                    const EdgeInsets.only(left: 25, top: 5),
                                hintText: 'Enter your password',
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            controller: passwordController,
                          )
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (loginFormKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => HomePage())));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xffC92127),
                        textStyle: const TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text('Log In')),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.blueGrey),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
