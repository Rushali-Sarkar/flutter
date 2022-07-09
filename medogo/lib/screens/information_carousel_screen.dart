import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:medogo/constants.dart';
import 'dart:async';
import 'package:medogo/screens/select_language.dart';
import 'package:medogo/utilities/space.dart';


class InformationCarousel extends StatefulWidget {
   static String id = "InformationCarousel";
  const InformationCarousel({Key? key}): super(key: key);
  @override 
  _InfromationCarouselState createState() => _InfromationCarouselState();
}

class _InfromationCarouselState extends State<InformationCarousel>{

  @override 
  void initState() {
    super.initState();
    Timer(kInformationScreenWaitingTime, () {
      Navigator.pushReplacementNamed(context, SelectLanguageScreen.id);
    });
  }


  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          CarouselSlider(
            options: CarouselOptions(height: 400.0,
            autoPlay: true,
            autoPlayInterval: kCarouselWaitingTime,
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,),
            items: ["images/carousel/image1.jpg", "images/carousel/image2.jpg", "images/carousel/image3.jpg"].map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    color: kTextColor,
                    padding: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.asset(item));
                    });
                    }).toList()),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget> [
                        const AddSpace(verticalSpace: 50.0),
                        InkWell(
                          child:  kSkipText,
                          onTap: () {
                            Navigator.pushReplacementNamed(context, SelectLanguageScreen.id);
                          },
                        )])]));
  }
}