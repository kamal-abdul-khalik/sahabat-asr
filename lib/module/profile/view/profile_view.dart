import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        actions: const [],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.grey[100],
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: primaryColor,
                      ),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: CircleAvatar(
                          radius: 36.0,
                          backgroundImage: NetworkImage(
                            "https://i.ibb.co/PGv8ZzG/me.jpg",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: ProfileMenu(
                        text: "Informasi Profil",
                        icon: Icons.person,
                        onTap: () => print("Profil"),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(1),
                    children: [
                      ProfileMenu(
                        text: "Menu Koordinator",
                        icon: Icons.person_add,
                        textColor: Colors.blueAccent,
                        containerIconColor: Colors.blueAccent,
                        onTap: () => Get.to(const LeaderView()),
                      ),
                      const SizedBox(height: 10.0),
                      ProfileMenu(
                          text: "Pengaturan",
                          icon: Icons.settings,
                          onTap: () => print("Pengaturan")),
                      ProfileMenu(
                          text: "Pusat Bantuan",
                          icon: Icons.help,
                          onTap: () => print("Bantuan")),
                      ProfileMenu(
                          text: "Hubungi Kami",
                          icon: Icons.contact_support,
                          onTap: () => print("Support")),
                      ProfileMenu(
                          text: "Bagikan",
                          icon: Icons.share,
                          onTap: () => print("Bagikan")),
                      ProfileMenu(
                          text: "Beri Rating",
                          icon: Icons.star,
                          onTap: () => print("Rating")),
                      const SizedBox(height: 10.0),
                      ProfileMenu(
                        text: "Keluar",
                        textColor: Colors.red,
                        containerIconColor: Colors.red,
                        icon: Icons.logout,
                        onTap: () => controller.doLogout(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
