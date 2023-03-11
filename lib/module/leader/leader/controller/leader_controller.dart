import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class LeaderController extends State<LeaderView> implements MvcController {
  static late LeaderController instance;
  late LeaderView view;

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
