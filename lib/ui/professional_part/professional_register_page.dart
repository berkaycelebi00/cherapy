import 'package:cheraphy/constants/routes.dart';
import 'package:cheraphy/view-models/auth.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfessionalRegisterPage extends StatefulWidget {
  const ProfessionalRegisterPage({Key? key}) : super(key: key);

  @override
  _ProfessionalRegisterPageState createState() =>
      _ProfessionalRegisterPageState();
}

class _ProfessionalRegisterPageState extends State<ProfessionalRegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reenterPasswordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Professional - Register")),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
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
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                    ),
                  ),
                  TextFormField(
                    controller: surnameController,
                    decoration: const InputDecoration(
                      labelText: "Surname",
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                  TextFormField(
                    controller: reenterPasswordController,
                    decoration: const InputDecoration(
                      labelText: "Re-enter password",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          print("geldi");
                          Map<String, dynamic> result =
                              await Provider.of<AuthViewModel>(context,
                                      listen: false)
                                  .registerProfessional(
                                      usernameController.text,
                                      emailController.text,
                                      nameController.text,
                                      surnameController.text,
                                      passwordController.text);
                          if (result["success"] == true) {
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.success,
                              text: "You are registered as professional",
                            );
                          } else {
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.error,
                              text: result["message"],
                            );
                          }
                        }
                      },
                      child: const Text("Register"))
                ],
              ),
            )),
      ),
    );
  }
}
