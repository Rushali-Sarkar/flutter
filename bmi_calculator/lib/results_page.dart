import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusablecard.dart';
import 'iconcontent.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {

  
  ResultPage(@required this.result, @required this.bmi, @required this.interpretation);
  final String result;
  final String interpretation;
  final String bmi;


  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      backgroundColor: Color(0xff0A0E21),
      title: Text('BMI Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
            child: Text("Your Result", 
            textAlign: TextAlign.center,
            style: TitleTextStyle),
          ),
            ],
          ),

          Expanded(
            flex: 5,
            child: ReuseableCard(activeCardColor, Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget> [
                Text(result,
                textAlign: TextAlign.center,
                style: ResultTextStyle),
                Text(bmi,
                textAlign: TextAlign.center,
                style: BMITextStyle),
                Text(interpretation,
                textAlign: TextAlign.center,
                style: BodyTextStyle),
                
              ],
            ),
            ),
          ),

          GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(color: bottomContainerColor, 
        margin: EdgeInsets.only(top: 10.0), 
        width: double.infinity, 
        height: bottomContainerHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("RE-CALCULATE",
        textAlign: TextAlign.center,
         
        style: LargeButtonStyle,),
          ],
        ),),
        ),
        ],
      ),
    );
  }
}