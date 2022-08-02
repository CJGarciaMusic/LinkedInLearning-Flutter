import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class CityScreen extends StatefulWidget{
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() {
    return _CityScreenState();
  }
}

class _CityScreenState extends State<CityScreen> {

  String cityName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image:DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          )
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent.withOpacity(0.1),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent.withOpacity(0.1),
                  ),
                  onPressed: () {
                    if (cityName != '') {
                      Navigator.pop(context, cityName);
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'Get Weather',
                    style: kButtonTextStyle,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}