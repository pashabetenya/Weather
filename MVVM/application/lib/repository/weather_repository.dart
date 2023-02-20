import 'dart:convert';
import 'package:application/models/weather_model.dart';

import 'package:http/http.dart' as http;

class WeatherRepository {
  static const base = 'https://api.openweathermap.org/data/2.5/weather';
  static const key = '09a168472bff98496d4b68a622ac9405';

  Future<WeatherModel> getWeather(String city) async {
    final url = '$base?q=$city&appid=$key&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      return WeatherModel(
        city: json['name'],
        temperature: json['main']['temp'].toDouble(),
        condition: json['weather'][0]['description'],
        country: json['sys']['country'],
      );
    } else {
      throw Exception('Failed to load weather data.');
    }
  }
}
