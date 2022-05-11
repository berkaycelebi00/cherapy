import 'package:cheraphy/base/content.dart';
import 'package:cheraphy/constants/api.dart';
import 'package:cheraphy/models/content.dart';

import '../helpers/api_helper.dart';

class ContentService extends Content {
  @override
  Future<List<ContentModel>> getAllContentTiles() async {
    APIHelper apiHelper = APIHelper();
    Map<String, dynamic> response =
        await apiHelper.get(endpoint: contentAllEndPoint);

    List<ContentModel> contents = ContentList.fromJson(response).contents!;
    return contents;
  }
}
