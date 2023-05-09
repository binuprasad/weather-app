import 'dart:developer';

import 'package:dio/dio.dart';

import '../model/weather_model.dart';

class WeatherServices {
  static final Dio dio = Dio(BaseOptions());
  static Future<WeatherModel?> weatherdatas() async {
    try {
      final Response response = await dio.get(
        'http://api.openweathermap.org/data/2.5/forecast?id=524901&appid=e2e3e507e74b6d2455338b141cde48a2',
      );

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {

        final value=WeatherModel.fromJson(response.data);
  log(" response=====================${value.city}");
  return value;
      }
    } catch (e) {
      log('something error occured $e');
    }
    return null;
  }
}
