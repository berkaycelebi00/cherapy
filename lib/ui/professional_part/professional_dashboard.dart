import 'package:cheraphy/constants/routes.dart';
import 'package:flutter/material.dart';

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
        title: Text("Professional - Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, professionalClientsPageRoute),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/overthink.png",
                      height: 100,
                    ),
                    Text(
                      "My Clients",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "You have 3 clients",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, professionalAdsPageRoute),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/advertisement.jpg",
                      height: 100,
                    ),
                    Text(
                      "My Ads",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "You have 1 active advertisement",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, professionalEditPageRoute),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/profile.jpg",
                      height: 100,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Change your profile settings",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, professionalCalendarPageRoute),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/calendar.jpg",
                      height: 100,
                    ),
                    Text(
                      "Calendar",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Schedule your calendar and todos",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
