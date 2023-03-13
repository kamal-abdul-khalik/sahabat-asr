import 'package:flutter/material.dart';
import 'package:kta_asr/config.dart';
import 'package:kta_asr/core.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: RichText(
          text: TextSpan(
            text: "${controller.myData['name']}\n",
            style: const TextStyle(fontSize: 16),
            children: [
              TextSpan(
                text: controller.hasRole['is_leader'] == true
                    ? "${controller.myData['referral_token']}"
                    : "${controller.myData['member_code']}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.qr_code,
              color: Colors.white,
              size: 24.0,
            ),
          ),
        ],
        backgroundColor: primaryColor,
        elevation: 0.0,
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.reload(),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              CardMember(
                  status: controller.myData['is_active'] == 0
                      ? 'TIDAK AKTIF'
                      : controller.hasRole['is_leader'] == true
                          ? "${controller.myData['referral_token']}"
                          : "${controller.myData['member_code']}",
                  color: controller.myData['is_active'] == 0
                      ? Colors.red
                      : Colors.white,
                  role: controller.hasRole['is_leader'] == true
                      ? 'Koordinator'
                      : 'Anggota',
                  joined: "${controller.myData['joined']}",
                  myName: "  \n ${controller.myData['name']}"),
              const SizedBox(height: 10.0),
              Builder(
                builder: (context) {
                  List images = controller.imageSliderList;
                  return Column(
                    children: [
                      CarouselSlider(
                        carouselController: controller.carouselController,
                        options: CarouselOptions(
                          height: 200.0,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            controller.currentIndex = index;
                            controller.setState(() {});
                          },
                        ),
                        items: images.map((thumbnail) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(6.0),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      '${AppConfig.urlImage}$thumbnail',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: images.asMap().entries.map((entry) {
                          bool isSelected =
                              controller.currentIndex == entry.key;
                          return GestureDetector(
                            onTap: () => controller.carouselController
                                .animateToPage(entry.key),
                            child: Container(
                              width: isSelected ? 30.0 : 15.0,
                              height: 8.0,
                              margin: const EdgeInsets.only(
                                right: 4.0,
                                top: 12.0,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    isSelected ? primaryColor : disabledColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20.0),
              if (controller.myData['member_code'] != null)
                const SectionText(text: 'Jadwal ASR'),
              if (controller.myData['member_code'] != null)
                Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 170,
                  child: ListView.builder(
                    itemCount: controller.schedules.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) {
                      var item = controller.schedules[index];
                      return ScheduleCard(
                        agendaTitle: item['title'],
                        place: item['place'],
                        date: item['date'],
                        start: item['start'],
                        end: item['end'],
                      );
                    },
                  ),
                ),
              const SizedBox(height: 20.0),
              SectionText(
                text: 'Kabar ASR',
                textButton: 'Lainnya...',
                onTap: () => Get.to(const NewsView()),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: controller.newsLimit.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    var item = controller.newsLimit[index];
                    return InkWell(
                      onTap: () => Get.to(NewsSingleView(news: item)),
                      child: NewsLimit(
                        imageUrl: AppConfig.urlImage + item['thumbnail'],
                        category: item['category']['name'],
                        title: item['title'],
                        createdAt: item['created_at'],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
