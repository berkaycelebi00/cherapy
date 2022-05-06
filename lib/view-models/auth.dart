import 'package:cheraphy/base/auth.dart';
import 'package:cheraphy/services/auth-service.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends Auth with ChangeNotifier {
  final AuthService _authService = AuthService();
  @override
  Future<Map<String, dynamic>> login(username, password) async {
    return await _authService.login(username, password);
  }

  @override
  Future<Map<String, dynamic>> register(username, password, email) async {
    Map<String, dynamic> result =
        await _authService.register(username, password, email);
    print(result);
    return result;
  }
}
