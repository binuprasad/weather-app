import 'package:flutter/material.dart';
import 'package:weather_app/consts/appconstants.dart';
import 'package:weather_app/controller/search_controller.dart';

import 'weather_details_widget.dart';

class WeatherDetailsContainerWidget extends StatelessWidget {
  const WeatherDetailsContainerWidget({
    super.key,
    required this.searchController,
  });
  final SearchingController searchController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.height(context) * 0.12,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          WeatherDetailsWidget(
            headerText: 'TIME',
            tailText:
                '${searchController.dt.hour > 12 ? searchController.dt.hour - 12 : searchController.dt.hour}:${searchController.dt.minute}${searchController.dt.hour > 12 ? 'Pm' : 'Am'} ',
          ),
          WeatherDetailsWidget(
            headerText: 'UV',
            tailText: searchController.result?.main.temp.toString()??'2',
          ),
          const WeatherDetailsWidget(
            headerText: '% RAIN',
            tailText: '58%',
          ),
          WeatherDetailsWidget(
            headerText: 'AQ',
            tailText: searchController.result?.wind.speed.toString()??'20',
          ),
        ],
      ),
    );
  }
}
