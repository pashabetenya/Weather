import 'package:application/models/weather_view_model.dart';
import 'package:application/widget/weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherWidget(),
      builder: (context, child) {
        return ChangeNotifierProvider(
          create: (context) => WeatherViewModel(),
          child: child,
        );
      },
    );
  }
}
