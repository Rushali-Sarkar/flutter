import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medogo/constants.dart';
import 'package:medogo/screens/registration_login_screen.dart';
import 'package:medogo/utilities/space.dart';

class SelectLanguageScreen extends StatefulWidget {
  static String id = "SelectLanguage";
  const SelectLanguageScreen({Key? key}): super(key: key);
  @override 
  _SelectLanguageScreenState createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  
  String selectedLanguage = "English";
  Color englishBackgroundColor = kPrimaryColor;
  Color bengaliBackgroundColor = kBackgroundLightColor;
  Color hindiBackgroundColor = kBackgroundLightColor;

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(30.0),
            children: <Widget>[
              const Center(
                child: Text("Select Your Language", style: 
                TextStyle(fontSize: 28.0, color: kPrimaryColor), 
                textAlign: TextAlign.center,)
              ),
              const AddSpace(verticalSpace: 20.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedLanguage = "English";
                    englishBackgroundColor = kPrimaryColor;
                    bengaliBackgroundColor = kBackgroundLightColor;
                    hindiBackgroundColor = kBackgroundLightColor;
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(100, 60),
                  primary: englishBackgroundColor,
                  shape: const StadiumBorder(),
                ),
                child: const Text("English"),
              ),
              const AddSpace(verticalSpace: 20.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedLanguage = "Bengali";
                    bengaliBackgroundColor = kPrimaryColor;
                    englishBackgroundColor = kBackgroundLightColor;
                    hindiBackgroundColor = kBackgroundLightColor;
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(100, 60),
                  primary: bengaliBackgroundColor,
                  shape: const StadiumBorder(),
                ),
                child: const Text("Bengali"),
              ),
              const AddSpace(verticalSpace: 20.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedLanguage = "Hindi";
                    hindiBackgroundColor = kPrimaryColor;
                    englishBackgroundColor = kBackgroundLightColor;
                    bengaliBackgroundColor = kBackgroundLightColor;
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(100, 60),
                  primary: hindiBackgroundColor,
                  shape: const StadiumBorder(),
                ),
                child: const Text("Hindi"),
              ),
               const AddSpace(verticalSpace: 50.0),
              RawMaterialButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, RegistrationLoginScreen.id);
                },
                elevation: 2.0,
                fillColor: kPrimaryColor,
                child: const Icon(
                  FontAwesomeIcons.arrowRight,
                  color: kTextColor,
                  size: 30.0),
                  padding: const EdgeInsets.all(15.0),
                  shape: const CircleBorder())],
          ),
      ),
    );
  }
}