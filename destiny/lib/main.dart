import 'package:flutter/material.dart';
import 'destiny.dart';
import 'dart:io';

void main() => runApp(Destiny());

class Destiny extends StatefulWidget {
  @override 
  _DestinyState createState() => _DestinyState();
}

class _DestinyState extends State<Destiny> {

  List<Option> allOptions = [
    Option(0, "start", "Tap the Start Button to Start your Destiny. Your choices determine what destiny you call for", "Start", "Exit App", 1, -1),
    Option(1, "background1", "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat and soulless eyes opens the passenger door for you and says: \"Need a ride, boy?\".", "I'll hop in. Thanks for the help!", "Well, I don't have many options. \nBetter ask him if he's a murderer.", 3, 2),
    Option(2, "background2", "He nods slowly, unphased by the question.", " At least he's honest. I'll climb in.", " Wait, I know how to change a tire.", 3, 4),
    Option(3, "background3", "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glove box. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.", "I love Elton John! Hand him the cassette tape.", "It’s him or me. Take the knife and stab him.", 6, 5),
    Option(4, "background4", "What? Such a cop out! Did you know accidental traffic accidents are the second leading cause of accidental death for most adult age groups?", "Exit App", "Restart Game", -1, 0),
    Option(4, "background5", "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.", "Exit App", "Restart Game", -1, 0),
    Option(4, "background6", "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\"", "Exit App", "Restart Game", -1, 0),  
  ];

  Option currentOption = Option(0, "start", "Tap the Start Button to Start your Destiny. Your choices determine what destiny you call for", "Start", "", 1, -1);
  int number = 0;
  String background = "start";
  String story = "Tap the Start Button to Start your Destiny. Your choices determine what destiny you call for";
  String option1Text = "Start";
  String option2Text = "Exit App";
  int option1Next = 1;
  int option2Next = -1;

  void updateCurrentOption(int next) {
    setState(() {
      currentOption = allOptions[next];
      number = currentOption.storyNumber;
      background = currentOption.background;
      story = currentOption.currentStory;
      option1Text = currentOption.option1;
      option2Text = currentOption.option2;
      option1Next = currentOption.option1Next;
      option2Next = currentOption.option2Next;
    });
  }


  Card getStory(String story, double margin, double padding) {
    return Card (
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                    elevation: 5,
                    margin: EdgeInsets.all(margin),
                    child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: Text('$story',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 10,
                        textAlign: TextAlign.justify,
                        ),
                  ),
                  );
  }

  Widget getOption (String option) {
    return 
    Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      color: Colors.blueGrey,
      child: Text(option,
      overflow: TextOverflow.ellipsis,
      maxLines: 10,
      textAlign: TextAlign.justify,
      style: TextStyle(color: Colors.white),
      )
    );
  }

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          centerTitle: true,
          title: Text("Play Your Own Destiny"),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/$background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  getStory(story, 15.0, 20.0),
                  SizedBox(
                    height: 10.0,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          setState(() {
                            if (option1Next != -1) {
                            updateCurrentOption(option1Next); 
                            }
                            else {
                              exit(0);
                            }
                          });
                        },
                        child: getOption("$option1Text"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          if (option2Next != -1) {
                            updateCurrentOption(option2Next); 
                            }
                            else {
                              exit(0);
                            }
                        },
                        child: getOption("$option2Text"),
                      ),
                    ],
                  ),
                  
                ],
              ),
          ],
        ),
      ),
    );
  }
}