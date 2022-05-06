import 'package:cheraphy/constants/routes.dart';
import 'package:cheraphy/view-models/auth.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cherapy.com"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text("Login to Cherapy",
                      style: TextStyle(fontSize: 25)),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid username';
                      }
                      return null;
                    },
                    controller: usernameController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text("Forgot my password",
                              style: TextStyle(fontSize: 12)),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 90,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, registerPageRoute);
                                },
                                child: const Text("Register")),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: SizedBox(
                              width: 90,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState != null &&
                                        _formKey.currentState!.validate()) {
                                      String username = usernameController.text;
                                      String password = passwordController.text;

                                      final Map<String, dynamic> result =
                                          await Provider.of<AuthViewModel>(
                                                  context,
                                                  listen: false)
                                              .login(username, password);
                                      print(result);
                                      if (result["success"] == true) {
                                        await CoolAlert.show(
                                            context: context,
                                            type: CoolAlertType.success,
                                            text: 'Registration completed!',
                                            autoCloseDuration:
                                                const Duration(seconds: 2));
                                        Navigator.pop(context);
                                      } else {
                                        CoolAlert.show(
                                          context: context,
                                          type: CoolAlertType.error,
                                          text: result["message"],
                                        );
                                      }
                                    }
                                  },
                                  child: const Text("Login")),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () => Navigator.pushNamed(
                          context, professionalStartPageRoute),
                      child: const Text("Professional"))
                ],
              )),
        ),
      ),
    );
  }
}
