import 'package:Placelook/model/type_walk.dart';
import 'package:Placelook/model/profile.dart';

import 'package:Placelook/model/languages.dart';
import 'package:Placelook/model/location.dart';
import 'package:Placelook/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'walk.freezed.dart';
part 'walk.g.dart';

@unfreezed
class Walk with _$Walk {
  Walk._();
  factory Walk(
      {@Default("") String id,
      @Default("") String name,
      @Default("") String city,
      @Default("") String about,
      @Default(null) Location? location,
      @Default(null) DateTime? time,
      @Default(null) Profile? who,
      @Default(null) int? duration,
      @Default(null) int? count,
      @Default(null) List<String>? places,
      @Default(Languages.UNDEFINED) Languages language,
      @Default(TypeWalk.FREE) TypeWalk typeWalk}) = _Walk;

  factory Walk.fromJson(Map<String, dynamic> json) => _$WalkFromJson(json);
  void generateID() {
    id = const Uuid().v4();
  }
}
