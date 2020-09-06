import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Components/DrawCard.dart';
import '../Components/IconContent.dart';
import '../Components/constants.dart';
import 'package:bmi_calculator/Screens/results_page.dart';
import '../Components/Buttons.dart';
import 'package:bmi_calculator/Calculator.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //GenderCards
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: DrawContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveColor
                        : kInactiveColor,
                    drawChild: IconContent(
                      icone: FontAwesomeIcons.mars,
                      sex: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: DrawContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveColor
                        : kInactiveColor,
                    drawChild: IconContent(
                      icone: FontAwesomeIcons.venus,
                      sex: 'FEMALE',
                    ),
                  ),
                ),
              ],
            )),
            //MiddleSliderWidget
            Expanded(
              child: DrawContainer(
                colour: kActiveColor,
                drawChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kBoldLabel,
                        ),
                        Text(
                          'cm',
                          style: kLabelStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 8),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF888993),
                          thumbColor: Colors.pink,
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 20),
                          overlayColor: Color(0x29EB1555)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 50.0,
                          max: 250.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: DrawContainer(
                    colour: kActiveColor,
                    drawChild: Column(
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBoldLabel,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: DrawContainer(
                    colour: kActiveColor,
                    drawChild: Column(
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBoldLabel,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
            //BottomBar
            BottomButton(
                onTapped: () {
                  Calculator calc =
                      Calculator(cheight: height, cweight: weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Results(
                                bmi: calc.calculate(),
                                result: calc.getResult(),
                                remark: calc.getRemarks(),
                              )));
                },
                text: 'CALCULATE')
          ],
        ));
  }
}
