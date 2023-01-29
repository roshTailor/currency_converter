import 'package:currency_converter/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: 'DMSans',
            primaryColor: Color(0xff03023B),
            appBarTheme: AppBarTheme(
              color: Color(0xff03023B),
            )
        ),

        debugShowCheckedModeBanner: false,
        home: Home());
  }
}
