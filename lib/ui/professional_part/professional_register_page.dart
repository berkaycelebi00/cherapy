import 'package:cheraphy/constants/routes.dart';
import 'package:flutter/material.dart';

class ProfessionalRegisterPage extends StatefulWidget {
  const ProfessionalRegisterPage({Key? key}) : super(key: key);

  @override
  _ProfessionalRegisterPageState createState() =>
      _ProfessionalRegisterPageState();
}

class _ProfessionalRegisterPageState extends State<ProfessionalRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Professional - Register")),
      body: SingleChildScrollView(
        child: Form(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                "assets/images/video-therapy.png",
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Register as a professional account",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                  "To register as a professional we need to know about you and your carier to prevent people from scammers"),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Name Surname",
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Re-enter password",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.popAndPushNamed(
                      context, professionalEditPageRoute),
                  child: const Text("Next"))
            ],
          ),
        )),
      ),
    );
  }
}
