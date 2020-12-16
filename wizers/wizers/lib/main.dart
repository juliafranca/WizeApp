import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizers/providers/transactions.dart';
import 'package:wizers/telas/onboarding.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Transactions(),
      child: MaterialApp(
          title: 'WIZE',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: wizeRoxo,
              primarySwatch: Colors.purple,
              fontFamily: 'Glacial',
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: AnimatedSplashScreen(splash: Image.asset("images/logo1.png"), 
          
          nextScreen: Onboarding(),
          splashTransition: SplashTransition.scaleTransition,
          splashIconSize: 300,
          backgroundColor: wizeRoxo,
          duration: 2000,
          )
          ),
    );
  }
}
