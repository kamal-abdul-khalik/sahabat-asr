import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  Widget build(context, OnBoardingController controller) {
    controller.view = this;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/image/illustration background.png",
                width: 64.0,
                height: 64.0,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              textAlign: TextAlign.center,
              "Selamat Datang \n sahabat ASR",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            // const SizedBox(height: 30),
            Builder(
              builder: (context) {
                List messages = [
                  "consectetur adipiscing elit, sed do eiusmod laboris nisi ut aliquip ex ea commodo consequat.",
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                  "Dolor sit amet, consectetur adipiscing elit, uis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                  "Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                ];
                return Column(
                  children: [
                    CarouselSlider(
                      carouselController: controller.carouselController,
                      options: CarouselOptions(
                        height: 160.0,
                        autoPlay: true,
                        enlargeCenterPage: false,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          controller.currentIndex = index;
                          controller.setState(() {});
                        },
                      ),
                      items: messages.map((message) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.all(50),
                              child: Text(
                                textAlign: TextAlign.center,
                                "$message",
                                style: const TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: messages.asMap().entries.map((entry) {
                        bool isSelected = controller.currentIndex == entry.key;
                        return GestureDetector(
                          onTap: () => controller.carouselController
                              .animateToPage(entry.key),
                          child: Container(
                            width: isSelected ? 20 : 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.only(
                              right: 6.0,
                              top: 12.0,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xff40BB07)
                                  : const Color(0xff3c3e40),
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
            const SizedBox(height: 60),
            CircularProgressIndicator(color: primaryColor),
            const SizedBox(height: 30),
            const Text(
              "Sedang Mengecek token",
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<OnBoardingView> createState() => OnBoardingController();
}
