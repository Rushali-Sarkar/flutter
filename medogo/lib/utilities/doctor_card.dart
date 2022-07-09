import 'package:flutter/material.dart';
import 'package:medogo/constants.dart';
import 'package:medogo/utilities/space.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:medogo/screens/particular_specialist_page.dart';


class DoctorCard extends StatefulWidget {
  final String doctorName;
  final String doctorImage;
  final double fees;
  final double distance;
  final double rating;
  final String specialisation;
  final String specialistImage;
  const DoctorCard({Key? key,
  required this.doctorName,
  required this.doctorImage,
  required this.fees,
  required this.distance,
  required this.rating,
  required this.specialisation,
  required this.specialistImage}): super(key: key);
  @override 
  _DoctorCardState createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override 
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {},
      child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                color: kBackgroundLightColor,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget> [
                                  Text(widget.doctorName, 
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: kSecondaryColor, 
                                    fontWeight: FontWeight.bold, fontSize: 15.0)),
                                  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget> [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget> [
                                      CircleAvatar(
                                    backgroundColor: kBackgroundLighterColor,
                                    backgroundImage: AssetImage("images/${widget.doctorImage}"),
                                    minRadius: 50.0,
                                  ),
                                  const AddSpace(verticalSpace: 10.0),
                                  RatingBarIndicator(
                                    rating: widget.rating,
                                    itemBuilder: (context, index) => const Icon(Icons.star, color: kSuccessColor),
                                    itemCount: 5,
                                    itemSize: 20.0,
                                    direction: Axis.horizontal),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget> [
                                       ElevatedButton(
                                         onPressed: () {},
                                         style: ElevatedButton.styleFrom(
                                           fixedSize: const Size(100, 10),
                                           primary: kErrorColor),
                                           child: const Text("Book Now", style: TextStyle(color: kTextColor, fontSize: 12.0))),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             crossAxisAlignment: CrossAxisAlignment.center,
                                             children: <Widget> [
                                               Text("Fees: ₹${widget.fees.toString()}", style: const TextStyle(color: kSuccessColor, fontSize: 15.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic,),),
                                               const AddSpace(horizontalSpace: 20.0),
                                               Text("${widget.distance.toString()}km", style: const TextStyle(color: kErrorColor, fontSize: 15.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic,),),
                                             ],
                                           ),
                                            InkWell(
                                             onTap: () {
                                               Navigator.push(context, 
                                               MaterialPageRoute(builder: 
                                               (context) => ParticularSpecialist(specialist: widget.specialisation, specialistImage: widget.specialistImage,)));
                                             },
                                             child: Container(
                                               width: 150.0,
                                             padding: const EdgeInsets.all(5.0),
                                             margin: const EdgeInsets.all(5.0),
                                             decoration: const BoxDecoration(
                                               borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                               color: kBackgroundLighterColor,
                                             ),
                                             child: Text(widget.specialisation,
                                             textAlign: TextAlign.center,
                                             style: const TextStyle(color: kSecondaryColor))))])])])));
  }
}