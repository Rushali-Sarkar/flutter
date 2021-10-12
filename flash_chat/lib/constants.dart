import 'package:flutter/material.dart';

const kPrimaryGrey = Color(0xFF455A64);
const kSecondaryGrey = Color(0xFF909090);
const kPrimaryRed = Color(0xFFF44336);
const kSecondaryRed = Color(0xFFFF5533);

const kSendButtonTextStyle = TextStyle(
  color: kPrimaryRed,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: kPrimaryRed, width: 2.0),
  ),
);

const kSizedbox = SizedBox(
  height: 48.0,
);

const kInputTextStyle = TextStyle(
  color: kPrimaryGrey,
  fontWeight: FontWeight.w900,
);