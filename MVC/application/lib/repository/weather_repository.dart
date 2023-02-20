// Task Statement:

// To retrieve weather data from the OpenWeatherMap API, need to create a class,
// that will work with the API and retrieve the data.

// Description:

// - The getWeather method performs a query with the specified city name and API key,
//   using units of the metric system.
//   The method returns data that we can use to display weather information.

import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherRepository {
  WeatherRepository({
    required this.client,
  });

  static const base = 'https://api.openweathermap.org/data/2.5/weather';
  final http.Client client;

  Future<Map<String, dynamic>> getWeather(String city, String key) async {
    final url = '$base?q=$city&appid=$key&units=metric';
    final response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to load weather data.');
    }

    final data = json.decode(response.body);

    return data;
  }
}
