import 'package:cheraphy/constants/routes.dart';
import 'package:cheraphy/ui/providers/page_provider.dart';
import 'package:cheraphy/view-models/auth.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

class VolunteerPage extends StatefulWidget {
  const VolunteerPage({Key? key}) : super(key: key);

  @override
  State<VolunteerPage> createState() => _VolunteerPageState();
}

class _VolunteerPageState extends State<VolunteerPage> {
  String dropdownValue = "Male";
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
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
                  controller: nameController,
                  decoration: const InputDecoration(label: Text("Name")),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Icon(Icons.account_box),
                title: TextFormField(
                  controller: surnameController,
                  decoration: const InputDecoration(label: Text("Surname")),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: dropdownValue == "Male"
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
                  items: <String>['Male', 'Female', 'Other']
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
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        if (hasReadPolicy) {
                          String name = nameController.text;
                          String surname = surnameController.text;
                          String gender = dropdownValue;
                          Map<String, dynamic> result =
                              await Provider.of<AuthViewModel>(context,
                                      listen: false)
                                  .volunteerAsListener(
                                      Provider.of<AuthViewModel>(context,
                                              listen: false)
                                          .user!
                                          .id!,
                                      name,
                                      surname,
                                      gender);
                          if (result["success"] == true) {
                            Provider.of<AuthViewModel>(context, listen: false)
                                .user!
                                .isVolunteer = true;
                            await CoolAlert.show(
                              context: context,
                              type: CoolAlertType.success,
                              title: "Congratilations!",
                              text: "You are now a volunteer",
                            );
                            Provider.of<PageProvider>(context, listen: false)
                                .currentPageIndex = 1;
                          } else {
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.error,
                              text: result["message"],
                            );
                          }
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
