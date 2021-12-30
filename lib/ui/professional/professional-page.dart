import 'package:cheraphy/constants/routes.dart';
import 'package:cheraphy/models/professional_doctor.dart';
import 'package:flutter/material.dart';

class ProfessionalPage extends StatefulWidget {
  const ProfessionalPage({Key? key}) : super(key: key);

  @override
  _ProfessionalPageState createState() => _ProfessionalPageState();
}

class _ProfessionalPageState extends State<ProfessionalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Professionals"),
        ),
        body: GridView.count(
            primary: false,
            childAspectRatio: 0.8,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: getAllDoctors()));
  }

  getAllDoctors() {
    List<ProfessionalDoctor> doctors = [
      ProfessionalDoctor(
          name: "Dr. Jessica Lopez",
          description: "I am a good therapist",
          imgSource:
              'https://previews.123rf.com/images/megaflopp/megaflopp1506/megaflopp150600100/41502916-beautiful-young-female-therapist-doctor-sitting-in-front-of-working-table-smiling-and-looking-in-cam.jpg?fj=1',
          rate: 4),
      ProfessionalDoctor(
          name: "Dr. John Smith",
          description: "I am better therapist",
          imgSource:
              'https://thumbs.dreamstime.com/z/portrait-successful-therapist-doctor-blurred-background-colleagues-147360585.jpg',
          rate: 3),
      ProfessionalDoctor(
          name: "Dr. John Smith",
          description: "I am better therapist",
          imgSource:
              'https://thumbs.dreamstime.com/z/doctor-therapist-sitting-table-his-office-photo-copy-space-doctor-therapist-sitting-table-his-office-178286281.jpg',
          rate: 4),
      ProfessionalDoctor(
          name: "Dr. John Smith",
          description: "I am better therapist",
          imgSource:
              'https://thumbs.dreamstime.com/z/portrait-successful-therapist-doctor-blurred-background-colleagues-147360585.jpg',
          rate: 2),
      ProfessionalDoctor(
          name: "Dr. John Smith",
          description: "I am better therapist",
          imgSource:
              'https://thumbs.dreamstime.com/z/doctor-therapist-sitting-table-his-office-photo-copy-space-doctor-therapist-sitting-table-his-office-178286281.jpg',
          rate: 4),
      ProfessionalDoctor(
          name: "Dr. John Smith",
          description: "I am better therapist",
          imgSource:
              'https://st4.depositphotos.com/1049680/28783/i/1600/depositphotos_287835428-stock-photo-young-woman-wearing-medical-coat.jpg',
          rate: 3),
      ProfessionalDoctor(
          name: "Dr. John Smith",
          description: "I am better therapist",
          imgSource:
              'https://thumbs.dreamstime.com/z/portrait-successful-therapist-doctor-blurred-background-colleagues-147360585.jpg',
          rate: 1),
      ProfessionalDoctor(
          name: "Dr. John Smith",
          description: "I am better therapist",
          imgSource:
              'https://thumbs.dreamstime.com/z/portrait-successful-therapist-doctor-blurred-background-colleagues-147360585.jpg',
          rate: 5),
    ];

    List<Widget> doctorsWidget = [];
    doctors.forEach((element) {
      doctorsWidget.add(Card(
        elevation: 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.network(
              element.imgSource,
              height: 80,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              element.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(element.description),
            const SizedBox(
              height: 2,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: getStarCount(element.rate)),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, freeChatPageRoute);
                },
                child: const Text("Start a new meet"))
          ],
        ),
      ));
    });
    return doctorsWidget;
  }

  getStarCount(int count) {
    List<Widget> stars = [];
    Widget star = Icon(
      Icons.star_outlined,
      size: 20,
      color: Colors.yellow.shade700,
    );
    for (int i = 0; i < count; i++) {
      stars.add(star);
    }
    return stars;
  }
}
