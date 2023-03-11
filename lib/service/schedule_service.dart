import 'package:kta_asr/config.dart';
import 'package:kta_asr/core.dart';

class ScheduleService {
  static getSchedule() async {
    var token = await mainStorage.get("token");
    var response = await Dio().get(
      "${AppConfig.baseUrl}/schedules",
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
