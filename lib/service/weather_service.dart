import 'dart:developer';

import 'package:dio/dio.dart';

import '../model/weather_model.dart';

class WeatherServices {


  static final Dio dio = Dio(BaseOptions());
  static Future<WeatherModel?> weatherdatas() async {
    try {
      final Response response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=11.176832&lon=75.870227&appid=e2e3e507e74b6d2455338b141cde48a2',
      );

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final value = WeatherModel.fromJson(response.data);
        log('${value.weather.first.main} -------------response value printed');
        return value;
      }
    } catch (e) {
      log('something error occured $e');
    }
    return null;
  }
}
