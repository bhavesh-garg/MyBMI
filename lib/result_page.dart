import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'reuseble_card.dart';
import 'input_page.dart';

class resulltPage extends StatelessWidget {
  String bmi;
  String bodyType;
  String desc;
  Color displayColor;

  resulltPage({this.bmi, this.bodyType, this.desc, this.displayColor});
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
              child: Container(
                child: Center(
                  child: Text(
                    'Your Result',
                    style: kResultHaed,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReuseContainer(
                mecolor: kinactiveCardColor,
                cardWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      bodyType.toUpperCase(),
                      style: TextStyle(
                          color: displayColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    Text(
                      bmi.toUpperCase(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 100),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        desc.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ButtonWidget(
              buttonText: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
