import 'package:cheraphy/constants/routes.dart';
import 'package:cheraphy/view-models/ad-view-model.dart';
import 'package:cheraphy/view-models/auth.dart';
import 'package:cheraphy/view-models/client-view-model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfessionalDashboard extends StatefulWidget {
  const ProfessionalDashboard({Key? key}) : super(key: key);

  @override
  _ProfessionalDashboardState createState() => _ProfessionalDashboardState();
}

class _ProfessionalDashboardState extends State<ProfessionalDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Professional - Dashboard"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, loginPageRoute);
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
        body: FutureBuilder(
            future: loadDashboard(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, professionalClientsPageRoute),
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/overthink.png",
                                height: 100,
                              ),
                              const Text(
                                "My Clients",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "You have ${Provider.of<ClientViewModel>(context, listen: false).allProfessionalClients.length} clients",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, professionalAdsPageRoute),
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/advertisement.jpg",
                                height: 100,
                              ),
                              const Text(
                                "My Ads",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "You have ${Provider.of<AdViewModel>(context).allAds.length} active advertisements",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, professionalEditPageRoute),
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/profile.jpg",
                                height: 100,
                              ),
                              const Text(
                                "Profile",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "Change your profile settings",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, professionalCalendarPageRoute),
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/calendar.jpg",
                                height: 100,
                              ),
                              const Text(
                                "Calendar",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "Schedule your calendar and todos",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  loadDashboard() async {
    await Provider.of<ClientViewModel>(context, listen: false)
        .getAllProfessionalClients(
            Provider.of<AuthViewModel>(context, listen: false).user!.id!);
    await Provider.of<AdViewModel>(context, listen: false)
        .getAllProfessionalAds(
            Provider.of<AuthViewModel>(context, listen: false).user!.id!);
    return true;
  }
}
