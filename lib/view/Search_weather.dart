import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/geolocator.dart';
import 'package:weather_app/view/search_result.dart';
import 'package:weather_app/widgets/rain_container_widget.dart';
import '../consts/appconstants.dart';
import '../controller/search_controller.dart';
import '../widgets/graph_container_widget.dart';
import '../widgets/page_view_widget.dart';
import '../widgets/searchbar_widget.dart';
import '../widgets/smooth_page_indicator_widget.dart';
import '../widgets/weather_details_container_widget.dart';

class SearchWeather extends StatelessWidget {
  SearchWeather({super.key});
  final geoLocatorController = Get.put(LocationController());
  final searchController = Get.put(SearchingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppConstants.height30,
              SearchBarWidget(searchController: searchController),
              Obx(
                () => searchController.isSearch.value
                    ? SearchResult()
                    : Column(
                        children: [
                          AppConstants.height20,
                          SmoothIndicatorWidget(
                              searchController: searchController),
                          AppConstants.height30,
                          PageviewWidget(searchController: searchController),
                          AppConstants.height10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => Text(
                                  geoLocatorController.currentAddress.value,
                                  // searchController.checkLoading().isTrue?const Text('............'): Text(
                                  //   searchController.city.value,
                                  // searchController.result?.city.name??'Hyderabad',
                                  // searchController
                                  //     .location[searchController.activeIndex.value],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.black),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  searchController.weatherData();
                                },
                                child: const ImageIcon(
                                  AssetImage('assets/navigation.png'),
                                ),
                              ),
                            ],
                          ),
                          AppConstants.height10,
                          Text(
                            //  "${ searchController.weather.first.main.humidity.toString()}°??"emmpty",
                            '${searchController.result?.main.humidity??'Loading....'}°',
                            style: const TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                          AppConstants.height10,
                          searchController.activeIndex.value == 1
                              ? const RainContainerWidget()
                              : Container(),
                          AppConstants.height10,
                          WeatherDetailsContainerWidget(
                            searchController: searchController,
                          ),
                          AppConstants.height10,
                          const GraphContainerWidget()
                        ],
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
