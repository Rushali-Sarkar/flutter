import 'package:flutter/material.dart';
import 'package:medogo/constants.dart';
import 'dart:async';
import 'package:medogo/screens/information_carousel_screen.dart';

class SplashScreen extends StatefulWidget {
static String id = "SplashScreen";
const SplashScreen({Key? key}): super(key: key);
@override 
_SplashScreenState createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {


  @override 
  void initState() {
    super.initState();
    Timer(kSpalshScreenWaitingTime, () {
      Navigator.pushReplacementNamed(context, InformationCarousel.id);
    });
  }

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kBackgroundColor,
      body: Container(
        decoration: kSplashScreenBackground,
        child: null)));
  }
}