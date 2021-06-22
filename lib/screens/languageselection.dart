import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiple_language/localization/language/languages.dart';
import 'package:multiple_language/localization/locale_constant.dart';
import 'package:multiple_language/model/language_data.dart';
import 'package:multiple_language/screens/welcomeScreen.dart';

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({Key key}) : super(key: key);

  @override
  _LanguageSelectionState createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  Size get size => MediaQuery.of(context).size;

  Color get primaryBlue => Color(0xFF3467F6);
  LanguageData objlanguagedata;
      var radiovalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: primaryBlue,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: 1,
                        groupValue: radiovalue,

                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        "Please Click Continue With English Language",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                           ),
                      )
                    ],
                  ),

                ),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: 1,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        "Kliknij, aby kontynuować w języku polskim",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            ),
                      )
                    ],
                  ),

                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (BuildContext context) {
                      return WelcomeScreen();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 30,
                    ),
                    height: 50,
                    width: size.width * 0.45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: Center(
                      child: Text(
                        Languages.of(context).continuebutton,
                        style: TextStyle(
                            color: Color(0xFF3467F6),
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ]),
    );
  }

  languagedropDown() {
    return Container(
      height: 50,
      width: size.width * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton<LanguageData>(
              hint: Text(
                Languages.of(context).selectlang,
                style: TextStyle(
                    color: primaryBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1),
              ),
              onChanged: (LanguageData language) {
                changeLanguage(context, language.languageCode);

              },
              items: LanguageData.languageList()
                  .map<DropdownMenuItem<LanguageData>>(
                    (language) => DropdownMenuItem<LanguageData>(
                      value: language,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(child: Text(language.name)),
                          Center(child: Text(language.languageCode)),
                        ],
                      ),
                    ),
                  )
                  .toList()),
        ),
      ),
    );
  }
}
