import 'package:flutter/material.dart';
import 'constants.dart';

class ReuseableCard extends StatelessWidget {
    
    final Color colour;
    final Widget cardChild;
    ReuseableCard(this.colour, this.cardChild);
 

  @override 
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
          ),
          margin: EdgeInsets.all(15.0),
          child: cardChild,
          );
  }
}
