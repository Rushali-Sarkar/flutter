import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/utilities/roundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key ? key}) : super(key: key);
  static String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late String _email;
  late String _password;
  late final _auth;
  bool showSpinner = false;


  void initAuth() async {
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
  }

  @override
  void initState() {
    super.initState();
    initAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           Flexible(
             child: Hero(
             tag: 'logo',
             child:  SizedBox(
              height: 200.0,
              child: Image.asset('images/logo.png'),
            ),
           ),
           ),
            const SizedBox(
                  height: 48.0,
              ),
            TextField(
              style: kInputTextStyle,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                _email = value;
              },
              cursorColor: kPrimaryGrey,
              decoration: kTextFieldDecoration.copyWith(hintText: "Enter your email"),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              style: kInputTextStyle,
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                _password = value;
              },
              cursorColor: kPrimaryGrey,
              decoration: kTextFieldDecoration.copyWith(hintText: "Enter your password"),
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(kSecondaryRed, "Login", () async {
              setState(() {
                showSpinner = true;
              });
              try {
                final user = await _auth.signInWithEmailAndPassword(email: _email, 
              password: _password);
              if (user != null) {
                Navigator.pushNamed(context, ChatScreen.id);
              }
              setState(() {
                showSpinner = false;
              });
              }
              catch (e) {
                print(e);
              }
            }),
          ],
        ),
      ),
      ),
    );
  }
}