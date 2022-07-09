import 'package:flutter/material.dart';
import 'package:medogo/constants.dart';

class DropDownList extends StatefulWidget {
  final List<String> options;
  final double width;
  final String intitalSelected;
  const DropDownList({Key? key,
  required this.options,
  required this.intitalSelected,
  required this.width,}): super(key: key);
  @override 
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  @override 
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        width: widget.width,
        height: 50.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: kTextColor,
        ),
        child: DropdownButton<String>(
      value: widget.intitalSelected,
      icon: const Icon(Icons.arrow_drop_down, 
      color: kSecondaryColor),
      elevation: 20,
      underline: Container(),
      style: const TextStyle(color: kSecondaryColor, fontSize: 20.0),
      borderRadius: BorderRadius.circular(5.0),
      onChanged: (String? newValue) {
        setState(() {
          });
          },
          items: widget.options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value));
              }).toList()));
  }
}

