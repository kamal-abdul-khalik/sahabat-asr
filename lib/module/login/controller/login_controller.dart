import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  final loginFormKey = GlobalKey<FormState>();

  String? username = '';
  String? password = '';

  doLogin() async {
    bool isValidate = loginFormKey.currentState!.validate();
    if (isValidate) {
      showLoading();
      try {
        Map obj =
            await AuthService.login(username: username!, password: password!);
        if (obj['status'] == false) {
          hideLoading();
          snackbarIconSoftDanger(message: obj['message']);
        }
        await MainStorage.saveToken(key: 'token', value: obj['token']);
        hideLoading();
        snackbarIconSoftSuccess(
            message: 'Login Sukses, Selamat Datang Kembali');
        Get.offAll(const MainNavigationView());
      } finally {
        hideLoading();
      }
    }
  }
}
