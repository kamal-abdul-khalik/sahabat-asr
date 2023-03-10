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
    getImageSlider();
    getSchedule();
    getNewsLimit();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  int currentIndex = 0;
  bool loading = false;
  final CarouselController carouselController = CarouselController();

  reload() async {
    myProfile();
    getImageSlider();
    getSchedule();
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
  getSchedule() async {
    loading = true;
    setState(() {});
    Map obj = await ScheduleService.getSchedule();
    schedules = obj['data'];
    loading = false;
    setState(() {});
  }

  List newsLimit = [];
  getNewsLimit() async {
    Map obj = await NewsService.getNewsLimit();
    newsLimit = obj['data'];
    setState(() {});
  }

  List imageSliderList = [];
  getImageSlider() async {
    Map obj = await SliderService.getAllSlider();
    var imageUrl = obj['data'];
    imageSliderList = imageUrl.map((item) => item['thumbnail']).toList();
    setState(() {});
  }
}
