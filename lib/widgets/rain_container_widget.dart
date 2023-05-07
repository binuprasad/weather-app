import 'package:flutter/material.dart';
import 'package:weather_app/consts/appconstants.dart';

import 'weather_details_widget.dart';

class RainContainerWidget extends StatelessWidget {
  const RainContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.height(context) * 0.3,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      style: TextStyle(color: Colors.amber),
                    )
                  ],
                ),
                Row(
                  children: [
                    const WeatherDetailsWidget(
                      headerText: '% RAIN',
                      tailText: '58%',
                    ),
                    SizedBox(
                      width: AppConstants.width(context) * 0.06,
                    ),
                    const WeatherDetailsWidget(
                      headerText: 'EXP.TIME',
                      tailText: '02:00 PM',
                    ),
                  ],
                ),
                const Text(
                  'Expecting Rainfall',
                  style: TextStyle(fontSize: 20, color: Colors.amber),
                )
              ],
            ),
            Image.asset('assets/rain.png')
          ],
        ),
      ),
    );
  }
}
