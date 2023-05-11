import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/search_controller.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({
    super.key,
    required this.searchController,
  });

  final SearchingController searchController;
  final searchControllers = Get.put(SearchingController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: TextField(
          controller: searchController.searchFieldController,
          decoration: InputDecoration(
            hintText: 'Search Location',
              suffixIcon: GetBuilder<SearchingController>(
                builder: (controller) => IconButton(
                    onPressed: () {
                      searchControllers.searchButtonOntap();
                      log(searchController.isSearch.value.toString());
                    },
                    icon: const Icon(Icons.search)),
              ),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
