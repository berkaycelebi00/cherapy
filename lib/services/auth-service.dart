import 'package:cheraphy/base/auth.dart';
import 'package:cheraphy/constants/api.dart';
import 'package:cheraphy/helpers/api_helper.dart';

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
}
