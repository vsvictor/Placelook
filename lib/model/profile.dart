import 'package:Placelook/model/languages.dart';
import 'package:Placelook/model/role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:Placelook/model/contact.dart';
import 'package:uuid/uuid.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@unfreezed
@Freezed(makeCollectionsUnmodifiable: false)
class Profile with _$Profile {
  Profile._();
  factory Profile(
      {@Default(null) String? id,
      @Default("") String firstName,
      @Default("") String lastName,
      required List<Contact>? contacts,
      @Default(Role.TRIPPER) Role role,
      @Default(0) int rate,
      @Default(Languages.UNDEFINED) Languages language}) = _Porfile;
  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  String? get email {
    var res = "";
    if (contacts != null) {
      var e = contacts?.whereType<EmailContact>();
      if (e != null && e.isNotEmpty) {
        var ee = (e.first).email;
        if (ee != null) res = ee;
      }
    }
    return res;
  }

  void generateID() {
    id = const Uuid().v4();
  }
}
