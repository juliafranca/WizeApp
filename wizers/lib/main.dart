import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizers/providers/transactions.dart';
import 'package:wizers/telas/onboarding.dart';

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
          title: 'Wize App',
          debugShowCheckedModeBanner: false,
          theme:
              ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
          home: Onboarding()),
    );
  }
}
