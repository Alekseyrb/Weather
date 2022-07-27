import 'dart:convert';
import 'dart:developer';

import 'package:weather/models/weather_forecast_daily.dart';
import 'package:weather/utilities/constans.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity(
      {String? cityName}) async {
    var queryParameters = {
      'APPID': Constans.weatherAppId,
      'units': 'metric',
      'q': cityName,
    };

    var uri = Uri.https(Constans.weatherBaseUrlDomain,
        Constans.weatherForecastPath, queryParameters);
    
    log('reauest: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response.body}');

    if(response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}
