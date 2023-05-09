import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/consts/appconstants.dart';
import 'package:weather_app/controller/search_controller.dart';

import 'weather_details_widget.dart';

class WeatherDetailsContainerWidget extends StatelessWidget {
   const WeatherDetailsContainerWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.height(context) * 0.12,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          WeatherDetailsWidget(
            headerText: 'TIME',
            tailText: '11:45 AM',
          ),
          WeatherDetailsWidget(
            headerText: 'UV',
            tailText: '4',
          ),
          WeatherDetailsWidget(
            headerText: '% RAIN',
            tailText: '58%',
          ),
          WeatherDetailsWidget(
            headerText: 'AQ',
            tailText: '22',
          ),
        ],
      ),
    );
  }
}