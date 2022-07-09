import 'package:flutter/material.dart';
import 'package:medogo/constants.dart';
import 'package:medogo/screens/get_user_details.dart';
import 'package:medogo/screens/registration_login_screen.dart';
import 'package:medogo/utilities/generate_button_text.dart';
import 'package:medogo/utilities/space.dart';
import 'package:medogo/utilities/input_box.dart';


class OtpVerification extends StatefulWidget {
  static String id = "OtpVerification";
  const OtpVerification({Key? key}): super(key: key);
  @override 
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  
  final _getOtp = TextEditingController();
  final _otpkey = GlobalKey<FormState>();

  @override 
  void dispose() {
    _getOtp.dispose();
    super.dispose();
  }

  @override 
  Widget build(BuildContext context) {
    return  Scaffold(
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
              key: _otpkey,
              child: TextFormField(
                  cursorColor: kPrimaryColor,
                  style: kWhiteTextStyle,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This is not the correct OTP";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  controller: _getOtp,
                  decoration: getInputDecoration("Enter OTP", "Enter OTP", "Enter One Time Password", Icons.timelapse))),
                  const AddSpace(verticalSpace: 10.0),
                  TextButton(onPressed: () {
                    if (_otpkey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, UserDetails.id);
                    }
                    },
                    child: generateButtonText("Verify OTP"),
                    style: kButtonStyle),
                    const AddSpace(verticalSpace: 10.0),
                    TextButton(onPressed: () {
                    Navigator.pushReplacementNamed(context, RegistrationLoginScreen.id);
                    },
                    child: generateButtonText("Enter a Different Number"),
                    style: kButtonStyle),
                    ])));
  }
}