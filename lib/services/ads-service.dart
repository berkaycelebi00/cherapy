import 'package:cheraphy/base/ads.dart';
import 'package:cheraphy/constants/api.dart';
import 'package:cheraphy/helpers/api_helper.dart';
import 'package:cheraphy/models/ads.dart';

class AdsService extends AdsBase {
  @override
  Future<Ads> getAddById(int adId) {
    // TODO: implement getAddById
    throw UnimplementedError();
  }

  @override
  Future<List<Ads>> getAllProfessionalAds(int professionalId) async {
    APIHelper apiHelper = APIHelper();
    var rawJson = await apiHelper.get(
        endpoint: professionalEndPoint + professionalId.toString());
    print(rawJson);
    Ad ad = Ad.fromJson(rawJson);
    return ad.ads!;
  }
}
