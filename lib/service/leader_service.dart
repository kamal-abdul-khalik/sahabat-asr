import 'package:kta_asr/config.dart';
import 'package:kta_asr/core.dart';

class LeaderService {
  static getMember() async {
    var token = await MainStorage.readToken('token');
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
    var token = await MainStorage.readToken('token');
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
    var token = await MainStorage.readToken('token');
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
