import 'package:flutter/material.dart';
import 'package:multiple_language/localization/language/languages.dart';

import 'name.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Size get size =>
      MediaQuery
          .of(context)
          .size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: Colors.white,
            child: ListView(children: [
              SizedBox(
                height: size.height * 0.12,
              ),
              Image.asset(
                'assets/images/b.png',
                height: 250,
                width: 250,
                alignment: Alignment.center,
              ),
              Text(Languages.of(context).welcomehead,
                style: TextStyle(
                    color: Color(0xFF3467F6),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Lorem ipsum is simply dummy text of the printing and typeset-",
                style: TextStyle(color: Color(0xFF594A43), fontSize: 10),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ting industry. Lorem ipsum has been the ",
                      style: TextStyle(color: Color(0xFF594A43), fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      Languages.of(context).signin,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Color(0xFF3467F6), fontSize: 10),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Name()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 100,
                      ),
                      height: 50,
                      width: size.width * 0.45,
                      decoration: BoxDecoration(
                          color: Color(0xFF3467F6),
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                        child: Text(
                          Languages.of(context).letsStart,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ])));
  }
}