import 'package:flutter/material.dart';
import 'package:medogo/screens/blood_bank.dart';
import 'package:medogo/screens/book_ambulance.dart';
import 'package:medogo/screens/get_user_details.dart';
import 'package:medogo/screens/home_screen.dart';
import 'package:medogo/screens/information_carousel_screen.dart';
import 'package:medogo/screens/otp_verification.dart';
import 'package:medogo/screens/registration_login_screen.dart';
import 'package:medogo/screens/select_language.dart';
import 'package:medogo/screens/specialist_doctors.dart';
import 'package:medogo/screens/splash_screen.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MedogoApp());
}

class MedogoApp extends StatelessWidget {
  const MedogoApp({Key? key}): super(key: key);
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        InformationCarousel.id: (context) => const InformationCarousel(),
        SelectLanguageScreen.id: (context) => const SelectLanguageScreen(),
        RegistrationLoginScreen.id: (context) => const RegistrationLoginScreen(),
        OtpVerification.id: (context) => const OtpVerification(),
        UserDetails.id: (context) => const UserDetails(),
        HomeScreen.id: (context) => const HomeScreen(),
        BloodBank.id: (context) => const BloodBank(),
        BookAmbulance.id: (context) => const BookAmbulance(),
        SpecialistDoctors.id: (context) => const SpecialistDoctors(),
      },
    );
  }
}