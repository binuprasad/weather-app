import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/consts/appconstants.dart';
import 'package:weather_app/controller/search_controller.dart';
import '../widgets/graph_container_widget.dart';
import '../widgets/weather_details_container_widget.dart';

class DetailPage extends StatelessWidget {
   DetailPage({super.key});
final searchcontroller = Get.put(SearchingController());
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
              child: Row(
                children: const [Text('Added to list'), Icon(Icons.done)],
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
              children: const [
                Text(
                  'Pune',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                ImageIcon(AssetImage('assets/navigation.png'))
              ],
            ),
            AppConstants.height10,
            const Text(
              '20°',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            AppConstants.height10,
            AppConstants.height10,
             WeatherDetailsContainerWidget(searchController: searchcontroller,),
            AppConstants.height10,
            const GraphContainerWidget()
          ],
        ),
      ),
    );
  }
}
