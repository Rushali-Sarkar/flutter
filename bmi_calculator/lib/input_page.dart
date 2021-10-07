import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusablecard.dart';
import 'iconcontent.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'results_page.dart';
import 'calculator.dart';

class InputPage extends StatefulWidget {
  @override 
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
  Gender selectedGender = Gender.none;
  int height = 180; 
  int weight = 60;
  int age = 18;

  void updateColor(Gender selectedGender) {
    setState(() {
      if (selectedGender == Gender.male) {
      femaleCardColor = inactiveCardColor;
      maleCardColor = maleCardColor == inactiveCardColor ? activeCardColor: inactiveCardColor;
      selectedGender = maleCardColor == activeCardColor ? Gender.male : Gender.none;
      }
    else if (selectedGender == Gender.female) {
      maleCardColor = inactiveCardColor;
      femaleCardColor = femaleCardColor == inactiveCardColor ? activeCardColor: inactiveCardColor;
      selectedGender = femaleCardColor == activeCardColor ? Gender.female : Gender.none;
    }
    });
    
  }


  void alterNumber(value current, operation op) {
    setState(() {
      if (current == value.age) {
        if (op == operation.increase) {
          age++;
        }
        else if (op == operation.decrease) {
          age--;
        }
      }
      else if (current == value.weight) {
        if (op == operation.increase) {
          weight++;
        }
        else if (op == operation.decrease) {
          weight--;
        } 
      }
    });
  }



  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff0A0E21),
        title: Text("BMI Calculator"),
      ),
      body: 
      Column(children: <Widget>[
        Expanded(child: Row(children: <Widget>[
          Expanded(child: GestureDetector(
            onTap: () {
              updateColor(Gender.male);
            },
            child: ReuseableCard(maleCardColor, 
          IconContent(FontAwesomeIcons.mars, "MALE"),
          ),),),
          Expanded(child: GestureDetector(
            onTap: () {
              updateColor(Gender.female);
            },
            child: ReuseableCard(femaleCardColor, 
          IconContent(FontAwesomeIcons.venus, "FEMALE"),
          ),),),
          ],
          ),
          ),
        Expanded(child: Row(children: <Widget>[
          Expanded(child:ReuseableCard(activeCardColor,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text("HEIGHT", style: LabelTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(height.toString(),
              style: NumberTextStyle,),
              Text("cm",
              style: LabelTextStyle),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbColor: Color(0xFFEB1555),
              inactiveTrackColor: Color(0xFF8D8E98),
              activeTrackColor: Colors.white,
              overlayColor: Color(0x29EB1555),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0,),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0,)
            ),
            child: Slider(
               value: height.toDouble(),
               min: 120.0,
               max: 220.0,
               onChanged: (double newValue) {
                 setState(() {
                   height = newValue.round();
                 });
               },


          ),
          ),
          ],
          ),
          ),
          ),
          ],
          ),
          ),
        Expanded(child: Row(children: <Widget>[
         Expanded(child:ReuseableCard(activeCardColor,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("WEIGHT",
                  style: LabelTextStyle),
                  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(weight.toString(),
              style: NumberTextStyle,),
              Text("kg",
              style: LabelTextStyle),
            ],
          ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      
                      FloatingActionButton(
                        heroTag: "button1",
                        onPressed: () {
                          alterNumber(value.weight, operation.decrease);
                        },
                        child: Icon(FontAwesomeIcons.minus, color: Colors.white),
                        backgroundColor: Color(0xFF4C4F5E),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      FloatingActionButton(
                        heroTag: "button2",
                        onPressed: () {
                          alterNumber(value.weight, operation.increase);
                        },
                        child: Icon(FontAwesomeIcons.plus, color: Colors.white),
                        backgroundColor: Color(0xFF4C4F5E),
                      ),
                     
                    ],
                  ),
                ],
              ),
            ],
            ),
            ),
            ),
            Expanded(child:ReuseableCard(activeCardColor,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("AGE",
                  style: LabelTextStyle),
                  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(age.toString(),
              style: NumberTextStyle,),
              Text("yrs",
              style: LabelTextStyle),
            ],
          ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     
                      
                      FloatingActionButton(
                        heroTag: "button3",
                        onPressed: () {
                          alterNumber(value.age, operation.decrease);
                        },
                        child: Icon(FontAwesomeIcons.minus, color: Colors.white),
                        backgroundColor: Color(0xFF4C4F5E),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                       FloatingActionButton(
                         heroTag: "button4",
                        onPressed: () {
                          alterNumber(value.age, operation.increase);
                        },
                        child: Icon(FontAwesomeIcons.plus, color: Colors.white),
                        backgroundColor: Color(0xFF4C4F5E),
                      ),
                    ],
                  ),
                ],
              ),
            ],
            ),
            ),
            ),
          
          ],
          ),
          ),
        GestureDetector(
          onTap: () {
            CalculatorBrain calc = CalculatorBrain(height, weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(calc.getResult(), calc.calculateBMI(), calc.getInterpretation())));
          },
          child: Container(color: bottomContainerColor, 
        margin: EdgeInsets.only(top: 10.0), 
        width: double.infinity, 
        height: bottomContainerHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("CALCULATE",
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
