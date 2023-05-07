import 'package:flutter/material.dart';

import '../consts/appconstants.dart';
import 'richtext_widget.dart';

class GraphContainerWidget extends StatelessWidget {
  const GraphContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.height(context) * 0.40,
      width: AppConstants.width(context),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SUNRISES & SUNSET',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500),
            ),
            AppConstants.height30,
            Image.asset('assets/graph.png'),
            AppConstants.height20,
            RichTextWidget(
              firstText: 'Legth of day:',
              secondText: '13H 12M',
            ),
            AppConstants.height10,
            RichTextWidget(
              firstText: 'Remaining daylight:',
              secondText: '9H 22M',
            ),
          ],
        ),
      ),
    );
  }
}

