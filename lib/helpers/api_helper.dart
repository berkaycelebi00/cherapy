import 'package:cheraphy/constants/api.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<dynamic> delete(
      {Map<String, dynamic>? payload, required String endpoint}) async {
    late Response response;
    var dio = Dio();
    late dynamic data;
    try {
      response = await dio.delete(
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

  Future<dynamic> put(
      {Map<String, dynamic>? params, required String endpoint}) async {
    late Response response;
    var dio = Dio();
    late dynamic data;
    try {
      print(params);
      response = await dio.put(
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

  Future<dynamic> postImage(
      {required XFile file, required String endpoint}) async {
    late Response response;
    var dio = Dio();
    late dynamic data;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: file.name),
    });
    try {
      response = await dio.post(
        currentAPILocation + endpoint,
        data: formData,
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
