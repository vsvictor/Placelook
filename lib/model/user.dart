import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@unfreezed
@Freezed(makeCollectionsUnmodifiable: false)
class User with _$User {
  User._();
  factory User(
      {@JsonKey(name: "_id", defaultValue: null) String? id,
      @JsonKey(name: "login") @Default("") String login,
      @JsonKey(name: "password") @Default("") String password,
      @JsonKey(name: "token") @Default("") token}) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
