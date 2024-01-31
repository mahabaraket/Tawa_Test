import 'package:flutter/material.dart';
import 'package:test_tawa/design_system/atoms/spacings/size_config.dart';

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kInvalidEmailError = "Please Enter Valid Email";
const String knullEmailError = "Email is required";
const String kPassNullError = "Password is required";

final craouselText = TextStyle(
  fontSize: getProportionateScreenWidth(21),
  fontWeight: FontWeight.w600,
  fontFamily: 'Inter',
  color: Colors.white,
  height: 0.06,
  letterSpacing: -0.24,
);
const kAnimationDuration = Duration(milliseconds: 200);
final btnText = TextStyle(
  color: Colors.white,
  fontSize: getProportionateScreenWidth(18),
  fontFamily: 'Inter',
  fontWeight: FontWeight.w700,
  height: 0.06,
);

final cfText = TextStyle(
  color: Color(0xFF6B5CD2),
  fontSize: getProportionateScreenWidth(18),
  fontFamily: 'Inter',
  fontWeight: FontWeight.w300,
  decoration: TextDecoration.underline,
  height: 0.04,
);
