import 'package:flutter/material.dart';
import 'package:juiceapp/constants/colors.dart';
import 'package:juiceapp/ui/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: redColor
      ),
      title: 'Juice App',
      home: SplashScreen(),
    );
  }
}


