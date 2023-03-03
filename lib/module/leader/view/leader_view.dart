import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

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
              await controller.getMemberList();
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
            const SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 12.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16.0),
                ),
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey[300]!,
                ),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: null,
                      decoration: const InputDecoration.collapsed(
                        filled: true,
                        fillColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        hintText: "Search",
                      ),
                      onChanged: (value) {
                        controller.runFilter(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: controller.memberList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = controller.memberList[index];
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (detail) {},
                    confirmDismiss: (direction) async {
                      bool confirm = false;
                      await showDialog<void>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              'Peringatan',
                              style: TextStyle(),
                            ),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: [
                                  const Text(
                                      "Apakah anda yakin akan menghapus data: "),
                                  Center(
                                    child: Text(
                                      "${item['name']} ",
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  const Text(
                                    "Aksi ini bersifat permanen dan tidak dapat dikembalikan",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[600],
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("No"),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: () {
                                  confirm = true;
                                  Navigator.pop(context);
                                },
                                child: const Text("Yes"),
                              ),
                            ],
                          );
                        },
                      );
                      if (confirm) {
                        await controller.deleteMember(item['id']);
                        return Future.value(true);
                      }
                      return Future.value(false);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          backgroundImage: NetworkImage(
                            item['image_selfie'] ??
                                "https://i.ibb.co/S32HNjD/no-image.jpg",
                          ),
                        ),
                        trailing: item['is_active'] == 1
                            ? IconButton(
                                onPressed: () async => await Get.to(
                                    ProfileMemberView(member: item)),
                                icon: const Icon(
                                  Icons.remove_red_eye,
                                  size: 20.0,
                                ),
                              )
                            : const Text(
                                "Tidak Aktif",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 11.0,
                                ),
                              ),
                        title: Text("${item['name']}"),
                        subtitle: Text("${item['email']}"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<LeaderView> createState() => LeaderController();
}
