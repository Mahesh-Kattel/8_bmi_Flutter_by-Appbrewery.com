import 'package:bmi/constrains.dart';
import 'package:flutter/material.dart';
import 'package:bmi/Reusable_card.dart';

import 'bmi.dart';

class ResultPage extends StatelessWidget {
  final String BmiResult;
  final String Resulttext;
  ResultPage({Key? key, required this.BmiResult, required this.Resulttext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your Health Status',
                  style: resultTextStyle,
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: reusableCard(
                  CardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        BmiResult,
                        style: kkresultTextStyle,
                      ),
                      Text(
                        Resulttext,
                        textAlign: TextAlign.center,
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  color: inactiveCardColor,
                )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => BMI()));
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'RE CALCULATE',
                      style: largebuttonTextStyle,
                    ),
                  ),
                  height: bottomContainerheight,
                  decoration: BoxDecoration(
                      color: bottomContainerColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
