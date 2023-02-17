import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  Widget build(context, MainNavigationController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 5,
      initialIndex: controller.selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex,
          children: const [
            DashboardView(),
            NewsView(),
            PresenceView(),
            FavoriteView(),
            ProfileView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: (newIndex) => controller.updateIndex(newIndex),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.home,
              ),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.newspaper,
              ),
              label: "Kabar ASR",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.barcodeScan,
              ),
              label: "Kunjungan",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.bagPersonal,
              ),
              label: "Referral",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profil",
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<MainNavigationView> createState() => MainNavigationController();
}
