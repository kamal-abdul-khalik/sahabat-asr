import 'package:flutter/material.dart';

class SectionText extends StatelessWidget {
  final String text;
  final String? textButton;
  final void Function()? onPressed;
  const SectionText({
    super.key,
    required this.text,
    this.textButton,
    this.onPressed,
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
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () => onPressed,
            child: Text(
              textButton ?? '',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
