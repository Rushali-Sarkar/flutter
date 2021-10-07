import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

 RoundIconButton(@required this.icon, @required this.onpressed);
 final IconData icon;
 final Function onpressed;

  @override 
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, 
      color: Colors.white),
        onPressed: onpressed(),
        elevation: 0.0,
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        constraints: BoxConstraints.tightFor(
          width: 10.0,
          height: 10.0,
        ),
    );
  }
}