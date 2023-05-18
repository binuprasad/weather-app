import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/consts/appconstants.dart';
import 'package:weather_app/controller/search_controller.dart';
import '../controller/geolocator.dart';
import '../widgets/graph_container_widget.dart';
import '../widgets/weather_details_container_widget.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});
  final searchcontroller = Get.put(SearchingController());
  final geoLocatorController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.chevron_left_sharp,
              color: Colors.black,
              size: 30,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {},
              child: const Row(
                children: [Text('Added to list'), Icon(Icons.done)],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppConstants.height30,
            Image.asset('assets/sunny.png'),
            AppConstants.height10,
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                 geoLocatorController.currentAddress.value,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const ImageIcon(AssetImage('assets/navigation.png'))
              ],
            ),
            AppConstants.height10,
             Text(
            searchcontroller.result!.main.humidity.toString(),
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            AppConstants.height20,
            WeatherDetailsContainerWidget(
              searchController: searchcontroller,
            ),
            AppConstants.height10,
            const GraphContainerWidget()
          ],
        ),
      ),
    );
  }
}
