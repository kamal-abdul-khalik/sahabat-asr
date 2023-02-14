// import 'package:hive/hive.dart';

// late Box mainStorage;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kta_asr/core.dart';

class MainStorage {
  static saveToken({required String key, required value}) async {
    const storage = FlutterSecureStorage();
    return await storage.write(key: key, value: value);
  }

  static removeToken() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
    Get.offAll(const LoginView());
    return snackbarIconSoftSuccess(
      message: 'Berhasil keluar dari apps, Sesi dihapus',
    );
  }

  static readToken(String? token) async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: "$token");
  }
}
