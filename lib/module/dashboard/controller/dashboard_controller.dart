import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class DashboardController extends State<DashboardView>
    implements MvcController {
  static late DashboardController instance;
  late DashboardView view;

  @override
  void initState() {
    instance = this;
    myProfile();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  Map myData = {};
  Map hasRole = {};
  myProfile() async {
    Map obj = await AuthService.me();
    myData = obj['data'];
    hasRole = obj['meta'];
    setState(() {});
  }
}
