abstract class Auth {
  Future<Map<String, dynamic>> login(username, password);
  Future<Map<String, dynamic>> register(username, password, email);
}
