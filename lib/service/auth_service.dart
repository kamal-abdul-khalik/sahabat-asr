import 'package:kta_asr/config.dart';
import 'package:kta_asr/core.dart';

class AuthService {
  static Future<Map> login({
    required String username,
    required String password,
  }) async {
    var response = await Dio().post(
      "${AppConfig.baseUrl}/login",
      options: Options(
        headers: {"Content-Type": "application/json"},
      ),
      data: {"username": username, "password": password},
    );
    Map obj = response.data;
    return obj;
  }

  static Future<Map> me() async {
    var token = await MainStorage.readToken('token');
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
    var token = await MainStorage.readToken('token');
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

  static authCheck() async {
    var token = await MainStorage.readToken('token');
    if (token != null) {
      Future.delayed(const Duration(seconds: 5), () {
        Get.offAll(const MainNavigationView());
      });
    } else {
      Get.offAll(const LoginView());
    }
  }
}
