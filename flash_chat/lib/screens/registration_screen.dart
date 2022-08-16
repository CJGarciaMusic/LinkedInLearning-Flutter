import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';

import '../constants.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static const id = 'registration_screen';

  @override
  _RegistrationScreenState createState() {
    return _RegistrationScreenState();
  }

}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 200,
                  child: Image.asset('images/logo.png'),
                ),
            ),
            const SizedBox(
              height: 48,
            ),
            TextField(
              style: const TextStyle(color: Colors.black),
              onChanged: (value) {
                print(value);
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email')
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              style: const TextStyle(color: Colors.black),

              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
            ),
            const SizedBox(
              height: 24,
            ),
            Hero(
              tag: 'register',
              child: RoundedButton(
                color: Colors.blueAccent,
                title: 'Register',
                onPressed: () {print("yeah, need to make the register function");}
              ),
            ),


          ],
        ),
      ),
    );
  }
}