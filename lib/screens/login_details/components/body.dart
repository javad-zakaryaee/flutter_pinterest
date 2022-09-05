import 'package:flutter/material.dart';
import 'package:pinterest_flutter/screens/home_page/home_page.dart';
import 'package:pinterest_flutter/providers/form_provider.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);
  var passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  var focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                          child: Consumer<FormProvider>(
                            builder: (context, formProvider, child) =>
                                TextFormField(
                              focusNode: focusNode,
                              onChanged: ((_) {
                                if (formProvider
                                    .emailController.text.isNotEmpty) {
                                  formProvider.showClearIcon();
                                } else {
                                  formProvider.hideClearIcon();
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
                                  suffixIcon: formProvider.isClearIconVisible
                                      ? IconButton(
                                          icon: const Icon(
                                            Icons.clear,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {
                                            formProvider.clearText();
                                            formProvider.hideClearIcon();
                                            FocusScope.of(context)
                                                .requestFocus(focusNode);
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
                              controller: formProvider.emailController,
                            ),
                          ),
                        ),
                        Consumer<FormProvider>(
                          builder: (context, formProvider, child) =>
                              TextFormField(
                            validator: (value) => value == null ||
                                    value.length < 8
                                ? 'Password can\'t be less than 8 characters'
                                : null,
                            obscureText: !formProvider.isPasswordVisible,
                            autofocus: true,
                            decoration: InputDecoration(
                                focusColor: null,
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                suffixIcon: formProvider.isPasswordVisible
                                    ? IconButton(
                                        icon: const Icon(
                                          Icons.visibility_rounded,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          formProvider.switchPasswordVisible();
                                        })
                                    : IconButton(
                                        onPressed: () {
                                          formProvider.switchPasswordVisible();
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
                          ),
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
    );
  }
}
