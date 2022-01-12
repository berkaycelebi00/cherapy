import 'package:cheraphy/constants/routes.dart';
import 'package:flutter/material.dart';

class ProfessionalStartPage extends StatefulWidget {
  const ProfessionalStartPage({Key? key}) : super(key: key);

  @override
  _ProfessionalStartPageState createState() => _ProfessionalStartPageState();
}

class _ProfessionalStartPageState extends State<ProfessionalStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Professional"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/video-therapy.png"),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(
                      context, professionalRegisterPageRoute),
                  child: Text("Get started")),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(
                      context, professionalDashboardPageROUTE),
                  child: Text("Already have an account?")),
            ],
          ),
        ),
      ),
    );
  }
}
