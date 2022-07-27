// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const TempView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var icon = forecastList![0].getIconUrl();
    var temp = forecastList[0].temp!.day!.toStringAsFixed(0);
    var description = forecastList[0].weather![0].description?.toUpperCase();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            icon,
            scale: 0.6,
            color: Colors.black87,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                '$temp °C',
                style: TextStyle(
                  fontSize: 54,
                  color: Colors.black87,
                ),
              ),
              Text(
                '$description',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
