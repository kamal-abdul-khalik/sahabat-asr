import 'package:kta_asr/config.dart';
import 'package:kta_asr/core_package.dart';

class SliderService {
  static getAllSlider() async {
    var response = await Dio().get(
      "${AppConfig.baseUrl}/slider",
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
