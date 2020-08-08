import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Icon_data.dart';
import 'reuseble_card.dart';
import 'constant.dart';
import 'result_page.dart';
import 'Cal_Brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Color maleColor = kinactiveCardColor;
  Color femaleColor = kinactiveCardColor;
  int height = 180;
  int weight = 50;
  int age = 18;
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0D22),
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
//                            maleColor == inactiveCardColor
//                                ? maleColor = activeCardColor
//                                : maleColor = inactiveCardColor;
                            selectedGender = Gender.male;
                          });
                        },
                        child: ReuseContainer(
                            mecolor: selectedGender == Gender.male
                                ? kactiveCardColor
                                : kinactiveCardColor,
                            cardWidget: CardWidgetIcon(
                              wicon: FontAwesomeIcons.mars,
                              wtext: 'Male',
                            )))),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
//                      updateColor(Gender.female);
//                      femaleColor == inactiveCardColor
//                          ? femaleColor = activeCardColor
//                          : femaleColor = inactiveCardColor;
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReuseContainer(
                      mecolor: selectedGender == Gender.female
                          ? kactiveCardColor
                          : kinactiveCardColor,
                      cardWidget: CardWidgetIcon(
                        wtext: 'Female',
                        wicon: FontAwesomeIcons.venus,
                      )),
                )),
              ],
            ),
          ),
          Expanded(
            child: ReuseContainer(
              mecolor: kactiveCardColor,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: klableTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: ksliderText,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 100,
                    max: 200,
                    activeColor: Colors.blueAccent,
                    inactiveColor: Colors.blueGrey,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseContainer(
                    mecolor: Color(0xFF1D1F33),
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: klableTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: ksliderText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                weight++;
                              });
                            }),
                            SizedBox(
                              width: 15,
                            ),
                            RawButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                weight--;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseContainer(
                    mecolor: Color(0xFF1D1F33),
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: klableTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: ksliderText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                age++;
                              });
                            }),
                            SizedBox(
                              width: 15,
                            ),
                            RawButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                age--;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonWidget(
              buttonText: 'CALCULATE',
              onTap: () {
                CalBrain calB = CalBrain(weight: weight, height: height);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => resulltPage(
                              bmi: calB.calculateBmi(),
                              bodyType: calB.getBodyType(),
                              desc: calB.getDesc(),
                              displayColor: calB.getColor(),
                            )));
              })
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function onTap;
  ButtonWidget({this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueAccent.shade400,
        ),
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}

class RawButton extends StatelessWidget {
  final IconData icon;
  final Function onpressd;
  RawButton(this.icon, this.onpressd);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressd,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Colors.blueAccent,
      constraints: BoxConstraints.tightFor(
        height: 50.0,
        width: 50.0,
      ),
    );
  }
}
