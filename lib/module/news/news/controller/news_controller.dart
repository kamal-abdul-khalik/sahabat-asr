import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class NewsController extends State<NewsView> implements MvcController {
  static late NewsController instance;
  late NewsView view;
  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
