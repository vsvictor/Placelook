// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'walk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalkImpl _$$WalkImplFromJson(Map<String, dynamic> json) => _$WalkImpl(
      name: json['name'] as String? ?? "",
      city: json['city'] as String? ?? "",
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      who: json['who'] == null
          ? null
          : User.fromJson(json['who'] as Map<String, dynamic>),
      duration: (json['duration'] as num?)?.toInt() ?? null,
      language: $enumDecodeNullable(_$LanguagesEnumMap, json['language']) ??
          Languages.Undefined,
      typeWalk: $enumDecodeNullable(_$TypeWalkEnumMap, json['typeWalk']) ??
          TypeWalk.Free,
    );

Map<String, dynamic> _$$WalkImplToJson(_$WalkImpl instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'city': instance.city,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('location', instance.location?.toJson());
  writeNotNull('time', instance.time?.toIso8601String());
  writeNotNull('who', instance.who?.toJson());
  writeNotNull('duration', instance.duration);
  val['language'] = _$LanguagesEnumMap[instance.language]!;
  val['typeWalk'] = _$TypeWalkEnumMap[instance.typeWalk]!;
  return val;
}

const _$LanguagesEnumMap = {
  Languages.English: 'English',
  Languages.Franch: 'Franch',
  Languages.German: 'German',
  Languages.Ukranian: 'Ukranian',
  Languages.Undefined: 'Undefined',
};

const _$TypeWalkEnumMap = {
  TypeWalk.Paid: 'Paid',
  TypeWalk.Free: 'Free',
};
