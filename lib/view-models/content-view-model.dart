import 'package:cheraphy/base/content.dart';
import 'package:cheraphy/models/content.dart';
import 'package:flutter/material.dart';

class ContentViewModel extends Content with ChangeNotifier {
  @override
  Future<List<ContentModel>> getAllContentTiles() async {
    List<ContentModel> contents = [];
    // TODO: implement getAllContentTiles
    return contents;
  }
}
