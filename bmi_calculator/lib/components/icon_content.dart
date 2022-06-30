import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({Key? key, required this.iconType, required this.labelString}) : super(key: key);

  final IconData iconType;
  final String labelString;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(iconType,
            color: Colors.white,
            size: 80),
        const SizedBox(height: 15),
        Text(labelString, style: kLabelTextStyle),
      ],
    );
  }
}