import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const Xylophone());
}

class Xylophone extends StatelessWidget {
  const Xylophone({Key ? key}) : super(key : key);
  void playsound(String filename) {
    final player = AudioCache();
    player.play(filename);
  }

  Expanded buildKey(Color color, String filename) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playsound(filename);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0))),
        ),
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Xylophone"),
          backgroundColor: Colors.blueGrey,
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              buildKey(Colors.red, "note1.wav"),
              buildKey(Colors.orange, "note2.wav"),
              buildKey(Colors.yellow, "note3.wav"),
              buildKey(Colors.green, "note4.wav"),
              buildKey(Colors.blue,"note5.wav"),
              buildKey(Colors.indigo, "note6.wav"),
              buildKey(Colors.purple, "note7.wav"),
              // buildKey(Colors.cyan, "note8.mp3"),
            ],
          ),
        ),
      ),
    );
  }
}
