import 'package:freezed_annotation/freezed_annotation.dart';
part 'location.freezed.dart';
part 'location.g.dart';

/*
class Location {
  final double latitude;
  final double longitude;
  const Location(this.latitude, this.longitude);
}
*/

@unfreezed
class Location with _$Location{
  Location._();
  factory Location(
      double latitude,
      double longitude
      ) = _Location;
  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}