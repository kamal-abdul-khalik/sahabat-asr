import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';
import 'package:kta_asr/service/news_service.dart';

class NewsController extends State<NewsView> implements MvcController {
  static late NewsController instance;
  late NewsView view;

  @override
  void initState() {
    instance = this;
    getNewsList();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List newsList = [];
  getNewsList() async {
    try {
      Map obj = await NewsService.getAllNews();
      newsList = obj['data']['data'];
    } catch (e) {
      showInfoDialog(e.toString());
    }
  }
}
