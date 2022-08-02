import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key, this.locationWeather}) : super(key: key);
  final locationWeather;

  @override
  _LocationScreenState createState() {
    return _LocationScreenState();
  }
}

class _LocationScreenState extends State<LocationScreen> {

  WeatherModel weather = WeatherModel();
  int temperature = 0;
  String weatherIcon = '';
  String weatherMessage = '';
  String cityName = '';

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var conditionNumber = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      weatherIcon = weather.getWeatherIcon(conditionNumber);
      weatherMessage = weather.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8),
                BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    ElevatedButton(
                        onPressed: () async {
                          var weatherData = await weather.getLocationWeather();
                          updateUI(weatherData);
                        },
                        child: const Icon(
                          Icons.near_me,
                          size: 50,
                        )
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Icon(
                          Icons.location_city,
                          size: 50,
                        ),
                    ),
                  ],
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                     Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    )
                  ],
                )
              ),
               Padding(
                  padding: const EdgeInsets.only(right: 15),
                child: Text(
                  "$weatherMessage in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// double lon = decodedData['coord']['lon'];
// double lat = decodedData['coord']['lat'];
// String description = decodedData['weather'][0]['description'];
// double temp = decodedData['main']['temp'];
// int conditionNumber = decodedData['weather'][0]['id'];
// String cityName = decodedData['name'];
// print(lon);
// print(lat);
// print(description);
// print(temp);
// print(conditionNumber);
// print(cityName);