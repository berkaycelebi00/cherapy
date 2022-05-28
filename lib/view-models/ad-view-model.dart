import 'package:cheraphy/base/ads.dart';
import 'package:cheraphy/models/ads.dart';
import 'package:cheraphy/services/ads-service.dart';
import 'package:flutter/material.dart';

class AdViewModel extends AdsBase with ChangeNotifier {
  AdsService adsService = AdsService();
  List<Ads> allAds = [];
  @override
  Future<Ads> getAddById(int adId) {
    // TODO: implement getAddById
    throw UnimplementedError();
  }

  @override
  Future<List<Ads>> getAllProfessionalAds(int professionalId) async {
    allAds = await adsService.getAllProfessionalAds(professionalId);
    return allAds;
  }
}
