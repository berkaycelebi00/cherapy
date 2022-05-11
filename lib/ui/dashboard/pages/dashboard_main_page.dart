import 'package:cheraphy/constants/routes.dart';
import 'package:cheraphy/models/content.dart';
import 'package:cheraphy/view-models/content-view-model.dart';
import 'package:flutter/material.dart';

class DashBoardMainPage extends StatefulWidget {
  const DashBoardMainPage({Key? key}) : super(key: key);

  @override
  _DashBoardMainPageState createState() => _DashBoardMainPageState();
}

class _DashBoardMainPageState extends State<DashBoardMainPage> {
  final ContentViewModel contentViewModel = ContentViewModel();
  List<ContentModel> fakeList = [
    ContentModel(
        id: 0,
        imageUrl:
            "https://previews.123rf.com/images/megaflopp/megaflopp1506/megaflopp150600100/41502916-beautiful-young-female-therapist-doctor-sitting-in-front-of-working-table-smiling-and-looking-in-cam.jpg?fj=1'",
        content: "Lorem test",
        title: "Test title"),
    ContentModel(
        id: 1,
        imageUrl:
            "https://previews.123rf.com/images/megaflopp/megaflopp1506/megaflopp150600100/41502916-beautiful-young-female-therapist-doctor-sitting-in-front-of-working-table-smiling-and-looking-in-cam.jpg?fj=1'",
        content: "Lorem test",
        title: "Test title"),
    ContentModel(
        id: 2,
        imageUrl:
            "https://previews.123rf.com/images/megaflopp/megaflopp1506/megaflopp150600100/41502916-beautiful-young-female-therapist-doctor-sitting-in-front-of-working-table-smiling-and-looking-in-cam.jpg?fj=1'",
        content: "Lorem test",
        title: "Test title"),
    ContentModel(
        id: 3,
        imageUrl:
            "https://previews.123rf.com/images/megaflopp/megaflopp1506/megaflopp150600100/41502916-beautiful-young-female-therapist-doctor-sitting-in-front-of-working-table-smiling-and-looking-in-cam.jpg?fj=1'",
        content: "Lorem test",
        title: "Test title"),
  ];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: contentViewModel.getAllContentTiles(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
