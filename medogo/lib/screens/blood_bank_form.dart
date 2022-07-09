import 'package:flutter/material.dart';
import 'package:medogo/constants.dart';
import 'package:medogo/screens/home_screen.dart';
import 'package:medogo/utilities/input_box_suffix.dart';
import 'package:medogo/utilities/input_box.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medogo/utilities/space.dart';


class BloodBankRequestForm extends StatefulWidget {
  static String id = "BloodBankRequestForm";
  final String bloodGroup;
  final String selectedLocation;
  const BloodBankRequestForm({Key? key,
  required this.bloodGroup,
  required this.selectedLocation,}): super(key: key);
  @override 
  _BloodBankRequestFormState createState() => _BloodBankRequestFormState();
}

class _BloodBankRequestFormState extends State<BloodBankRequestForm> {

  String selectedSex = "Female";
  Color femaleColor = kBackgroundLightColor;
  Color maleColor = kBackgroundColor;

  final _getName = TextEditingController();
  final _namekey = GlobalKey<FormState>();

  final _getAge = TextEditingController();
  final _agekey = GlobalKey<FormState>();

  final _getHospital = TextEditingController();
  final _hospitalkey = GlobalKey<FormState>();

  final _getNumber = TextEditingController();
  final _numberkey = GlobalKey<FormState>();

  @override 
  void dispose() {
    _getName.dispose();
    _getAge.dispose();
    _getHospital.dispose();
    _getNumber.dispose();
    super.dispose();
  }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: kBackgroundLightColor,
      centerTitle: false,
      title: const Text("Requesting Details", style: TextStyle(color: kPrimaryColor, fontSize: 22.0)),),
      backgroundColor: kBackgroundColor,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
              Container(
            width: 250.0,
            height: 250.0,
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            child: Image.asset("images/logoWritten.jpg"),
          ),
                 Form (
              key: _namekey,
              child: TextFormField(
                  cursorColor: kPrimaryColor,
                  style: kWhiteTextStyle,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Name of the Patient";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  controller: _getName,
                  decoration: getInputDecoration("Enter Patient's Name", 
                  "Full Name", "Enter Patient's Full Name", 
                  FontAwesomeIcons.user))),
                  const AddSpace(verticalSpace: 10.0),
                   Form (
              key: _agekey,
              child: TextFormField(
                  cursorColor: kPrimaryColor,
                  style: kWhiteTextStyle,
                  validator: (value) {
                    if (value == null || value.isEmpty || int.parse(value) < 0 || int.parse(value) > 150 || value.isEmpty) {
                      return "Enter a Valid Age";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  controller: _getAge,
                  decoration: getInputDecorationWithSuffix("Enter Patient's Age", 
                  "Age", "Enter Patient's Age", FontAwesomeIcons.userClock,
                  const Text("years", 
                  style: TextStyle(color: kPrimaryColor))))),
                  const AddSpace(verticalSpace: 10.0),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget> [
                     InkWell(
                   onTap: () {
                     setState(() {
                       selectedSex = "Male";
                       maleColor = kBackgroundLightColor;
                       femaleColor = kBackgroundColor;
                     });
                   },
                   child:  Container(
                    margin: const EdgeInsets.all(2.0),
                    padding: const EdgeInsets.all(2.0),
                    
                    width: 160.0,
                    height: 160.0,
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10.0),),
                    color: maleColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget> [
                      Icon(FontAwesomeIcons.mars,
                      color: kPrimaryColor,
                      size: 70.0),
                      Text("Male", style: TextStyle(color: kPrimaryColor, fontSize: 20.0),
                       textAlign: TextAlign.center,),
                    ],
                  ),
                 ),),
                   InkWell(
                   onTap: () {
                        setState(() {
                       selectedSex = "Female";
                       femaleColor = kBackgroundLightColor;
                       maleColor = kBackgroundColor;
                     });
                   },
                   child:  Container(
                    margin: const EdgeInsets.all(2.0),
                    padding: const EdgeInsets.all(2.0),
                    
                    width: 160.0,
                    height: 160.0,
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10.0),),
                    color: femaleColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget> [
                      Icon(FontAwesomeIcons.venus,
                      color: kPrimaryColor,
                      size: 70.0),
                      Text("Female", style: TextStyle(color: kPrimaryColor, fontSize: 20.0),
                       textAlign: TextAlign.center,),
                    ],
                  ),
                 ),),
                   ],
                 ),
                  const AddSpace(verticalSpace: 10.0),
                   Form (
              key: _hospitalkey,
              child: TextFormField(
                  cursorColor: kPrimaryColor,
                  style: kWhiteTextStyle,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a Hospital";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  controller: _getHospital,
                  decoration: getInputDecoration("Enter Hospital Admitted", 
                  "Hospital", "Enter Name of Hospital", FontAwesomeIcons.hospital,
                  ))),
                  const AddSpace(verticalSpace: 10.0),
                   Form (
              key: _numberkey,
              child: TextFormField(
                  cursorColor: kPrimaryColor,
                  style: kWhiteTextStyle,
                  validator: (value) {
                    if (value == null || value.isEmpty|| value.length < 10) {
                      return "Enter Valid Phone Number";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  controller: _getNumber,
                  decoration: getInputDecoration("Enter Phone Number", 
                  "Phone Number", "Enter your Phone Number", Icons.phone_android,
                  ))),
                  const AddSpace(verticalSpace: 10.0),
                  ElevatedButton(
                        onPressed: () {
                          if (_numberkey.currentState!.validate() && _namekey.currentState!.validate() && _agekey.currentState!.validate() && _hospitalkey.currentState!.validate()) {
                            _getName.clear();
                          _getNumber.clear();
                          _getHospital.clear();
                          _getAge.clear();

showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Request Send to Blood Bank. We Will Call You at the Earliest', textAlign: TextAlign.center, style: TextStyle(color: kPrimaryColor)),
          content: Image.asset("images/tick.gif"),
          actions: <Widget> [
            Center(
              child:   ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, HomeScreen.id);
                        },
                        style: ElevatedButton.styleFrom(
          fixedSize: const Size(200, 50),
          primary: kSecondaryColor,
          shape: const StadiumBorder()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget> [
                            Icon(Icons.home, color: kTextColor),
                            AddSpace(horizontalSpace: 10.0),
                            Text("Home", style: TextStyle(color: kTextColor, 
                            fontSize: 20.0)),
                          ],
                        ),
                      ),
            ),
          ],
        ),
      );
                          }
                        
                        },
                        style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 50),
          primary: kSecondaryColor,
          shape: const StadiumBorder()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget> [
                            Icon(Icons.verified_rounded, color: kTextColor),
                            AddSpace(horizontalSpace: 10.0),
                            Text("Submit Request", style: TextStyle(color: kTextColor, 
                            fontSize: 20.0)),
                          ],
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}

