import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multiple_language/screens/languageselection.dart';
import 'package:multiple_language/screens/welcomeScreen.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LanguageSelection())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFF3264EE),
        child: Center(
          child: Image.asset(
            'assets/images/a.png',
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}