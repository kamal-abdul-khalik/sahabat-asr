import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class CardMember extends StatefulWidget {
  final String status;
  final Color color;
  final String role;
  final String joined;
  final String myName;
  const CardMember(
      {super.key,
      required this.status,
      required this.color,
      required this.role,
      required this.joined,
      required this.myName});

  @override
  State<CardMember> createState() => _CardMemberState();
}

class _CardMemberState extends State<CardMember> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryColor,
              secondaryColor,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sahabat ASR",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800),
                ),
                Image.asset(
                  "assets/icon/logo-card.png",
                ),
              ],
            ),
            Text(
              widget.status,
              style: TextStyle(
                  color: widget.color,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.role,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      widget.joined,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.myName,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
