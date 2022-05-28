import 'package:cheraphy/constants/api.dart';
import 'package:cheraphy/models/content.dart';
import 'package:flutter/material.dart';

class ContentDetail extends StatelessWidget {
  const ContentDetail({Key? key, required this.model}) : super(key: key);
  final ContentModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Hero(
        flightShuttleBuilder: (
          BuildContext flightContext,
          Animation<double> animation,
          HeroFlightDirection flightDirection,
          BuildContext fromHeroContext,
          BuildContext toHeroContext,
        ) {
          return SingleChildScrollView(
            child: fromHeroContext.widget,
          );
        },
        tag: "deneme0",
        child: Material(
            type: MaterialType.transparency,
            child: Column(
              children: [
                Image.network(
                    currentStaticLocation + imagesEndPoint + model.imageUrl!),
                SizedBox(
                  height: 16,
                ),
                Text(model.title!),
                SizedBox(
                  height: 16,
                ),
                Text(model.content!)
              ],
            )),
      ),
    );
  }
}
