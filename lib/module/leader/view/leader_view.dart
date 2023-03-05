import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';
import 'package:kta_asr/module/leader/widget/list_view_member.dart';
import 'package:kta_asr/shared/widget/form/list/k_list_view.dart';

class LeaderView extends StatefulWidget {
  const LeaderView({Key? key}) : super(key: key);

  Widget build(context, LeaderController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "Daftar Member",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await Get.to(const AddMemberView());
              // await controller.getMemberList();
            },
            icon: const Icon(
              color: Colors.white,
              Icons.add,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: KListView(
                enableSearch: true,
                future: (page, search) async {
                  return await MemberService.getAllMember(page, search);
                },
                itemBuilder: (Map item, int index) {
                  return ListViewMember(
                    imageUrl: item['image_selfie'] ??
                        "https://i.ibb.co/S32HNjD/no-image.jpg",
                    trailing: item['is_active'] == 1
                        ? IconButton(
                            onPressed: () async =>
                                await Get.to(ProfileMemberView(member: item)),
                            icon: const Icon(
                              Icons.remove_red_eye,
                              size: 20.0,
                            ),
                          )
                        : const Text(
                            "Menunggu\n Verifikasi",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 11.0,
                            ),
                          ),
                    title: item['name'],
                    subtitle: item['member_code'],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<LeaderView> createState() => LeaderController();
}
