import 'package:flutter/material.dart';
import 'package:medogo/constants.dart';

InputDecoration getInputDecoration(String hintText, String labelText, String helperText, IconData icon) {
  return InputDecoration(
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