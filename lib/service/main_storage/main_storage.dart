import 'package:hive/hive.dart';

import 'package:kta_asr/core.dart';

late Box mainStorage;

class MainStorage {
  static removeToken() async {
    await mainStorage.delete('token');
    Get.offAll(const LoginView());
    return snackbarIconSoftSuccess(
      message: 'Berhasil keluar dari apps, Sesi dihapus',
    );
  }
}
