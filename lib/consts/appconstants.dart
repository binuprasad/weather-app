import 'package:flutter/material.dart';

class AppConstants {
  // final geoLocatorController = Get.put(LocationController());
  // final search = Get.put(SearchingController());

  static const height10 = SizedBox(
    height: 10,
  );
  static const height20 = SizedBox(
    height: 20,
  );
  static const height30 = SizedBox(
    height: 30,
  );
  static height(context) {
    return MediaQuery.of(context).size.height;
  }

  static width(context) {
    return MediaQuery.of(context).size.width;
  }
  //api key
static const String apikey = 'e2e3e507e74b6d2455338b141cde48a2';
//apiurl
static const String baseurl = 'api.openweathermap.org/data/2.5/forecast?id=524901&appid=';

}


