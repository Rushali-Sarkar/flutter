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
  hintStyle: TextStyle(color: Colors.white70),
  
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

const kTextFieldDecoration = InputDecoration(
                hintText: 'Enter a Value',
                hintStyle: TextStyle(
                  color: kSecondaryGrey,
                ),
                fillColor: kPrimaryRed,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: kPrimaryGrey, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: kPrimaryGrey, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              );