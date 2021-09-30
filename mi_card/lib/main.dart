import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;
  void increaseCount() {
    setState(() {
      count++;
    });
  }

  void decreaseCount() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.blueGrey[700],
          appBar: AppBar(
            title: Text('Counter App'),
            backgroundColor: Colors.blueGrey,
          ),
          body: Center(
            child: Text(
              'Counting: $count',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton:
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            FloatingActionButton(
              backgroundColor: Colors.blueGrey[900],
              child: Icon(Icons.arrow_upward_outlined),
              onPressed: increaseCount,
            ),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              backgroundColor: Colors.blueGrey[900],
              child: Icon(Icons.arrow_downward_outlined),
              onPressed: decreaseCount,
            ),
          ]),
        ),
      );
}
