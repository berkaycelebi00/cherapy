import 'package:cheraphy/constants/routes.dart';
import 'package:flutter/material.dart';

class ProfessionalAdsPage extends StatefulWidget {
  const ProfessionalAdsPage({Key? key}) : super(key: key);

  @override
  _ProfessionalAdsPageState createState() => _ProfessionalAdsPageState();
}

class _ProfessionalAdsPageState extends State<ProfessionalAdsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Ads"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView
              .count(childAspectRatio: 0.55, crossAxisCount: 2, children: [
            Card(
              child: Column(
                children: [
                  Image.network(
                      "https://previews.123rf.com/images/megaflopp/megaflopp1506/megaflopp150600100/41502916-beautiful-young-female-therapist-doctor-sitting-in-front-of-working-table-smiling-and-looking-in-cam.jpg?fj=1'"),
                  Text(
                    "Mrs. Sevgi",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellowAccent.shade700,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellowAccent.shade700,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellowAccent.shade700,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellowAccent.shade700,
                            size: 15,
                          ),
                          Icon(
                            Icons.star_half,
                            color: Colors.yellowAccent.shade700,
                            size: 15,
                          ),
                        ],
                      ),
                      Row(
                        children: [Text("4.5 (413)")],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("I am a good therapist"),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => Navigator.pushNamed(
                          context, professionalEditAdsPageRoute),
                      child: Text("Edit"))
                ],
              ),
            ),
          ]),
        ));
  }
}
