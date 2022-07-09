import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xff160941);
const kBackgroundLightColor = Color(0xff362d5c);
const kBackgroundLightSelectedColor = Color(0x6f362d5c);
const kPrimaryColor = Color(0xffff9b96);
const kSecondaryColor = Color(0xffcc0644);
const kTextColor = Color(0xffffffff);
const kBackgroundLighterColor = Color(0xffc0c0c0);
const kErrorColor = Color(0xffff0000);
const kHintTextColor = Color(0x4fe1e1e1);
const kSuccessColor = Color(0xff00ff00);

const kSpalshScreenWaitingTime = Duration(milliseconds: 2000);
const kCarouselWaitingTime = Duration(milliseconds: 2000);
const kInformationScreenWaitingTime = Duration(milliseconds: 6000);

const kSplashScreenBackground = BoxDecoration( image: DecorationImage(image: 
AssetImage("images/splashscreen_background.jpg"),
fit: BoxFit.fitWidth));

const kSkipText = Text("Skip", style: 
TextStyle(fontSize: 25.0,
color: kPrimaryColor));

const kWhiteTextStyle = TextStyle(color: kTextColor);
const kSecondaryTextStyle = TextStyle(color: kSecondaryColor);
const kPrimaryTextStyle = TextStyle(color: kPrimaryColor);
const kHintTextStyle = TextStyle(color: kHintTextColor);
const kLanguageTextStyle = TextStyle(fontSize: 20.0, color: kTextColor);

const kPrimaryBorder = OutlineInputBorder(borderSide: BorderSide(color: kPrimaryColor));
const kErrorBorder = OutlineInputBorder(borderSide: BorderSide(color: kErrorColor));

final kButtonStyle = ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10.0)));

const List<String> kImages = ["allergistsImmunologists", "anesthesiologists", "cardiologists", "colonandrectalsurgeons", "criticalcaremedicinespecialists", "dermatologists", "endocrinologists", "emergencymedicinespecialists", "familyphysicians", "gastroenterologists", "geriatricmedicinespecialists", "hematologists", "hospiceandpalliativemedicinespecialists", "infectiousdiseasespecialists", "internists", "medicalgeneticists", "nephrologists", "neurologists", "obstetriciansandgynecologists", "oncologists", "ophthalmologists", "osteopaths", "otolaryngologists", "pathologists", "pediatricians", "physiatrists", "plasticsurgeons", "podiatrists", "preventivemedicinespecialists", "psychiatrists", "pulmonologists", "radiologists", "rheumatologists", "sleepmedicinespecialists", "sportsmedicinespecialists", "generalsurgeons", "urologists"];
const List<String> kNames = ["Allergists/Immunologists", "Anesthesiologists", "Cardiologists", "Colon and Rectal Surgeons", "Critical Care Medicine Specialists", "Dermatologists", "Endocrinologists", "Emergency Medicine Specialists", "Family Physicians", "Gastroenterologists", "Geriatric Medicine Specialists", "Hematologists", "Hospice and Palliative Medicine Specialists", "Infectious Disease Specialists", "Internists", "Medical Geneticists", "Nephrologists", "Neurologists", "Obstetricians and Gynecologists", "Oncologists", "Ophthalmologists", "Osteopaths", "Otolaryngologists", "Pathologists", "Pediatricians", "Physiatrists", "Plastic Surgeons", "Podiatrists", "Preventive Medicine Specialists", "Psychiatrists", "Pulmonologists", "Radiologists", "Rheumatologists", "Sleep Medicine Specialists", "Sports Medicine Specialists", "General Surgeons", "Urologists"];
