import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kta_asr/config.dart';
import 'package:kta_asr/core.dart';

class AuthService {
  static Future<Map> login(
      {required String email, required String password}) async {
    var response = await Dio().post(
      "${AppConfig.baseUrl}/login",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "email": email,
        "password": password,
      },
    );
    Map obj = response.data;
    return obj;
  }

  static logout() async {
    const storage = FlutterSecureStorage();
    var token = (await storage.read(key: 'token'))!;
    var response = await Dio().post(
      "${AppConfig.baseUrl}/logout",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static writeDataToStorage(
      {required String key, required String value}) async {
    const storage = FlutterSecureStorage();
    return await storage.write(key: key, value: value);
  }

  static removeToken() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
    Get.offAll(const LoginView());

    return snackbarIconSoftSuccess(
        message: 'Berhasil keluar dari apps, Sesi dihapus');
  }

  static readToken({required String key}) async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: key);
  }

  static authCheck() async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    if (token != null) {
      Future.delayed(const Duration(seconds: 5), () {
        Get.offAll(const MainNavigationView());
      });
    } else {
      Get.offAll(const LoginView());
    }
  }
}
