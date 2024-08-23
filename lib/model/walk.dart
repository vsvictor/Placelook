import 'package:Placelook/model/type_walk.dart';
import 'package:Placelook/model/user.dart';

import 'package:Placelook/model/languages.dart';
import 'package:Placelook/model/location.dart';

class Walk {
  late String name;
  late String city;
  late Location? location;
  late DateTime? time;
  late User? who;
  late int? duration;
  late Languages language;
  late TypeWalk typeWalk;

  Walk(
      {this.name = "",
      this.city = "",
      required this.location,
      required this.time,
      required this.who,
      required this.duration,
      this.language = Languages.Undefined,
      this.typeWalk = TypeWalk.FREE});
  Walk.empty() {
    name = "";
    city = "";
    location = null;
    time = null;
    who = null;
    duration = null;
    language = Languages.Undefined;
    typeWalk = TypeWalk.FREE;
  }
}

typedef Walks = List<Walk>;
