import 'package:dio/dio.dart';
import '../user_data_model.dart';

/// Jika running di emulator akan mendapatkan error CERTIFICATE_VERIFY_FAILED'

/// Untuk cara solved :
/// https://wisnuwiry.space/snippet/fix-flutter-certificate_verify_failed-di-android-6-kebawah/

class UserDataProvider {
  Dio _dio = Dio();

  Future<List<UserData>> getUserData() async {
    try {
      Response response = await _dio.get("https://gorest.co.in/public/v2/users",
          options: Options(headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization":
                "Bearer 7f745980d079ef2930b77998eede02087fadd429a62f6162583de583cbc06e5d"
          }));
      print(response.statusCode);
      List<UserData> lsResult = [];
      response.data.map((i) => lsResult.add(UserData.fromJson(i))).toList();
      return lsResult;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List> createUserData({required Map data}) async {
    try {
      print(data);
      Response response =
          await _dio.post("https://gorest.co.in/public/v2/users",
              data: data,
              options: Options(
                  headers: {
                    "Authorization":
                        "Bearer 7f745980d079ef2930b77998eede02087fadd429a62f6162583de583cbc06e5d"
                  },
                  validateStatus: (statusCode) {
                    if (statusCode == null) {
                      return false;
                    }
                    if (statusCode == 422) {
                      return true;
                    } else {
                      return statusCode >= 200 && statusCode < 300;
                    }
                  }));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return [UserData.fromJson(response.data), null, null];
      } else {
        return [
          UserData(),
          response.data[0]["field"],
          response.data[0]["message"]
        ];
      }
    } catch (e) {
      print(e);
      return [UserData()];
    }
  }
}
