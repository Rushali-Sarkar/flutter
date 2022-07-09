import 'package:flutter/material.dart';

class NavigationButton extends StatefulWidget {
  final Color backgroundColor;
  final String route;
  final String name;
  const NavigationButton({Key? key,
  required this.backgroundColor,
  required this.route,
  required this.name}): super(key: key);
  @override 
  _NavigationButtonState createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  @override 
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, widget.route);
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(150, 60),
          primary: widget.backgroundColor,
          shape: const StadiumBorder()),
          child: Text(widget.name));
  }
}