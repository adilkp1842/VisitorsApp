import 'package:flutter/material.dart';

abstract class Languages {

  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }
  String get selectlang;

  String get signin;

  String get continuebutton;

  String get welcomehead;

  String get letsStart;

  String get next;

  String get name;

  String get validateentername;

  String get mobilenumber;

  String get validatemobilenumber;

  String get Email;

  String get validateEmail;

  String get submit;

  String get selectStaff;

  String get confirmexit;

  String get regicancelled;

  String get regicompleted;

  String get yes;

  String get no;
}
