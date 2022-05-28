import 'package:cheraphy/base/clients.dart';
import 'package:cheraphy/models/clients.dart';
import 'package:cheraphy/services/client-service.dart';
import 'package:flutter/material.dart';

class ClientViewModel extends ClientBase with ChangeNotifier {
  ClientService _clientService = ClientService();
  List<Clients> allProfessionalClients = [];
  @override
  Future<List<Clients>?> getAllProfessionalClients(int professionalId) async {
    allProfessionalClients =
        (await _clientService.getAllProfessionalClients(professionalId)) ?? [];

    return allProfessionalClients;
  }
}
