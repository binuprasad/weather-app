
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../consts/appconstants.dart';
import '../controller/search_controller.dart';

class SmoothIndicatorWidget extends StatelessWidget {
  const SmoothIndicatorWidget({
    super.key,
    required this.searchController,
  });

  final SearchingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppConstants.height(context) * 0.04,
        width: AppConstants.width(context) * 0.25,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10)),
        child: Obx(
          () => Center(
            child: AnimatedSmoothIndicator(
              activeIndex: searchController.activeIndex.value,
              count: 3,
              effect: const WormEffect(
                  radius: 9,
                  dotColor: Color.fromARGB(255, 27, 44, 59),
                  activeDotColor: Colors.grey,
                  dotHeight: 10,
                  dotWidth: 10),
            ),
          ),
        ),);
  }
}