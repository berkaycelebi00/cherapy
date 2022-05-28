import 'package:cheraphy/models/ads.dart';

abstract class AdsBase {
  Future<List<Ads>> getAllProfessionalAds(int professionalId);
  Future<Ads> getAddById(int adId);
}
