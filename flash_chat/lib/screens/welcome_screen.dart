import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/utilities/roundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key ? key}) : super(key : key);
  static String id = "welcome_screen";
  
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  Color value = Colors.red;

  @override
  void initState() {
    super.initState();
    AnimationController controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
      upperBound: 0.6,
      lowerBound: 0.2,
    );
    Animation animation = ColorTween(begin: Colors.grey.shade100, end: Colors.white70).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {
        value = animation.value;
      });
     });
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                   Flexible(
                     child:  Hero(
                      tag: 'logo',
                      child: SizedBox(
                  child: Image.asset('images/logo.png'),
                  height: 60.0,
                ),
                    ),
                   ),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText("Flash Chat", 
                    textStyle: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: kPrimaryGrey,
                    ),
                  ),
                  ],
                ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(kSecondaryRed, "Login", () {
              Navigator.pushNamed(context, LoginScreen.id);
            }),
            RoundedButton(kSecondaryGrey, "Register", () {
              Navigator.pushNamed(context, RegistrationScreen.id);
            }),
          ],
        ),
      ),
    );
  }
}