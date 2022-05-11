import 'package:cheraphy/constants/api.dart';
import 'package:dio/dio.dart';

class APIHelper {
  Future<dynamic> post(Map<String, dynamic> params,
      {required String endpoint}) async {
    late Response response;
    var dio = Dio();
    late dynamic data;
    try {
      print(params);
      response = await dio.post(
        currentAPILocation + endpoint,
        data: params,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      data = response.data;
    } catch (e) {
      print(e);
      data = {
        "success": "false",
        "message": "Error occured when sending registration"
      };
    }

    return data;
  }

  Future<dynamic> get(
      {Map<String, dynamic>? payload, required String endpoint}) async {
    late Response response;
    var dio = Dio();
    late dynamic data;
    try {
      response = await dio.get(
        currentAPILocation + endpoint,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      data = response.data;
    } catch (e) {
      print(e);
      data = {
        "success": "false",
        "message": "Error occured when sending registration"
      };
    }

    return data;
  }
}
