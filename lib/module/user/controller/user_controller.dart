import 'package:flutter/material.dart';
import 'package:kta_asr/state_util.dart';
import '../view/user_view.dart';

class UserController extends State<UserView> implements MvcController {
  static late UserController instance;
  late UserView view;

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