import 'package:flutter/material.dart';
import 'package:weather/screens/location_screen.dart';
import 'package:weather/screens/weather_forecast_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: WeatherForecastScreen(),
      home: LocationScreen(),
    );
  }
}