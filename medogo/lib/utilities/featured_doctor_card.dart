import 'package:flutter/material.dart';
import 'package:medogo/constants.dart';
import 'package:medogo/utilities/space.dart';


class FeaturedDoctorCard extends StatefulWidget {
  final String doctorName;
  final double doctorRating;
  final String doctorimage;
  const FeaturedDoctorCard({Key? key,
  required this.doctorName,
  required this.doctorRating,
  required this.doctorimage}): super(key: key);
  @override 
  _FeaturedDoctorCardState createState() => _FeaturedDoctorCardState();
}

class _FeaturedDoctorCardState extends State<FeaturedDoctorCard> {
  @override 
  Widget build(BuildContext context) {
    return  InkWell(
                             onTap: () {},
                             child:Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: <Widget> [
                                  Container(
                                    margin: const EdgeInsets.all(10.0),
                                    padding: const EdgeInsets.all(10.0),
                               height: 150.0,
                               width: 150.0,
                               decoration: BoxDecoration(
                                 image: DecorationImage(image: AssetImage("images/${widget.doctorimage}")),
                                 shape: BoxShape.circle,
                                 color: kBackgroundLightColor,
                               ),
                               
                             ),
                             Text(widget.doctorName, style: const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w900, fontSize: 15.0)),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children:  <Widget>[
                                  Text(widget.doctorRating.toString(), style: const TextStyle(color: kSuccessColor, fontWeight: FontWeight.w900, fontSize: 15.0)),
                                  const AddSpace(horizontalSpace: 5.0),
                                  const Icon(Icons.star, color: kSuccessColor, size: 15.0),
                               ],
                             ),
                             ElevatedButton(
                               onPressed: () {},
                                 style: ElevatedButton.styleFrom(
                                   fixedSize: const Size(80, 10),
                                   primary: kErrorColor),
                                   child: const Text("Book Now", style: TextStyle(color: kTextColor, fontSize: 10.0))),

                               ],
                             ),
                           );
  }
}