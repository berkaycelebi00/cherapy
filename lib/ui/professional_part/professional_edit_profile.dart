import 'package:cheraphy/constants/api.dart';
import 'package:cheraphy/models/user.dart';
import 'package:cheraphy/view-models/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfessionalEditProfile extends StatefulWidget {
  const ProfessionalEditProfile({Key? key}) : super(key: key);

  @override
  _ProfessionalEditProfileState createState() =>
      _ProfessionalEditProfileState();
}

class _ProfessionalEditProfileState extends State<ProfessionalEditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    User user = Provider.of<AuthViewModel>(context, listen: false).user!;
    nameController.text = user.name ?? "";
    surnameController.text = user.surname ?? "";
    emailController.text = user.email ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<AuthViewModel>(context, listen: false).user!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 120,
                      backgroundImage: NetworkImage(
                        currentStaticLocation +
                            imagesEndPoint +
                            (user.photoAddress ?? "default.jpg"),
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                  ],
                ),
                Text(
                  user.username ?? "No name",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Card(
                  color: Colors.red.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        Text(
                            "Your profile has not been activated yet. To activate your profile please ensure you have filled all the required fields and then apply activation mail. Activation mail will be sent to your email address in 2-48 hours. For more information"),
                        Text("info@cherapy.com")
                      ],
                    ),
                  ),
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text("Upload a license file")),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.help)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Save Changes")),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
