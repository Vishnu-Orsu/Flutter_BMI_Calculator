import 'package:bmi_calculator/Components/Buttons.dart';
import 'package:bmi_calculator/Components/DrawCard.dart';
import 'package:bmi_calculator/Components/constants.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  Results({@required this.bmi, @required this.result, @required this.remark});
  final String bmi;
  final String result;
  final String remark;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kTitle,
                )),
          ),
          Expanded(
            flex: 5,
            child: DrawContainer(
              colour: kActiveColor,
              drawChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    result,
                    style: kResult,
                  ),
                  Text(
                    bmi,
                    style: kBMI,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      remark,
                      style: kBodyText,
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            text: 'Re-CALCULATE',
            onTapped: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
