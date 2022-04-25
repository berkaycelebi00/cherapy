import 'package:cheraphy/constants/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text("Login to Cherapy", style: TextStyle(fontSize: 25)),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                controller: emailController,
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
                controller: emailController,
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
                              Navigator.pushNamed(context, registerPageRoute);
                            },
                            child: const Text("Register")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          width: 90,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.popAndPushNamed(
                                    context, dashboardPage);
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
                  onPressed: () =>
                      Navigator.pushNamed(context, professionalStartPageRoute),
                  child: const Text("Professional"))
            ],
          )),
        ),
      ),
    );
  }
}
