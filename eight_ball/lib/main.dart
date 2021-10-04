import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(EightBall());
}

class EightBall extends StatefulWidget {
  @override
  _EightBallState createState() => _EightBallState();
}

class _EightBallState extends State<EightBall> {
  String imageName = 'yes_or_no';
  List images = [
    "yes",
    "no",
    "yes",
    "yes",
    "no",
    "yes",
    "yes",
    "yes",
    "no",
    "no"
  ];
  void _getAnswer() {
    setState(() {
      int index = Random().nextInt(images.length);
      imageName = images[index];
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Ask me Any Question'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('images/$imageName.png'),
            ),
            SizedBox(
              height: 50.0,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.yellow),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: Text(
                  "Get Answer",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  _getAnswer();
                }),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueGrey),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: Text(
                  "Reset",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    imageName = "yes_or_no";
                  });
                }),
          ],
        ),
      ),
    );
  }
}
