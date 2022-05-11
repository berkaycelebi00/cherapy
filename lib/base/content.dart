import '../models/content.dart';

abstract class Content {
  Future<List<ContentModel>> getAllContentTiles();
}
