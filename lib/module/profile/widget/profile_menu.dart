import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class ProfileMenu extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Color? color;
  final Color? textColor;
  final Color? iconColor;
  final Color? containerIconColor;
  final void Function()? onTap;
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.onTap,
    required this.icon,
    this.color,
    this.containerIconColor,
    this.iconColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10),
        child: Container(
          alignment: Alignment.center,
          height: 80.0,
          decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                16.0,
              ),
            ),
          ),
          child: ListTile(
            leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: containerIconColor ?? primaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    5.0,
                  ),
                ),
              ),
              child: Icon(
                color: iconColor ?? Colors.white,
                icon ?? Icons.person,
              ),
            ),
            minLeadingWidth: 0.0,
            title: Text(
              "$text",
              style: TextStyle(
                color: textColor ?? Colors.black,
              ),
            ),
            trailing: const SizedBox(
              width: 25,
              child: Icon(
                Icons.chevron_right,
                size: 30.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
