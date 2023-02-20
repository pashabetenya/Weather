// Task Statement:

// Create a main widget for the application, that will use repository and weather widget to retrieve,
// and display weather information.

// Description:

// This widget creates an instance of repository and uses http.Client() to create an HTTP client.
// The widget then creates a TextField to enter the name of the city,
// a button to retrieve the weather data, and a weather widget to display the weather information.

// When the user clicks the button, the widget uses repository to retrieve the weather data,
// and updates the interface with setState.

import 'package:application/widget/weather_widget.dart';
import 'package:application/repository/weather_repository.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late final WeatherRepository repository;

  final controller = TextEditingController();
  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();

    repository = WeatherRepository(client: http.Client());
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Future<void> answer() async {
    const key = '09a168472bff98496d4b68a622ac9405';
    final city = controller.text;

    final weather = await repository.getWeather(city, key);

    setState(() {
      data = weather;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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

              // Widget TextForm: City.

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: textform(),
              ),
              const SizedBox(height: 40.0),

              // Widget Button: Get Weather.

              ElevatedButton(
                onPressed: answer,

                // Widget Text: Button.
                child: buttontext(),
              ),

              // The result is displayed.

              if (data != null) WeatherWidget(data: data!),
            ],
          ),
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

  // A widget, that displays the text form of the city.

  Widget textform() {
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
