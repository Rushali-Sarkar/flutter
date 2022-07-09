import 'package:flutter/material.dart';
import 'package:medogo/constants.dart';


class ProblemCard extends StatelessWidget {
  final String image;
  final String problem;
  const ProblemCard({Key? key,
  required this.image,
  required this.problem}): super(key: key);
  @override 
  Widget build(BuildContext context) {
    return  Container(
                           margin: const EdgeInsets.all(10.0),
                           padding: const EdgeInsets.all(10.0),
                           height: 200,
                           width: 200,
                           decoration: BoxDecoration(
                             image: DecorationImage(image: AssetImage("images/$image")),
                             borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                             color: kBackgroundLightColor,
                           ),
                           alignment: Alignment.bottomCenter,
                           child: Text(problem, style: const TextStyle(fontSize: 18.0, color: kErrorColor)),
                         );
  }
}