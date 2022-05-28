import 'package:cheraphy/base/auth.dart';
import 'package:cheraphy/models/user.dart';
import 'package:cheraphy/services/auth-service.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends Auth with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? user;
  @override
  Future<Map<String, dynamic>> login(username, password) async {
    Map<String, dynamic> response =
        await _authService.login(username, password);
    try {
      user = User.fromJson(response);
    } catch (e) {}
    return response;
  }

  @override
  Future<Map<String, dynamic>> register(username, password, email) async {
    Map<String, dynamic> result =
        await _authService.register(username, password, email);
    return result;
  }

  @override
  Future<Map<String, dynamic>> volunteerAsListener(
      id, name, surname, gender) async {
    Map<String, dynamic> res =
        await _authService.volunteerAsListener(id, name, surname, gender);
    print(res);
    return res;
  }

  @override
  Future<Map<String, dynamic>> registerProfessional(
      username, email, name, surname, password) async {
    Map<String, dynamic> result = await _authService.registerProfessional(
        username, email, name, surname, password);
    return result;
  }
}
