import 'package:flutter/material.dart';

class ProfessionalClientProfilePage extends StatefulWidget {
  const ProfessionalClientProfilePage({Key? key}) : super(key: key);

  @override
  _ProfessionalClientProfilePageState createState() =>
      _ProfessionalClientProfilePageState();
}

class _ProfessionalClientProfilePageState
    extends State<ProfessionalClientProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Client Name Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 120,
                backgroundImage: AssetImage("assets/images/female-avatar.png"),
              ),
              const Text(
                "Mrs Sevgi",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Row(
                children: const [
                  Icon(Icons.circle, color: Colors.green),
                  Text("Online")
                ],
              ),
              const Divider(),
              const Text("Sex: Female"),
              const Divider(),
              const Text("Notes:"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Talk to her next week about her family.",
                    textAlign: TextAlign.center,
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                ],
              ),
              const Divider(),
              const Text("Client for '4' Months"),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Send email")),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("End contract"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
