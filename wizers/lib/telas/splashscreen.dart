import 'package:flutter/material.dart';
import 'package:wizers/telas/onboarding.dart';

import 'menu/menu_principal.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen(
      {Key key,
      this.title,
      int seconds,
      LinearGradient gradientBackground,
      Onboarding navigateAfterSeconds,
      Color loaderColor})
      : super(key: key);
  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xffED213A), Color(0xff93291E)],
        ),
        navigateAfterSeconds: Onboarding(),
        loaderColor: Colors.transparent,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/logo1.png"),
            fit: BoxFit.none,
          ),
        ),
      ),
    ],
  );
}
