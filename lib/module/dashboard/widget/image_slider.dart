import 'package:flutter/material.dart';
import 'package:kta_asr/config.dart';
import 'package:kta_asr/core.dart';

class ImageSlider extends StatefulWidget {
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  const ImageSlider({super.key, this.onPageChanged});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  @override
  void initState() {
    imageSlider();
    super.initState();
  }

  List imageSliderList = [];
  imageSlider() async {
    Map obj = await SliderService.getAllSlider();
    var imageUrl = obj['data'];
    imageSliderList = imageUrl.map((item) => item['thumbnail']).toList();
    setState(() {});
  }

  reload() async {
    imageSlider();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        List images = imageSliderList;
        return Column(
          children: [
            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  currentIndex = index;
                  setState(() {});
                },
              ),
              items: images.map((thumbnail) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
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
                bool isSelected = currentIndex == entry.key;
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: isSelected ? 30.0 : 15.0,
                    height: 8.0,
                    margin: const EdgeInsets.only(
                      right: 4.0,
                      top: 12.0,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? primaryColor : disabledColor,
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
    );
  }
}
