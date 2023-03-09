import 'package:flutter/material.dart';
import 'package:kta_asr/state_util.dart';
import '../view/news_single_view.dart';

class NewsSingleController extends State<NewsSingleView> implements MvcController {
  static late NewsSingleController instance;
  late NewsSingleView view;

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