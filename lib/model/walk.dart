import 'package:Placelook/model/type_walk.dart';
import 'package:Placelook/model/user.dart';

import 'package:Placelook/model/languages.dart';
import 'package:Placelook/model/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'walk.freezed.dart';
part 'walk.g.dart';

/*class Walk {
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
}*/

@unfreezed
class Walk with _$Walk {
  Walk._();
  factory Walk(
      {@Default("") String id,
      @Default("") String name,
      @Default("") String city,
      @Default(null) Location? location,
      @Default(null) DateTime? time,
      @Default(null) User? who,
      @Default(null) int? duration,
      @Default(Languages.UNDEFINED) Languages language,
      @Default(TypeWalk.FREE) TypeWalk typeWalk}) = _Walk;

  factory Walk.fromJson(Map<String, dynamic> json) => _$WalkFromJson(json);
  void generateID() {
    id = const Uuid().v4();
  }
}
