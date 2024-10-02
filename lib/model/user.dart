import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@unfreezed
@Freezed(makeCollectionsUnmodifiable: false)
class User with _$User{
  User._();
  factory User({
  @Default(null) String? id,
  @Default("") String login,
  @Default("") String password,
  @Default("") token}) = _User;
factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
