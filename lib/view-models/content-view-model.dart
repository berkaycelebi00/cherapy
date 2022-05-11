import 'package:cheraphy/base/content.dart';
import 'package:cheraphy/models/content.dart';
import 'package:cheraphy/services/content-service.dart';
import 'package:flutter/material.dart';

class ContentViewModel extends Content with ChangeNotifier {
  final ContentService service = ContentService();
  List<ContentModel> contents = [];
  @override
  Future<List<ContentModel>> getAllContentTiles() async {
    return await service.getAllContentTiles();
  }
}
