import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/weather_model.dart';
import '../service/weather_service.dart';

class SearchingController extends GetxController {
  var dt = DateTime.now()..obs;
  RxBool isLoading = true.obs;
  RxDouble latitude_ = 0.0.obs;
  RxDouble longitude_ = 0.0.obs;
  RxBool isSearch = false.obs;
  var activeIndex = 0.obs;
  RxBool checkLoading() => isLoading;
  RxDouble checkLatitude() => latitude_;
  RxDouble checkLongitude() => longitude_;
  // final city = ''.obs;
  List<WeatherModel> weather = [];
  WeatherModel? result;

  @override
  void onInit()async{
    // getAdress(checkLatitude().value, checkLongitude().value);
    if (isLoading.isTrue) {
   await   getLocation();
    }
    weatherData();

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
    result = await WeatherServices.weatherdatas(
        latitude_.value.toString(), longitude_.value.toString());
        log('clouds inn ${result!.main.humidity}');
        log('temp inn ${result!.main.temp}');


// weather= result?.city as List<ListElement> ;
    // weather = result!.name as List<WeatherModel>;

    log("=====================================$weather--------------------------------------");
  }

  getLocation() async {
    bool isServiceEnabled;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission locationPermission;
    if (!isServiceEnabled) {
      return Future.error('Location not enabled');
    }
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('requestlocation is deniedForever');
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('permision is denied');
      }
    }
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      latitude_.value = value.latitude;
      longitude_.value = value.longitude;
      isLoading.value = false;
      log(latitude_.value.toString());
    });
  }

  // getAdress(lat, lon) async {
  //   List<Placemark> placeMark = await placemarkFromCoordinates(lat, lon);
  //   Placemark place = placeMark[0];

  //   print('placemark-----------$placeMark');
  // }
}
