import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class ProfileMemberController extends State<ProfileMemberView>
    implements MvcController {
  static late ProfileMemberController instance;
  late ProfileMemberView view;

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
