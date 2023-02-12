import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kta_asr/config.dart';
import 'package:kta_asr/core_package.dart';

class LeaderService {
  static getMember() async {
    const storage = FlutterSecureStorage();
    var token = (await storage.read(key: 'token'))!;
    var response = await Dio().get(
      "${AppConfig.baseUrl}/users",
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

  static deleteMember({required int id}) async {
    const storage = FlutterSecureStorage();
    var token = (await storage.read(key: 'token'))!;
    var response = await Dio().delete(
      "${AppConfig.baseUrl}/users/$id",
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

  static getSingleMember({required int id}) async {
    const storage = FlutterSecureStorage();
    var token = (await storage.read(key: 'token'))!;
    var response = await Dio().get(
      "${AppConfig.baseUrl}/users/$id",
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
}
