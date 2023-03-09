import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class SectionText extends StatelessWidget {
  final String text;
  final String? textButton;
  final Function()? onTap;
  const SectionText({
    super.key,
    required this.text,
    this.textButton,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              textButton ?? '',
              style: TextStyle(
                color: primaryColor,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
