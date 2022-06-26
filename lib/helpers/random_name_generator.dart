import 'package:cheraphy/constants/random_names.dart';
import 'dart:math';

class RandomNameGenerator {
  var rng = Random();
  String createRandomName() {
    String adjective =
        uppercaseFirst(adjectives[rng.nextInt(adjectives.length - 1)]);
    String animal = uppercaseFirst(animals[rng.nextInt(animals.length - 1)]);

    return "$adjective $animal";
  }

  String uppercaseFirst(String value) {
    if (value.isEmpty) return "";
    List<String> slist = value.toLowerCase().split(" ");
    String rval = "";
    slist.forEach((s) {
      rval += "${s[0].toUpperCase()}${s.substring(1, s.length)} ";
    });

    return rval;
  }
}
