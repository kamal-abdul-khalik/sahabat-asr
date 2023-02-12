import 'package:kta_asr/config.dart';
import 'package:kta_asr/core_package.dart';

class DropdownService {
  static getCities() async {
    var response = await Dio().get(
      "${AppConfig.baseUrl}/cities",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj;
  }

  static getDistricts(code) async {
    var response = await Dio().get(
      "${AppConfig.baseUrl}/districts/?id=$code",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj;
  }

  static getVillages(code) async {
    var response = await Dio().get(
      "${AppConfig.baseUrl}/villages/?id=$code",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj;
  }

  static getReligions() async {
    var response = await Dio().get(
      "${AppConfig.baseUrl}/religion",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj;
  }

  static getEthnics() async {
    var response = await Dio().get(
      "${AppConfig.baseUrl}/ethnic",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj;
  }
}
