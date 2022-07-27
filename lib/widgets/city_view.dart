import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather/models/weather_forecast_daily.dart';
import 'package:weather/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const CityView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var city = snapshot.data?.city?.name;
    var country = snapshot.data?.city?.country;
    var date = DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000); 
    return Container(
      child: Column(
        children: [
          Text(
            '$city, $country',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.black87,
            ),
          ),
          Text(
            Util.getDateFormated(date),
            style: const TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
