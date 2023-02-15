import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class ProfileController extends State<ProfileView> implements MvcController {
  static late ProfileController instance;
  late ProfileView view;

  @override
  void initState() {
    instance = this;
    myProfile();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  doLogout() async {
    showLoading();
    try {
      await AuthService.logout();
      await MainStorage.removeToken();
      hideLoading();
    } catch (e) {
      hideLoading();
      showInfoDialog(e.toString());
    } finally {
      hideLoading();
    }
  }

  Map myData = {};
  Map hasRole = {};
  myProfile() async {
    Map obj = await AuthService.me();
    myData = obj['data'];
    hasRole = obj['meta'];
    setState(() {});
  }
}
