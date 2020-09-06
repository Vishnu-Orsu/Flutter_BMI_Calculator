import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:bmi_calculator/Calculator.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTapped, @required this.text});
  final Function onTapped;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Center(
            child: Text(
          text,
          style: kBottomLabel,
        )),
        margin: EdgeInsets.only(top: 10.0),
        color: kBottomBarColor,
        width: double.infinity,
        height: kBottomBarheight,
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  RoundedButton({@required this.icon, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
      fillColor: Color(0x154C4F5E),
      child: Icon(
        icon,
      ),
    );
  }
}
