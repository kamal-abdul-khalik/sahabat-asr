import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';
import 'package:kta_asr/service/schedule_service.dart';

class DashboardController extends State<DashboardView>
    implements MvcController {
  static late DashboardController instance;
  late DashboardView view;

  @override
  void initState() {
    instance = this;
    myProfile();
    imageSlider();
    asrSchedule();
    getNewsLimit();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  reload() async {
    myProfile();
    imageSlider();
    asrSchedule();
    getNewsLimit();
  }

  Map myData = {};
  Map hasRole = {};
  myProfile() async {
    Map obj = await AuthService.me();
    myData = obj['data'];
    hasRole = obj['meta'];
    setState(() {});
  }

  List schedules = [];
  asrSchedule() async {
    Map obj = await ScheduleService.getSchedule();
    schedules = obj['data'];
    setState(() {});
  }

  List newsLimit = [];
  getNewsLimit() async {
    Map obj = await NewsService.getNewsLimit();
    newsLimit = obj['data'];
    setState(() {});
  }

  List imageSliderList = [];
  imageSlider() async {
    Map obj = await SliderService.getAllSlider();
    var imageUrl = obj['data'];
    imageSliderList = imageUrl.map((item) => item['thumbnail']).toList();
    setState(() {});
  }
}
