import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:multiple_language/localization/language/languages.dart';
import 'package:multiple_language/screens/email.dart';

class MobileNumber extends StatefulWidget {
  const MobileNumber({Key key}) : super(key: key);

  @override
  _MobileNumberState createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  final GlobalKey<FormState> _formkey= GlobalKey<FormState>();
  Size get size => MediaQuery.of(context).size;
  Color get primaryBlue => Color(0xFF3467F6);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ExitConfirm,
      child: Scaffold(
        backgroundColor: Color(0xFF3467F6),
        body: Form(
          key: _formkey,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.38),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    textFields(Languages.of(context).mobilenumber),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40, top: 10),
                          child: GestureDetector(
                            onTap: () {
                              if(_formkey.currentState.validate()){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return Email();
                                    }));
                              }return null;
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22),
                              ),
                              height: 50,
                              width: size.width * 0.45,
                              child: Text(
                                Languages.of(context).next,
                                style: TextStyle(
                                    color: primaryBlue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 1),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column textFields(String text1) {
    return Column(children: [
      Container(
        height: 30,
        width: size.width * 0.85,
        child: TextFormField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          validator: (value){
            if(value.isEmpty){
              return Languages.of(context).validatemobilenumber;
            }return null;
          },
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textInputAction: TextInputAction.go,
          onFieldSubmitted: (String value){
            if (_formkey.currentState.validate()) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) {
                  return Email();
                }));
            }return null;
          },
          decoration: InputDecoration(
            hintText: text1,
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                )),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                )),
          ),
          cursorColor: Colors.white,
        ),
      ),
      SizedBox(
        height: 25,
      ),
    ]);
  }
  Future<bool> ExitConfirm() async {
    final dialogue = await showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text(Languages.of(context).confirmexit,
            style: new TextStyle(color: Colors.black, fontSize: 20.0)),
        content: new Text(
            Languages.of(context).regicancelled),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              SystemChannels.platform
                  .invokeMethod('SystemNavigator.pop');
            },
            child:
            new Text(Languages.of(context).yes, style: new TextStyle(fontSize: 18.0)),
          ),
          new FlatButton(
            onPressed: () => Navigator.pop(context),
            // this line dismisses the dialog
            child: new Text(Languages.of(context).no, style: new TextStyle(fontSize: 18.0)),
          )
        ],
      );
    }
    );
    return dialogue;
  }
}