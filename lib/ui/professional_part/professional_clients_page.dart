import 'package:cheraphy/constants/enum.dart';
import 'package:cheraphy/constants/routes.dart';
import 'package:cheraphy/ui/dashboard/pages/chat/free_chat_page.dart';
import 'package:cheraphy/view-models/auth.dart';
import 'package:cheraphy/view-models/client-view-model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfessionalClientsPage extends StatefulWidget {
  const ProfessionalClientsPage({Key? key}) : super(key: key);

  @override
  _ProfessionalClientsPageState createState() =>
      _ProfessionalClientsPageState();
}

class _ProfessionalClientsPageState extends State<ProfessionalClientsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Clients"),
      ),
      body: FutureBuilder(
          future: getllProffessionalClients(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount:
                          Provider.of<ClientViewModel>(context, listen: false)
                              .allProfessionalClients
                              .length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  (Provider.of<ClientViewModel>(context,
                                                      listen: false)
                                                  .allProfessionalClients[index]
                                                  .clientuser!
                                                  .gender ??
                                              "male") ==
                                          "female"
                                      ? "assets/images/female-avatar.png"
                                      : "assets/images/male-avatar.png",
                                  height: 100,
                                ),
                                Text(
                                  Provider.of<ClientViewModel>(context,
                                              listen: false)
                                          .allProfessionalClients[index]
                                          .clientuser!
                                          .name ??
                                      "" +
                                          Provider.of<ClientViewModel>(context,
                                                  listen: false)
                                              .allProfessionalClients[index]
                                              .clientuser!
                                              .surname!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  Provider.of<ClientViewModel>(context,
                                              listen: false)
                                          .allProfessionalClients[index]
                                          .note ??
                                      "",
                                  textAlign: TextAlign.center,
                                ),
                                Row(
                                  children: const [
                                    Icon(Icons.circle, color: Colors.green),
                                    Text("Online")
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, freeChatPageRoute,
                                          arguments: ChatUserType.listener);
                                    },
                                    child: const Text("Send Message")),
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          professionalClientProfileRoute);
                                    },
                                    child: const Text("View Profile")),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        );
                      }));
            } else if (snapshot.hasError) {
              return Center(
                child: ErrorWidget(snapshot.error.toString()),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  getllProffessionalClients() async {
    await Provider.of<ClientViewModel>(context, listen: false)
        .getAllProfessionalClients(
            Provider.of<AuthViewModel>(context, listen: false).user!.id!);
    return true;
  }
}
