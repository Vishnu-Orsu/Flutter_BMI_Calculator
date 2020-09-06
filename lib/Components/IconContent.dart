import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  final IconData icone;
  final String sex;
  IconContent({@required this.icone, @required this.sex});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icone,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          sex,
          style: kLabelStyle,
        )
      ],
    );
  }
}
