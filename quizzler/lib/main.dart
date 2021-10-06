import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int corrects = 0;
  int total = 0;
  QuizBrain quiz_brain = QuizBrain();
  List<Widget> scoreKeeper = [];
  void addIcon(bool answer) {
    bool isCorrect = answer == quiz_brain.getAnswer();
    total += 1;
    if (isCorrect) {
      setState((){
        corrects++;
      });
    }
    IconData icon = isCorrect ? Icons.check: Icons.close;
    Color iconColor = isCorrect ? Colors.green: Colors.red;
    setState(() {
        scoreKeeper.add(
          Icon(
            icon,
            color: iconColor,
          )
        );
    });
  }

  void next(bool answer) {
    if (total == quiz_brain.getTotal()) {
      Alert(
        context: context,
        type: AlertType.warning,
        title: "Quiz Ended",
        desc: "Your Score is $corrects out of 13.",
        buttons: [
          DialogButton(
            child: Text(
              "Replay",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () =>  Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      setState(() {
          scoreKeeper = [];
          corrects = 0;
          total = 0;
    });
      quiz_brain.reinitialize();
    }
    else {
      addIcon(answer);
      setState(() {
        quiz_brain.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
              quiz_brain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                next(true);
                },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
               next(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
