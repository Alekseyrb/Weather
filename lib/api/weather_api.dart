import 'dart:convert';
import 'dart:developer';

import 'package:weather/models/weather_forecast_daily.dart';
import 'package:weather/utilities/constans.dart';
import 'package:http/http.dart' as http;
import 'package:weather/utilities/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? cityName, bool? isCity}) async {
    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String?> parameters;

    if (isCity == true) {
      var queryParameters = {
        'APPID': Constans.weatherAppId,
        'units': 'metric',
        'q': cityName,
      };
      parameters = queryParameters;
    } else {
       var queryParameters = {
        'APPID': Constans.weatherAppId,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };
      parameters = queryParameters;
    }

    var uri = Uri.https(Constans.weatherBaseUrlDomain,
        Constans.weatherForecastPath, parameters);

    log('reauest: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}
