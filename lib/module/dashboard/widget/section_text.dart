import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class SectionText extends StatelessWidget {
  final String text;
  final String textButton;
  const SectionText({super.key, required this.text, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () => Get.to(const NewsView()),
            child: Text(
              textButton,
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
