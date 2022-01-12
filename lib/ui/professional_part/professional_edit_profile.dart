import 'package:flutter/material.dart';

class ProfessionalEditProfile extends StatefulWidget {
  const ProfessionalEditProfile({Key? key}) : super(key: key);

  @override
  _ProfessionalEditProfileState createState() =>
      _ProfessionalEditProfileState();
}

class _ProfessionalEditProfileState extends State<ProfessionalEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit profile"),
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
                        "https://previews.123rf.com/images/megaflopp/megaflopp1506/megaflopp150600100/41502916-beautiful-young-female-therapist-doctor-sitting-in-front-of-working-table-smiling-and-looking-in-cam.jpg?fj=1'",
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Mrs. Smith",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                  ],
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
                    labelText: "Country",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {}, child: Text("Upload a license file")),
                    IconButton(onPressed: () {}, icon: Icon(Icons.help)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Save Changes")),
                SizedBox(
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
