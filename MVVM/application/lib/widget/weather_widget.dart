import 'package:application/models/weather_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherWidget extends StatelessWidget {
  WeatherWidget({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final view = Provider.of<WeatherViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Widget Text: Description.

            descriptiontext(),

            const SizedBox(height: 25.0),

            // Widget TextForm : City.

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: textform(context),
            ),

            const SizedBox(height: 40.0),

            // Widget Button: Get Weather.

            ElevatedButton(
              onPressed: () {
                final city = controller.text;
                Provider.of<WeatherViewModel>(context, listen: false).getWeather(city);
              },

              // Widget Text: Button.
              child: buttontext(),
            ),

            const SizedBox(height: 25.0),

            // Widget Text: City.

            if (view.weather != null)
              citytext(
                city: view.weather!.city,
                country: view.weather!.country,
              ),

            const SizedBox(height: 16.0),

            // Widget Text: Condition.

            if (view.weather != null)
              conditiontext(
                condition: view.weather!.condition,
              ),

            const SizedBox(height: 16.0),

            // Widget Text: Temperature.

            if (view.weather != null)
              temperaturetext(
                temperature: view.weather!.temperature,
              ),
          ],
        ),
      ),
    );
  }

  // A widget, that displays the text of the description.

  Widget descriptiontext() {
    return const Text(
      'Enter a city name to see the weather:',
      style: TextStyle(fontSize: 20.0),
    );
  }

  // A widget, that displays the text of the city.

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

  Widget temperaturetext({
    required double temperature,
  }) {
    return Text(
      '$temperature °C',
      style: const TextStyle(fontSize: 64.0, fontWeight: FontWeight.bold),
    );
  }

  // A widget, that displays the text form of the city.

  Widget textform(context) {
    return TextField(
      decoration: const InputDecoration(hintText: 'City..', border: OutlineInputBorder()),
      controller: controller,
    );
  }

  // A widget, that displays the text of the button.

  Widget buttontext() {
    return const Text('Get!');
  }
}
