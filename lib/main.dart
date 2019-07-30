import 'package:flutter/material.dart';
import 'package:superciti/util/state_widget.dart';
import 'package:superciti/ui/theme.dart';
import 'package:superciti/ui/screens/home.dart';
import 'package:superciti/ui/screens/sign_in.dart';
import 'package:superciti/ui/screens/sign_up.dart';
import 'package:superciti/ui/screens/forgot_password.dart';
import'package:superciti/ui/screens/splashScreen.dart';
import'package:superciti/all_translations.dart';

class MyApp extends StatelessWidget {
  MyApp() {
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp Title',
      theme: buildTheme(),
      //onGenerateRoute: Navigation.router.generator,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/HomeScreen':(context) => HomeScreen(),
        '/signin': (context) => SignInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
      },
    );
  }
}

void main() async {
  await allTranslations.init();
  StateWidget stateWidget = new StateWidget(
    child: new MyApp(),
  );
  runApp(stateWidget);
}
