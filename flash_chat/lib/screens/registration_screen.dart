import 'package:flutter/material.dart';

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
                //Do something with the user input.
              },
              decoration: const InputDecoration(
                hintText: 'Enter your email',
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding:
                EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              style: const TextStyle(color: Colors.black),

              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: const InputDecoration(
                hintText: 'Enter your password',
                hintStyle: TextStyle(color: Colors.grey),

                contentPadding:
                EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                elevation: 5,
                child: MaterialButton(
                  onPressed: () {
                    //Implement registration functionality.
                  },
                  minWidth: 200,
                  height: 42,
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}