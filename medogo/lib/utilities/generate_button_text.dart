import 'package:flutter/material.dart';
import 'package:medogo/constants.dart';

Text generateButtonText (String text) {
  return Text(text,
  textAlign: TextAlign.center,
  style: const TextStyle(fontSize: 20.0, color: kTextColor));
}