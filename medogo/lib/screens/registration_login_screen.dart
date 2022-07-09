import 'package:flutter/material.dart';
import 'package:medogo/constants.dart';
import 'package:medogo/screens/otp_verification.dart';
import 'package:medogo/utilities/input_box.dart';
import 'package:medogo/utilities/space.dart';
import 'package:medogo/utilities/generate_button_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class RegistrationLoginScreen extends StatefulWidget {
  static String id = "RegistrationLoginScreen";
  const RegistrationLoginScreen({Key? key}): super(key: key);
  @override 
  _RegistrationLoginScreenState createState() => _RegistrationLoginScreenState();
}

class _RegistrationLoginScreenState extends State<RegistrationLoginScreen> {
  
  final _getNumber = TextEditingController();
  final _numberkey = GlobalKey<FormState>();

  @override 
  void dispose() {
    _getNumber.dispose();
    super.dispose();
  }
  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          Container(
            width: 250.0,
            height: 250.0,
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            child: Image.asset("images/logoWritten.jpg"),
          ),
          Form (
              key: _numberkey,
              child: TextFormField(
                  cursorColor: kPrimaryColor,
                  style: kWhiteTextStyle,
                  validator: (value) {
                    if (value == null || value.length != 10) {
                      return "Please Enter a Valid Phone Number";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  controller: _getNumber,
                  decoration: getInputDecoration("Enter a Valid Phone Number", "Phone Number", "Enter Phone Number", Icons.phone_android))),
                  const AddSpace(verticalSpace: 10.0),
                  TextButton(onPressed: () {
                    if (_numberkey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, OtpVerification.id);
                    }
                    },
                    child: generateButtonText("Generate OTP"),
                    style: kButtonStyle),
                    const AddSpace(verticalSpace: 10.0),
                  TextButton(onPressed: () {
                    if (_numberkey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, OtpVerification.id);
                    }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        const Icon(FontAwesomeIcons.google,
                        color: kTextColor),
                        const AddSpace(horizontalSpace: 5.0),
                        generateButtonText("Sign In With Google")
                      ],
                    ),
                    style: kButtonStyle),
                    ])));
  }
}

