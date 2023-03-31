import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dimensions.dart';

final RegExp emailValidatorRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
const String kEmailNullError = 'Please Enter your email';
const String kInvalidEmailError = 'Please Enter Valid email';
const String kPassNullError = 'Please Enter your password';
const String kShortPassError = 'Password is too short';
const String kMatchPassError = 'Passwords don\'t match';
const String kRequiredFieldError = 'All fields are required';

final authHeadingStyle = TextStyle(
  color: Colors.black,
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
);
