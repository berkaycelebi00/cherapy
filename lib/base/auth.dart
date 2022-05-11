abstract class Auth {
  Future<Map<String, dynamic>> login(username, password);
  Future<Map<String, dynamic>> register(username, password, email);
  Future<Map<String, dynamic>> registerProfessional(
      username, email, name, surname, password);
  Future<Map<String, dynamic>> volunteerAsListener(id, name, surname, gender);
}
