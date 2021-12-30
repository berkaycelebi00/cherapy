import 'package:cheraphy/constants/routes.dart';
import 'package:cheraphy/ui/providers/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VolunteerPage extends StatefulWidget {
  const VolunteerPage({Key? key}) : super(key: key);

  @override
  State<VolunteerPage> createState() => _VolunteerPageState();
}

class _VolunteerPageState extends State<VolunteerPage> {
  String dropdownValue = "male";
  bool hasReadPolicy = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.account_box),
                title: TextFormField(
                  decoration: InputDecoration(label: Text("Name Surname")),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: dropdownValue == "male"
                    ? const Icon(Icons.male)
                    : const Icon(Icons.female),
                title: DropdownButton<String>(
                  value: dropdownValue,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['male', 'female']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              CheckboxListTile(
                  value: hasReadPolicy,
                  title: Text(
                    "I have read privacy policy and I want to be a Volunteer",
                    style: TextStyle(
                        fontSize: 13, color: Colors.blueAccent.shade200),
                  ),
                  onChanged: (value) {
                    setState(() {
                      hasReadPolicy = !hasReadPolicy;
                    });
                  }),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (hasReadPolicy) {
                          Navigator.pushNamed(context, freeChatPageRoute);
                        }
                      },
                      child: const Text("Be a Volunteer")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
