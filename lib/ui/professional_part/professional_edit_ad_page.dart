import 'package:flutter/material.dart';

class ProfessionalEditAdsPage extends StatefulWidget {
  const ProfessionalEditAdsPage({Key? key}) : super(key: key);

  @override
  _ProfessionalEditAdsPageState createState() =>
      _ProfessionalEditAdsPageState();
}

class _ProfessionalEditAdsPageState extends State<ProfessionalEditAdsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit advertisement"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: [
                Column(
                  children: [
                    Image.network(
                      "https://previews.123rf.com/images/megaflopp/megaflopp1506/megaflopp150600100/41502916-beautiful-young-female-therapist-doctor-sitting-in-front-of-working-table-smiling-and-looking-in-cam.jpg?fj=1'",
                      height: 150,
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                  ],
                ),
                Text(
                  "Mrs. Smith",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("I am a good therapist"),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          size: 20,
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Delete"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Save Changes"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
