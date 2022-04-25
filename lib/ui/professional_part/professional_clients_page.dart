import 'package:cheraphy/constants/routes.dart';
import 'package:cheraphy/ui/dashboard/pages/chat/free_chat_page.dart';
import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          childAspectRatio: 0.5,
          crossAxisCount: 2,
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/female-avatar.png",
                    height: 100,
                  ),
                  const Text(
                    "Mrs. Sevgi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Talk to her next week about her family.",
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FreeChatPage()));
                      },
                      child: const Text("Send Message")),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, professionalClientProfileRoute);
                      },
                      child: const Text("View Profile"))
                ],
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/male-avatar.png",
                    height: 100,
                  ),
                  const Text(
                    "Mr. Savingi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Don't forget to ask him about relationship",
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.circle, color: Colors.red),
                      Text("Offline")
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FreeChatPage()));
                      },
                      child: const Text("Send Message")),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, professionalClientProfileRoute);
                      },
                      child: const Text("View Profile"))
                ],
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/female-avatar.png",
                    height: 100,
                  ),
                  const Text(
                    "Mrs. Smith",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Don't forget to ask her about relationship",
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.circle, color: Colors.red),
                      Text("Offline")
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FreeChatPage()));
                      },
                      child: const Text("Send Message")),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, professionalClientProfileRoute);
                      },
                      child: const Text("View Profile"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
