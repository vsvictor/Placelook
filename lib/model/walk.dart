import 'package:Placelook/model/type_walk.dart';
import 'package:Placelook/model/user.dart';

import 'package:Placelook/model/languages.dart';
import 'package:Placelook/model/location.dart';

class Walk {
  final Location location;
  final DateTime time;
  final User who;
  final int duration;
  final Languages language;
  final TypeWalk typeWalk;

  Walk(this.location, this.time, this.who, this.duration,
      {this.language = Languages.English, this.typeWalk = TypeWalk.FREE});
}
