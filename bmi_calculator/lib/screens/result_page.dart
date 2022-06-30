import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/screens/main.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.bmiResults, required this.resultText, required this.interpretation}) : super(key: key);

  final String bmiResults;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kAppBackgroundColor,
        title: const Text('BMI CALCULATOR',),),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     children: <Widget>[
       Expanded(child: Container(
         padding: const EdgeInsets.all(15),
           alignment: Alignment.bottomLeft,
           child: const Text("Your Results", style: kTitleTextStyle ,)),
       ),
       Expanded(
         flex: 5,
         child: ReusableCard(colour: kCardBackground,
         cardChild: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget> [
             Text(resultText.toUpperCase(), style: kResultTextStyle,),
             Text(
               bmiResults,
               style: kBMITextStyle,
             ),
             Text(interpretation, style: kBodyTextStyle,
             textAlign: TextAlign.center,)
           ],
         ),),
       ),
       BottomButton(
           buttonTitle: 'RE-CALCULATE',
           onTap:() {
            return Navigator.pop(context);
           }),
     ],
    )
    );
  }
}