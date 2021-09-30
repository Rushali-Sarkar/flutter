// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// The main function is the starting pouint of all our Flutter apps.

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[900],
            centerTitle: true,
            title: Text('I am Rich'),
          ),
          backgroundColor: Colors.blueGrey,
          body: Center(
            child: Image(
              image: AssetImage('images/jewels.png'),
            ),
          ),
        ),
      ),
    );
