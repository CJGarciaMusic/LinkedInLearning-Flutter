import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static const id = 'registration_screen';

  @override
  _RegistrationScreenState createState() {
    return _RegistrationScreenState();
  }

}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
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
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email')
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                style: const TextStyle(color: Colors.black),

                onChanged: (value) {
                  password = value;
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
                  onPressed: () async {
                    // print(email);
                    // print(password);
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  }
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}