import 'package:flutter/material.dart';
import 'package:pinterest_flutter/providers/form_provider.dart';
import 'package:pinterest_flutter/providers/pin_provider.dart';
import 'package:pinterest_flutter/providers/user_provider.dart';
import 'package:pinterest_flutter/screens/home_page/home_page.dart';
import 'package:provider/provider.dart';
import 'package:pinterest_flutter/screens/login/login.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserProvider>(create: (_) => UserProvider()),
        Provider<FormProvider>(create: (_) => FormProvider()),
        Provider<PinProvider>(create: (_) => PinProvider()),
      ],
      child: Consumer<UserProvider>(
        builder: ((context, userProvider, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: Colors.blue,
                  canvasColor: Colors.black,
                  fontFamily: 'PT Sans',
                  textTheme: Theme.of(context).textTheme.apply(
                        bodyColor: Colors.white,
                        displayColor: Colors.white,
                      )),
              home: userProvider.isLoggedIn ? Text('logged in') : Login(),
            )),
      ),
    );
  }
}
