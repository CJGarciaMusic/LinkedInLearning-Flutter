import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

List<Color> myColors = [Colors.red, Colors.orange, Colors.yellow];

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  void playNote(int noteNum) {
    final myPlayer = AudioCache();
    myPlayer.play('note$noteNum.wav');
  }

  Expanded buildKey(Color barColor, int noteNum) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: barColor,
        ),
        onPressed: () {
          playNote(noteNum);
        },
        child: const Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(Colors.red, 1),
            buildKey(Colors.orange, 2),
            buildKey(Colors.yellow, 3),
            buildKey(Colors.green, 4),
            buildKey(Colors.teal, 5),
            buildKey(Colors.blue, 6),
            buildKey(Colors.purple, 7),
          ],
        ),
      ),
    ));
  }
}
