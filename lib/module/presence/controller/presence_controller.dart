import 'package:flutter/material.dart';
import 'package:kta_asr/state_util.dart';
import '../view/presence_view.dart';

class PresenceController extends State<PresenceView> implements MvcController {
  static late PresenceController instance;
  late PresenceView view;

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