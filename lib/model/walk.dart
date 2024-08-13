import 'dart:html';

import 'package:placelook/model/streamer.dart';
import 'package:placelook/model/languages.dart';
import 'package:placelook/model/location.dart';
import 'package:placelook/model/type_walk.dart';

class Walk {
  final Location location;
  final DateTime time;
  final Streamer who;
  final int duration;
  final Languages language;
  final TypeWalk typeWalk;

  Walk(this.location, this.time, this.who, this.duration, {this.language = Languages.ENGLISH,
      this.typeWalk = TypeWalk.FREE});
}
