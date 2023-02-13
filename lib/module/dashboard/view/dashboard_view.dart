import 'package:flutter/material.dart';
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
            text: "Hai, ",
            style: const TextStyle(fontSize: 16),
            children: [
              TextSpan(
                text: controller.myData['name'],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/image/header-dash.png",
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 55.0),
            // color: Colors.red,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.32,
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
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/icon/line-card-bg.png",
                        ),
                        Column(
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
                            const SizedBox(height: 15.0),
                            const Text(
                              "ASR-YYSIYU1002",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  textAlign: TextAlign.left,
                                  "Terdaftar \n ${controller.myData['joined']}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  textAlign: TextAlign.right,
                                  "  \n ${controller.myData['name']}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 5,
                  color: Colors.green[50],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(height: 20.0),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Sosial Media",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Image.asset(
                              "assets/icon/instagram@3x.png",
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Image.asset(
                              "assets/icon/facebook@3x.png",
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Image.asset(
                              "assets/icon/youtube@3x.png",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 35.0),
                      Builder(
                        builder: (context) {
                          List images = [
                            "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                            "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                            "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80",
                            "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
                            "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=710&q=80",
                          ];
                          return Column(
                            children: [
                              CarouselSlider(
                                carouselController:
                                    controller.carouselController,
                                options: CarouselOptions(
                                  height: 120.0,
                                  autoPlay: false,
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, reason) {
                                    controller.currentIndex = index;
                                    controller.setState(() {});
                                  },
                                ),
                                items: images.map((imageUrl) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(6.0),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              imageUrl,
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
                                        right: 6.0,
                                        top: 12.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? primaryColor
                                            : disabledColor,
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
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Kabar ASR",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          "PRODUCTIVITY",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "3 days ago",
                                          style: TextStyle(
                                            fontSize: 10.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    const Text(
                                      "7 Skills of Highly Effective Programmers",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    const Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 12.0,
                                          backgroundColor: Colors.grey[200],
                                          backgroundImage: const NetworkImage(
                                            "https://i.ibb.co/sqRTGfL/photo-1514543250559-83867827ecce-ixlib-rb-1-2.jpg",
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8.0,
                                        ),
                                        const Expanded(
                                          child: Text(
                                            "Ryan Blink",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.orange,
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          "Read more",
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orange,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
  State<DashboardView> createState() => DashboardController();
}
