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

Map<String, dynamic> _$$WalkImplToJson(_$WalkImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'city': instance.city,
      'location': instance.location,
      'time': instance.time?.toIso8601String(),
      'who': instance.who,
      'duration': instance.duration,
      'language': _$LanguagesEnumMap[instance.language]!,
      'typeWalk': _$TypeWalkEnumMap[instance.typeWalk]!,
    };

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
