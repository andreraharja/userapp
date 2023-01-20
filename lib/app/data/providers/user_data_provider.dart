import 'package:dio/dio.dart';
import '../user_data_model.dart';

/// Jika running di emulator akan mendapatkan error CERTIFICATE_VERIFY_FAILED'

/// Untuk cara solved :
/// https://wisnuwiry.space/snippet/fix-flutter-certificate_verify_failed-di-android-6-kebawah/

class UserDataProvider {
  Dio _dio = Dio();

  Future<List<UserData>> getUserData() async {
    try {
      Response response =
          await _dio.get("https://gorest.co.in/public/v2/users");
      print(response.statusCode);
      List<UserData> lsResult = [];
      response.data.map((i) => lsResult.add(UserData.fromJson(i))).toList();
      return lsResult;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
