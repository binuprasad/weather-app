import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15,right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppConstants.height30,
                 SearchBarWidget(searchController: searchController),
                 Obx(() => searchController.isSearch.value? const SearchResult():      Column(
                children: [
                  
                  AppConstants.height20,
                  SmoothIndicatorWidget(searchController: searchController),
                  AppConstants.height30,
                  PageviewWidget(searchController: searchController),
                  AppConstants.height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => Text(
                          searchController
                              .location[searchController.activeIndex.value],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ),
                      const ImageIcon(AssetImage('assets/navigation.png'))
                    ],
                  ),
                  AppConstants.height10,
                  Obx(
                    () => Text(
                      searchController
                          .temperature[searchController.activeIndex.value],
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                  ),
                  AppConstants.height10,
                  Obx(
                    () => searchController.activeIndex.value == 1
                        ? const RainContainerWidget()
                        : Container(),
                  ),
                  AppConstants.height10,
                 const WeatherDetailsContainerWidget(),
                  AppConstants.height10,
                  const GraphContainerWidget()
                ],
              ), )
         
            ],
          ),
        ),
      ),
    );
  }
}


