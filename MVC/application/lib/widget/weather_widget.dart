// Task Statement:

// Create a widget that displays weather information on the application's main screen.

// Description:

// This widget uses data obtained from repository to display information about temperature,
// weather conditions, and city name.

import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final temperature = data['main']['temp'];
    final condition = data['weather'][0]['description'];
    final city = data['name'];
    final country = data['sys']['country'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 25.0),

        // Widget Text: City + Country.
        citytext(city: city, country: country),
        const SizedBox(height: 16.0),

        // Widget Text: Condition.

        conditiontext(condition: condition),
        const SizedBox(height: 16.0),

        // Widget Text: Temperature.

        temperaturetext(temperature: temperature),
      ],
    );
  }

  // A widget, that displays the text of the city + country.

  Widget citytext({
    required String city,
    required String country,
  }) {
    return Text(
      '$city, $country',
      style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
    );
  }

  // A widget, that displays the text of the condition.

  Widget conditiontext({
    required String condition,
  }) {
    return Text(
      condition,
      style: const TextStyle(fontSize: 24.0),
    );
  }

  // A widget, that displays the text of the temperature.

  Widget temperaturetext({required double temperature}) {
    return Text(
      '$temperature °C',
      style: const TextStyle(fontSize: 64.0, fontWeight: FontWeight.bold),
    );
  }
}
