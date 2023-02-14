import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kta_asr/config.dart';
import 'package:kta_asr/core.dart';

class AuthService {
  static Future<Map> login(
      {required String email, required String password}) async {
    var response = await Dio().post(
      "${AppConfig.baseUrl}/login",
      options: Options(
        headers: {"Content-Type": "application/json"},
      ),
      data: {"email": email, "password": password},
    );
    Map obj = response.data;
    return obj;
  }

  static Future<Map> me() async {
    const storage = FlutterSecureStorage();
    var token = (await storage.read(key: 'token'))!;
    var response = await Dio().get(
      "${AppConfig.baseUrl}/me",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
      ),
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
