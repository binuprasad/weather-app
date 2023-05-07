import 'package:flutter/material.dart';

import '../consts/appconstants.dart';
import '../controller/search_controller.dart';

class PageviewWidget extends StatelessWidget {
  const PageviewWidget({
    super.key,
    required this.searchController,
  });

  final SearchController searchController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.height(context) * 0.2,
      child: PageView(
          scrollDirection: Axis.horizontal,
          controller: searchController.controller,
          onPageChanged: (num) {
            searchController.activeIndex.value = num;
          },
          children: searchController.list),
    );
  }
}
