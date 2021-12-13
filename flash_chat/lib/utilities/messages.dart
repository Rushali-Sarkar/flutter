import 'package:flutter/material.dart';


class MessageBubble extends StatelessWidget {
  final String messageText;
  final String sender;
  final Color bubbleColor;
  final CrossAxisAlignment alignment;
  final double topLeft;
  final double topRight;

  const MessageBubble({Key? key,
  required this.messageText,
  required this.sender,
  required this.alignment,
  required this.bubbleColor,
  this.topLeft = 0.0,
  this.topRight = 0.0}): super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: alignment,
        children: <Widget>[
          Text(sender,
          style: const TextStyle(
            fontSize: 10.0,
            color: Colors.blueGrey,
          ),),
          Material(
        elevation: 5.0,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
        bottomLeft: const Radius.circular(30.0),
        bottomRight: const Radius.circular(30.0)),
        color: bubbleColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Text(messageText,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15.0,
      ),),
      ),
    ),
        ],
      ),
    );
  }
}
