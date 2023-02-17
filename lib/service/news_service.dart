import 'package:kta_asr/config.dart';
import 'package:kta_asr/core.dart';

class NewsService {
  static getAllNews() async {
    var token = await MainStorage.readToken('token');
    var response = await Dio().get(
      "${AppConfig.baseUrl}/articles",
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
