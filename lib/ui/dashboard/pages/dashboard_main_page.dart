import 'package:cheraphy/constants/api.dart';
import 'package:cheraphy/constants/routes.dart';
import 'package:cheraphy/models/content.dart';
import 'package:cheraphy/view-models/content-view-model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoardMainPage extends StatefulWidget {
  const DashBoardMainPage({Key? key}) : super(key: key);

  @override
  _DashBoardMainPageState createState() => _DashBoardMainPageState();
}

class _DashBoardMainPageState extends State<DashBoardMainPage> {
  final ContentViewModel contentViewModel = ContentViewModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<ContentViewModel>(context).getAllContentTiles(),
        builder: ((context, AsyncSnapshot<List<ContentModel>> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(16),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: GestureDetector(
                            onTap: (() => Navigator.pushNamed(
                                context, contentDetailPageRoute,
                                arguments: snapshot.data![index])),
                            child: Hero(
                                tag: snapshot.data![index].id!,
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Column(
                                    children: [
                                      Image.network(currentStaticLocation +
                                          imagesEndPoint +
                                          snapshot.data![index].imageUrl!),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(snapshot.data![index].title!)
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ));
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
