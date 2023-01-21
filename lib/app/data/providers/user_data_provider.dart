import 'package:dio/dio.dart';
import '../user_data_model.dart';

/// Jika running di emulator akan mendapatkan error CERTIFICATE_VERIFY_FAILED'

/// Untuk cara solved :
/// https://wisnuwiry.space/snippet/fix-flutter-certificate_verify_failed-di-android-6-kebawah/

class UserDataProvider {
  Dio _dio = Dio();
  static String token =
      "Bearer 7f745980d079ef2930b77998eede02087fadd429a62f6162583de583cbc06e5d";

  Future<List<UserData>> getUserData() async {
    try {
      Response response = await _dio.get("https://gorest.co.in/public/v2/users",
          options: Options(headers: {"Authorization": token}));
      List<UserData> lsResult = [];
      response.data.map((i) => lsResult.add(UserData.fromJson(i))).toList();
      return lsResult;
    } catch (e) {
      return [];
    }
  }

  Future<List> executeCreateOrReplaceUserData(
      {required Map data, required String methodType, int? idPengguna}) async {
    try {
      String url = "";
      if (methodType == "POST") {
        url = "https://gorest.co.in/public/v2/users";
      } else {
        url = "https://gorest.co.in/public/v2/users/" + idPengguna.toString();
      }
      Response response = await _dio.request(url,
          data: data,
          options: Options(
              method: methodType,
              headers: {"Authorization": token},
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
      return [UserData()];
    }
  }

  Future<String> deleteUserData({required int idPengguna}) async {
    try {
      Response response = await _dio.delete(
          'https://gorest.co.in/public/v2/users/' + idPengguna.toString(),
          options: Options(headers: {"Authorization": token}));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return "OK";
      } else {
        return "Error";
      }
    } catch (e) {
      return "Error";
    }
  }
}
