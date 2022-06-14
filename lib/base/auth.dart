import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

abstract class Auth {
  Future<Map<String, dynamic>> login(username, password);
  Future<Map<String, dynamic>> register(username, password, email);
  Future<Map<String, dynamic>> registerProfessional(
      username, email, name, surname, password);
  Future<Map<String, dynamic>> volunteerAsListener(id, name, surname, gender);
  Future<Map<String, dynamic>> updateProfile(id, name, surname, email);
  Future<Map<String, dynamic>> updateProfilePhoto(id, XFile photo);
}
