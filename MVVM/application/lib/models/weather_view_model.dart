import 'package:application/models/weather_model.dart';
import 'package:application/repository/weather_repository.dart';
import 'package:flutter/foundation.dart';

class WeatherViewModel with ChangeNotifier {
  WeatherModel? model;

  Future<void> getWeather(String city) async {
    final weather = await WeatherRepository().getWeather(city);
    model = weather;

    notifyListeners();
  }

  WeatherModel? get weather => model;
}
