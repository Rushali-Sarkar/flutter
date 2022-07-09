import 'package:flutter/material.dart';
import 'package:medogo/constants.dart';

InputDecoration getInputDecorationWithSuffix(String hintText, String labelText, String helperText, IconData icon, Widget suffixWidget) {
  return InputDecoration(
    suffix: suffixWidget,
    enabledBorder: kPrimaryBorder,
    focusedBorder: kPrimaryBorder,
    errorBorder: kErrorBorder,
    focusedErrorBorder: kErrorBorder,
    filled: true,
    hintStyle: kHintTextStyle,
    hintText: hintText,
    labelText: labelText,
    labelStyle: kPrimaryTextStyle,
    helperText: helperText,
    helperStyle: kHintTextStyle,
    prefixIcon: Icon(icon, color: kPrimaryColor),
    fillColor: kBackgroundLightColor);
}