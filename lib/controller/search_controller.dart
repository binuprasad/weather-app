import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/weather_model.dart';

import '../service/weather_service.dart';

class SearchController extends GetxController {
  RxBool isLoading = true.obs;
  RxDouble lattitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxBool isSearch = false.obs;
  var activeIndex = 0.obs;
  List<ListElement> weather = [];
WeatherModel? result;

  @override
  void onInit() {
    weatherData();
    // if (isLoading.isTrue) {
    //   getLocation();
    //   getAdress();
    // }
    super.onInit();
  }

  final searchFieldController = TextEditingController();
  PageController controller = PageController();
  List<String> location = ['Hyderabad', 'Mumbai', 'Pune'];
  List<String> temperature = ['31°', '20°', '25°'];
  List<Widget> list = <Widget>[
    Center(child: Image.asset('assets/cloudy.png')),
    Center(child: Image.asset('assets/sunriseandsunset.png')),
    Center(child: Image.asset('assets/sunny.png')),
  ];

  searchButtonOntap() {
    isSearch.value = !isSearch.value;
    update();
  }

  void weatherData() async {
   result = await WeatherServices.weatherdatas();
    log("=====================================${result?.city.country}--------------------------------------");

// weather= result?.city as List<ListElement> ;
    weather = result!.list;

   

    log("=====================================$weather--------------------------------------");

  }

  

  // getLocation() async {
  //   bool isServiceEnabled;
  //   isServiceEnabled = await Geolocator.isLocationServiceEnabled();
  //   LocationPermission locationPermission;
  //   if (!isServiceEnabled) {
  //     return Future.error('Location not enabled');
  //   }
  //   locationPermission = await Geolocator.checkPermission();
  //   if (locationPermission == LocationPermission.deniedForever) {
  //     return Future.error('requestlocation is deniedForever');
  //   } else if (locationPermission == LocationPermission.denied) {
  //     locationPermission = await Geolocator.requestPermission();
  //     if (locationPermission == LocationPermission.denied) {
  //       return Future.error('permision is denied');
  //     }
  //   }
  //   return await Geolocator.getCurrentPosition(
  //           desiredAccuracy: LocationAccuracy.high)
  //       .then((value) {
  //     lattitude.value = value.latitude;
  //     longitude.value = value.longitude;
  //     isLoading.value = false;
  //     log(lattitude.value.toString());
  //   });
  // }
  // getAdress() async {
  //   List<Placemark> placeMark =
  //       await placemarkFromCoordinates(lattitude.value, longitude.value);
  //   print(placeMark);
  // }
}
