import 'package:hive_flutter/hive_flutter.dart';

class SettingHelper {
  late bool welcomeScreenPassed;
  late bool hasUser;
  SettingHelper();

  init() async {
    await Hive.initFlutter();
    var box = await Hive.openBox('setting');
    welcomeScreenPassed =
        box.get("welcome") != null && box.get("welcome") == true ? true : false;
    hasUser = box.get("user") != null ? true : false;
  }

  setWelcome(bool value) async {
    var box = await Hive.openBox("setting");
    box.put("welcome", true);
  }
}
