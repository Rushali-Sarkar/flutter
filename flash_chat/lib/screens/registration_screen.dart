import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/utilities/roundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key ? key}) : super(key : key);
  static String id = "registration_screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {


  late String email;
  late String password;
  final _emailkey = GlobalKey<FormState>();
  final _passwordkey = GlobalKey<FormState>();
  late final _auth;
  bool showSpinner = false;


  void setAuth() async {
     await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
  }

  @override 
  void initState()  {
    super.initState();
    setAuth();
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
             child:  Hero(
              tag: 'logo',
              child: SizedBox(
              height: 200.0,
              child: Image.asset('images/logo.png'),
            ),
            ),
           ),
            const SizedBox(
              height: 48.0,
            ),
            Form (
              key: _emailkey,
              child: TextFormField(
              style: kInputTextStyle,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter an Email id";
                }
                return null;
              },
              onChanged: (value) {
                email = value;
              },
              cursorColor: kPrimaryGrey,
              decoration: kTextFieldDecoration.copyWith(hintText: "Enter your email"),
            ),
            ),
            const SizedBox(
              height: 8.0,
            ),
           Form(
             key: _passwordkey,
             child:  TextFormField(
              style: kInputTextStyle,
              textAlign: TextAlign.center,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter a Password";
                }
                return null;
              },
              onChanged: (value) {
                password = value;
              },
              cursorColor: kPrimaryGrey,
              decoration: kTextFieldDecoration.copyWith(hintText: "Enter your password"),
            ),
           ),
            const SizedBox(
              height: 24.0,
            ),
            
            RoundedButton(kSecondaryGrey, "Register", () async {

                setState(() {
                  showSpinner = true;
                });

                   if (_emailkey.currentState!.validate() && _passwordkey.currentState!.validate()) {
                     try {
                       final newUser = await _auth.createUserWithEmailAndPassword(email: email, 
                       password: password);
                       if (newUser != null) {
                         Navigator.pushNamed(context, ChatScreen.id);
                       }
                       setState(() {
                         showSpinner = false;
                       });

                     }
                     catch (e) {
                       print(e);
                     }
                  }
                  }),
          ],
        ),
      ),
      ),
    );
  }
}