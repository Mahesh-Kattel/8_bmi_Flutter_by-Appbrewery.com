import 'package:bmi/Functionality.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Icon_Content.dart';
import 'Result.dart';
import 'Reusable_card.dart';
import 'constrains.dart';

enum Gender {
  male,
  female,
}

class BMI extends StatefulWidget {
  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  Color maleCardColor = inactiveCardColor;
  Color FemaleCardColor = inactiveCardColor;
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: reusableCard(
                          color: selectedGender == Gender.male
                              ? activeCardColor
                              : inactiveCardColor,
                          CardChild: IconContent(
                            text: "Male",
                            icon: FontAwesomeIcons.mars,
                          )),
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: reusableCard(
                      color: selectedGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      CardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        text: 'Female',
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: reusableCard(
                color: inactiveCardColor,
                CardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: lebelTextStyle),
                        Text('CM', style: labelTextStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: const Color(0xffeb1555),
                          overlayColor: const Color(0xffeb155),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 10),
                          overlayShape:
                              const RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                          value: height.toDouble(),
                          inactiveColor: const Color(0xff828e90),
                          onChanged: (double newvalue) {
                            setState(() {
                              height = newvalue.round();
                            });
                          },
                          max: 220,
                          min: 120),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: reusableCard(
                      color: inactiveCardColor,
                      CardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: labelTextStyle,
                          ),
                          Text(
                            '$weight',
                            style: lebelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Mahesh(onPress: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                              RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  constraints: const BoxConstraints.tightFor(
                                      height: 55, width: 55),
                                  shape: const CircleBorder(
                                      side: BorderSide(color: Colors.black)),
                                  child: const Icon(FontAwesomeIcons.plus))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: reusableCard(
                        color: inactiveCardColor,
                        CardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Age',
                              style: labelTextStyle,
                            ),
                            Text(
                              '$age',
                              style: lebelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RawMaterialButton(
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    constraints: const BoxConstraints.tightFor(
                                        height: 55, width: 55),
                                    shape: const CircleBorder(
                                        side: BorderSide(color: Colors.black)),
                                    child: const Icon(FontAwesomeIcons.minus)),
                                RawMaterialButton(
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    constraints: const BoxConstraints.tightFor(
                                        height: 55, width: 55),
                                    shape: const CircleBorder(
                                        side: BorderSide(color: Colors.black)),
                                    child: const Icon(FontAwesomeIcons.plus))
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Functionality fn =
                      Functionality(weight: weight, height: height);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                BmiResult: fn.calculateBMI(),
                                Resulttext: fn.getResults(),
                              )));
                },
                child: Container(
                  height: bottomContainerheight,
                  decoration: BoxDecoration(
                      color: bottomContainerColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'CALCULATE',
                      style: largebuttonTextStyle,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Mahesh extends StatelessWidget {
  Function()? onPress;
  Mahesh({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPress,
        constraints: const BoxConstraints.tightFor(height: 55, width: 55),
        shape: const CircleBorder(side: BorderSide(color: Colors.black)),
        child: const Icon(FontAwesomeIcons.minus));
  }
}
