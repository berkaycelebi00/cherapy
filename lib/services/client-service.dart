import 'package:cheraphy/base/clients.dart';
import 'package:cheraphy/constants/api.dart';
import 'package:cheraphy/helpers/api_helper.dart';
import 'package:cheraphy/models/clients.dart';

class ClientService extends ClientBase {
  @override
  Future<List<Clients>?> getAllProfessionalClients(int professionalId) async {
    APIHelper apiHelper = APIHelper();
    Map<String, dynamic> response =
        await apiHelper.get(endpoint: client + "/" + professionalId.toString());
    print(response);
    return (ClientModel.fromJson(response).clients) ?? [];
  }
}
