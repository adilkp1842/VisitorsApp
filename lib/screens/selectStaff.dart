import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:multiple_language/localization/language/languages.dart';
import 'package:multiple_language/screens/welcomeScreen.dart';

class SelectStaff extends StatefulWidget {
  const SelectStaff({Key key}) : super(key: key);

  @override
  _SelectStaffState createState() => _SelectStaffState();
}

class _SelectStaffState extends State<SelectStaff> {
  Size get size => MediaQuery.of(context).size;
  Color get primaryBlue => Color(0xFF3467F6);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ExitConfirm,
      child: Scaffold(
        backgroundColor: Color(0xFF3467F6),
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: primaryBlue,
              child: Column(children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 40, top: 40, bottom: 15),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        Languages.of(context).selectStaff,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "*",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: GridView.count(
                      padding: EdgeInsets.only(left: 30, top: 10, right: 30),
                      crossAxisCount: 4,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      children: [
                        images('assets/images/userone.jpg',"John",),
                        images('assets/images/usertwo.jpg',"Samuel"),
                        images('assets/images/userthree.jpg',"Abraham"),
                        images('assets/images/userfour.jpg',"Dicaprio"),
                        images('assets/images/userone.jpg',"Doran Conner"),
                        images('assets/images/usertwo.jpg',"Myrtle Gutierrez"),
                        images('assets/images/userthree.jpg',"Audrey Fletcher"),
                        images('assets/images/userfour.jpg',"Margot Cole"),
                        images('assets/images/userone.jpg',"Hazel Booth"),
                        images('assets/images/usertwo.jpg',"Diana Poole"),
                        images('assets/images/userthree.jpg',"Stan Todd"),
                        images('assets/images/userfour.jpg',"Dudley Vaughn"),
                        images('assets/images/userfour.jpg',"Diana Poole"),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          Future.delayed(Duration(seconds: 3), () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    WelcomeScreen()));
                          });
                          return dialogueBox(
                            context,
                            Languages.of(context).regicompleted,
                          );
                        });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 50, top: 20),
                    height: 50,
                    width: size.width * 0.45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: Center(
                      child: Text(
                        Languages.of(context).submit,
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
            )
          ],
        ),
      ),
    );
  }
  GestureDetector images(image,String name,{bool isSelected=false}) {
    return GestureDetector(
      onTap: () {
        if (isSelected == false) {
          setState(() {
            isSelected = true;
          });
        } else {
          setState(() {
            isSelected = false;
          });
        }
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(shape: BoxShape.rectangle,
          color:isSelected?Colors.green :primaryBlue,
          border: Border.all(color:isSelected? Colors.red :
          Colors.white ,style: BorderStyle.solid),

        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(5),
                  child:ClipRRect(
                    borderRadius: isSelected?BorderRadius.circular(60):BorderRadius.circular(1),
                    child:Image.asset(image,fit: BoxFit.cover),
                  )),
            ),
            Container(
              height: 17,
              margin: EdgeInsets.all(5),
              child:Center(child:Text(name,style: TextStyle(color: Colors.white,fontSize: 17),)),
            ),
          ],
        ),
      ),
    );
  }

  AlertDialog dialogueBox(BuildContext context, String text) {
    return AlertDialog(
      title: Text(
        text,
        style: TextStyle(color: Color(0xFF3467F6)),
      ),
    );
  }
  Future<bool> ExitConfirm() async {
    final dialogue = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(Languages.of(context).confirmexit,
                style: TextStyle(color: Colors.black, fontSize: 20.0)),
            content: Text(Languages.of(context).regicancelled),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                child: Text(Languages.of(context).yes, style: TextStyle(fontSize: 18.0)),
              ),
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text(Languages.of(context).no, style: TextStyle(fontSize: 18.0)),
              )
            ],
          );
        });
    return dialogue;
  }
}