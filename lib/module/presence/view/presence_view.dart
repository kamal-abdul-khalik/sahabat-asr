import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';
import '../controller/presence_controller.dart';

class PresenceView extends StatefulWidget {
  const PresenceView({Key? key}) : super(key: key);

  Widget build(context, PresenceController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Presence"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<PresenceView> createState() => PresenceController();
}