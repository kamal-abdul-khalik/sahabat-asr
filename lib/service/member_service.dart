import 'package:kta_asr/config.dart';
import 'package:kta_asr/core.dart';

class MemberService {
  static Future<Map> uploadDataMember({
    required String name,
    required String email,
    required String ktpNumber,
    required String cityCode,
    required String districtCode,
    required String villageCode,
    required String phone,
    required String birthPlace,
    required String birtDate,
    required String address,
    required String gender,
    required int religionId,
    required int ethnicId,
    required String imageKtp,
    required String imageSelfie,
  }) async {
    var token = await mainStorage.get("token");
    var response = await Dio().post(
      "${AppConfig.baseUrl}/users",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
      ),
      data: {
        "name": name,
        "email": email,
        "ktp_number": ktpNumber,
        "city_code": cityCode,
        "district_code": districtCode,
        "village_code": villageCode,
        "phone": phone,
        "birth_place": birthPlace,
        "birth_date": birtDate,
        "address": address,
        "gender": gender,
        "religion_id": religionId,
        "ethnic_id": ethnicId,
        "image_ktp": imageKtp,
        "image_selfie": imageSelfie,
      },
    );
    Map obj = response.data;
    return obj;
  }

  static getAllMember(page, search) async {
    var token = await mainStorage.get("token");
    var response = await Dio().get(
      "${AppConfig.baseUrl}/users?page=$page&search=$search",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
      ),
    );
    Map obj = response.data;
    return obj['data']['data'];
  }

  static deleteMember({required int id}) async {
    var token = await mainStorage.get("token");
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
    var token = await mainStorage.get("token");
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
