import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

enum Sex {
  male,
  female,
  neither,
}

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kAppBackgroundColor,
        scaffoldBackgroundColor: kAppBackgroundColor,
      ),
      home: const InputPage(title: 'bloop',),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Sex? selectedSex;
  int height = 180;
  int weight = 60;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kAppBackgroundColor,
        title: const Text('BMI CALCULATOR', style: TextStyle(color: Colors.grey),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedSex = Sex.male;
                  });
                },
                colour: selectedSex == Sex.male ? kCardBackground : kInactiveCardColor,
                cardChild: const IconContent(iconType: FontAwesomeIcons.mars, labelString: "MALE"),
              )),
               Expanded(child: ReusableCard(
                 onPress: () {
                   setState(() {
                     selectedSex = Sex.female;
                   });
                 },
                colour: selectedSex == Sex.female ? kCardBackground : kInactiveCardColor,
                cardChild: const IconContent(iconType: FontAwesomeIcons.venus, labelString: "Female"),
              )),
            ],
          )),
          Expanded(child: ReusableCard(
            colour: kCardBackground,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("HEIGHT", style: kLabelTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(), style: kLargeCardText),
                    const Text('cm', style: kLabelTextStyle,)
                  ]
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
                    thumbColor: const Color(0xFFEB1555),
                    overlayColor: const Color(0x1FEB1555),
                    inactiveTrackColor: const Color(0xFF8d8e98)
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                  }),
                )
              ],
            ),
          )),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                colour: kCardBackground,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("WEIGHT", style: kLabelTextStyle,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget> [
                          Text(weight.toString(), style: kLargeCardText,),
                          const Text('kg', style: kLabelTextStyle,),
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        const SizedBox(width: 10,),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },),
                      ],
                    ),
                  ],
                ),
              )),
              Expanded(child: ReusableCard(
                colour: kCardBackground,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("AGE", style: kLabelTextStyle,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget> [
                          Text(age.toString(), style: kLargeCardText,),
                          const Text('yo', style: kLabelTextStyle,),
                        ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        const SizedBox(width: 10,),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },),
                      ],
                    ),
                  ],
                ),
              )),
            ],
          )),
          Container(
            color: kBottomContainerColor,
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ]
      )
      );
  }
}


class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, required this.icon, required this.onPressed}) : super(key: key);

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, color: Colors.white,),
      shape: const CircleBorder(),
        fillColor: const Color(0xFF4C4f5E),
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      elevation: 6,
      onPressed: onPressed,
    );
  }
}
