import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';
import '../controller/user_controller.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  Widget build(context, UserController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("User"),
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
  State<UserView> createState() => UserController();
}