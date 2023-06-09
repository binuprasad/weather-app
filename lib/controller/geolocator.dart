
import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
 static RxString latitude = ''.obs;
 static RxString longitude = ''.obs;
  RxString currentAddress = 'Unknown Location'.obs;
  dynamic currentPosition = Geolocator.getCurrentPosition().obs;
  RxString currentAdrressToFetchHome = 'unknown location'.obs;
  @override
  void onInit() async {
    await getCurrentPosition();
    log('oninit');
    super.onInit();
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Location Services disabled',
          'Location services are disabled. Please enable the services');

      return false;
      // openn post man
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('', 'Location permission are denied');

        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('',
          'Location permissions are permanently denied, we cannot request permissions.');

      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      getAddressFromLatLng(position);
    

    }).catchError(
      (e) {
        // log(e.toString());
      },
    );
  }

  Future<void> getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
      currentPosition!.latitude,
      currentPosition!.longitude,
    ).then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      


      currentAddress.value = '${place.locality},${place.administrativeArea}';
      currentAdrressToFetchHome.value = place.subAdministrativeArea!;
   
    }).catchError(
      (e) {
        // log(e.toString());
      },
    );
  }
}
