import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class OnBoardingController extends State<OnBoardingView>
    implements MvcController {
  static late OnBoardingController instance;
  late OnBoardingView view;

  @override
  void initState() {
    instance = this;
    AuthService.authCheck();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();
}
