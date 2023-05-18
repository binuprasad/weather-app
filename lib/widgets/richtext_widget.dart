import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    super.key,
    required this.firstText,
    required this.secondText,
  });
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstText,
        style: TextStyle(color: Colors.grey.shade500),
        children: [
          TextSpan(
            text: secondText,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
