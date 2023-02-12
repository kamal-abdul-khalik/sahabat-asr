import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kta_asr/core.dart';

class DashboardController extends State<DashboardView>
    implements MvcController {
  static late DashboardController instance;
  late DashboardView view;

  @override
  void initState() {
    instance = this;
    authData();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();
  final storage = const FlutterSecureStorage();
  String? authName = '';
  String? authJoined = '';

  authData() async {
    authName = await storage.read(key: 'name');
    authJoined = await storage.read(key: 'joined');
    setState(() {});
  }
}
