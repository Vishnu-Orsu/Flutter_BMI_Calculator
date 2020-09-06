import 'package:flutter/material.dart';

class DrawContainer extends StatelessWidget {
  final Color colour;
  final Widget drawChild;
  final Function onPress;
  DrawContainer({@required this.colour, this.drawChild, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: drawChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(15),
      ),
    );
  }
}
