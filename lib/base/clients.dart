import 'package:cheraphy/models/clients.dart';

abstract class ClientBase {
  Future<List<Clients>?> getAllProfessionalClients(int professionalId);
}
