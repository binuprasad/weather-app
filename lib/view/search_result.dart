import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/consts/appconstants.dart';
import 'package:weather_app/controller/search_controller.dart';
import 'package:weather_app/view/detail_page.dart';

import '../controller/geolocator.dart';

class SearchResult extends StatelessWidget {
  SearchResult({super.key});
  final searchController = Get.put(SearchingController());
  final geoLocatorController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppConstants.height10,
        Wrap(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              child: const Text('Mumbai'),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              child: const Text('Pune'),
            )
          ],
        ),
        AppConstants.height20,
        GestureDetector(
          onTap: () => Get.to(DetailPage()),
          child: Container(
            height: AppConstants.height(context) * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade200),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        geoLocatorController.currentAddress.value,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                       Text(
                        searchController.result!.main.humidity.toString(),
                        style:const TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.warning,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: AppConstants.width(context) * 0.03,
                          ),
                          const Text(
                            'WARNING',
                            style: TextStyle(color: Colors.amber, fontSize: 16),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/cloudy.png'),
                      const Text(
                        'Expecting Rainfall',
                        style: TextStyle(color: Colors.amber, fontSize: 16),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
