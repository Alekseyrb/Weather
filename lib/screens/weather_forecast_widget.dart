// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/models/weather_forecast_daily.dart';
import 'package:weather/widgets/bottom_list_view.dart';
import 'package:weather/widgets/city_view.dart';
import 'package:weather/widgets/detail_view.dart';
import 'package:weather/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast>? forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();
    forecastObject =
        WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);

    // forecastObject?.then((weather) {
    //   print(weather.list?[0].weather?[0].main);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Weather'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.location_city),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(height: 50),
                      CityView(snapshot: snapshot),
                      SizedBox(height: 50),
                      TempView(snapshot: snapshot),
                      SizedBox(height: 50),
                      DetailView(snapshot: snapshot),
                      SizedBox(height: 50),
                      BottomListView(snapshot: snapshot),
                    ],
                  );
                } else {
                  return const Center(
                    child: SpinKitDoubleBounce(
                      color: Colors.black87,
                      size: 100,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
