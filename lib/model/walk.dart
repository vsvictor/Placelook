import 'package:Placelook/model/type_walk.dart';
import 'package:Placelook/model/profile.dart';

import 'package:Placelook/model/languages.dart';
import 'package:Placelook/model/location.dart';
import 'package:Placelook/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mongo_dart/mongo_dart.dart';

import 'convertors/object_id_string.dart';

part 'walk.freezed.dart';
part 'walk.g.dart';

@unfreezed
@HiveType(typeId: 2)
class Walk extends HiveObject with _$Walk {
  Walk._();
  factory Walk(
      {@HiveField(0)
      @JsonKey(name: "_id", defaultValue: null)
      @ObjectIdString()
      ObjectId? id,
      @HiveField(1) @JsonKey(name: "name", defaultValue: "") String? name,
      @HiveField(2) @JsonKey(name: "city", defaultValue: "") String? city,
      @HiveField(3) @JsonKey(name: "about", defaultValue: "") String? about,
      @HiveField(4)
      @JsonKey(name: "location", defaultValue: null)
      Location? location,
      @HiveField(5) @JsonKey(name: "time", defaultValue: null) DateTime? time,
      @HiveField(6) @JsonKey(name: "who", defaultValue: null) Profile? who,
      @HiveField(7) @JsonKey(name: "duration", defaultValue: 0) int? duration,
      @HiveField(8) @JsonKey(name: "count", defaultValue: 0) int? count,
      @HiveField(9)
      @JsonKey(name: "places", defaultValue: null)
      List<String>? places,
      @HiveField(10)
      @JsonKey(name: "language", defaultValue: Languages.UNDEFINED)
      Languages? language,
      @HiveField(11)
      @JsonKey(name: "typeWalk", defaultValue: TypeWalk.FREE)
      TypeWalk? typeWalk}) = _Walk;

  factory Walk.fromJson(Map<String, dynamic> json) => _$WalkFromJson(json);
}
