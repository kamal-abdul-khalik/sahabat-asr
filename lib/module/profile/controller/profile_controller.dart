import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class ProfileController extends State<ProfileView> implements MvcController {
  static late ProfileController instance;
  late ProfileView view;

  @override
  void initState() {
    instance = this;

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
      await AuthService.removeToken();
      hideLoading();
    } catch (e) {
      hideLoading();
      showInfoDialog(e.toString());
    } finally {
      hideLoading();
    }
  }
}
