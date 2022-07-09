import 'package:flutter/material.dart';
import 'package:medogo/constants.dart';
import 'package:medogo/utilities/space.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AmbulanceCard extends StatefulWidget {
  const AmbulanceCard({Key? key,}): super(key: key);
  @override 
  _AmbulanceCardState createState() => _AmbulanceCardState();
}

class _AmbulanceCardState extends State<AmbulanceCard> {
  @override 
  Widget build(BuildContext context) {
    return  Container(
           margin: const EdgeInsets.all(10.0),
           padding: const EdgeInsets.all(10.0),
           width: double.infinity,
           decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)),
           color: kBackgroundLightColor),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               Column(
                       mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children:  <Widget>[
               const CircleAvatar(backgroundImage: AssetImage("images/ambulancedriver.jpg"),
               minRadius: 50.0,
               backgroundColor: kBackgroundLighterColor,),
               const AddSpace(verticalSpace: 10.0),
            RatingBarIndicator(
    rating: 2.75,
    itemBuilder: (context, index) => const Icon(
         FontAwesomeIcons.ambulance,
         color: kSecondaryColor,
    ),
    itemCount: 5,
    itemSize: 20.0,
    direction: Axis.horizontal,
),
             ],         

               ),
               const AddSpace(horizontalSpace: 10.0),
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               const Text("Name of Driver", style: TextStyle(
                 fontSize: 20.0,
                 color: kPrimaryColor,
                 fontWeight: FontWeight.w900
               ),
               textAlign: TextAlign.center),
                  ElevatedButton(
                        onPressed: () {
                        
                        },
                        style: ElevatedButton.styleFrom(
          fixedSize: const Size(100, 30),
          primary: kSecondaryColor,
          shape: const StadiumBorder()),
                        child: const Text("Book Now", style: TextStyle(color: kTextColor, fontSize: 12.0)),
                      ),
                      const AddSpace(verticalSpace: 5.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: const <Widget>[
               Text("1.4km", style: TextStyle(color: kErrorColor)),
               AddSpace(horizontalSpace: 10.0),
               Text("₹500", style: TextStyle(color: kSuccessColor)),

             ],
                      ),

             ],
               ),

             ],
           ),
         );
  }
}