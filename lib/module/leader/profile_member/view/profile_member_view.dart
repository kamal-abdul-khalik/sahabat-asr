import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';
import '../controller/profile_member_controller.dart';

class ProfileMemberView extends StatefulWidget {
  final Map? member;
  const ProfileMemberView({Key? key, this.member}) : super(key: key);

  Widget build(context, ProfileMemberController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ProfileMember"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text("${member!['name']}"),
              const SizedBox(
                height: 30.0,
              ),
              Image.network(
                member!['imageSelfie'] ??
                    "https://i.ibb.co/S32HNjD/no-image.jpg",
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ProfileMemberView> createState() => ProfileMemberController();
}
