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
    );
  }
}
