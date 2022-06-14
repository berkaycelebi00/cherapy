import 'dart:typed_data';

import 'package:cheraphy/base/auth.dart';
import 'package:cheraphy/constants/api.dart';
import 'package:cheraphy/helpers/api_helper.dart';
import 'package:image_picker/image_picker.dart';

class AuthService extends Auth {
  @override
  Future<Map<String, dynamic>> login(username, password) async {
    APIHelper apiHelper = APIHelper();
    Map<String, dynamic> response = await apiHelper.post(
        {"username": username, "password": password},
        endpoint: loginEnpoint);

    return response;
  }

  @override
  Future<Map<String, dynamic>> register(username, password, email) async {
    APIHelper apiHelper = APIHelper();
    Map<String, dynamic> response = await apiHelper.post(
        {"username": username, "password": password, "email": email},
        endpoint: registerEndpoint);

    return response;
  }

  @override
  Future<Map<String, dynamic>> volunteerAsListener(
      id, name, surname, gender) async {
    APIHelper apiHelper = APIHelper();
    Map<String, dynamic> response = await apiHelper.post(
        {"id": id, "name": name, "surname": surname, "gender": gender},
        endpoint: volunteerSetEndPoint);

    return response;
  }

  @override
  Future<Map<String, dynamic>> registerProfessional(
      username, email, name, surname, password) async {
    APIHelper apiHelper = APIHelper();
    Map<String, dynamic> response = await apiHelper.post({
      "username": username,
      "password": password,
      "name": name,
      "surname": surname,
      "email": email,
      "roles": ["professional"]
    }, endpoint: registerEndpoint);

    return response;
  }

  @override
  Future<Map<String, dynamic>> updateProfile(id, name, surname, email) async {
    APIHelper apiHelper = APIHelper();
    Map<String, dynamic> response = await apiHelper.put(params: {
      "name": name,
      "surname": surname,
      "email": email,
    }, endpoint: auth + "/" + id.toString());

    return response;
  }

  @override
  Future<Map<String, dynamic>> updateProfilePhoto(id, XFile photo) async {
    APIHelper apiHelper = APIHelper();
    Map<String, dynamic> response = await apiHelper.postImage(
        file: photo, endpoint: auth + "/photo/" + id.toString());
    print("------------");
    print(response);
    return response;
  }
}
