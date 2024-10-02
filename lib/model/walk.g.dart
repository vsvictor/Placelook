// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'walk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalkImpl _$$WalkImplFromJson(Map<String, dynamic> json) => _$WalkImpl(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      city: json['city'] as String? ?? "",
      about: json['about'] as String? ?? "",
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      who: json['who'] == null
          ? null
          : Profile.fromJson(json['who'] as Map<String, dynamic>),
      duration: (json['duration'] as num?)?.toInt() ?? null,
      count: (json['count'] as num?)?.toInt() ?? null,
      places: (json['places'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          null,
      language: $enumDecodeNullable(_$LanguagesEnumMap, json['language']) ??
          Languages.UNDEFINED,
      typeWalk: $enumDecodeNullable(_$TypeWalkEnumMap, json['typeWalk']) ??
          TypeWalk.FREE,
    );

Map<String, dynamic> _$$WalkImplToJson(_$WalkImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'about': instance.about,
      'location': instance.location,
      'time': instance.time?.toIso8601String(),
      'who': instance.who,
      'duration': instance.duration,
      'count': instance.count,
      'places': instance.places,
      'language': _$LanguagesEnumMap[instance.language]!,
      'typeWalk': _$TypeWalkEnumMap[instance.typeWalk]!,
    };

const _$LanguagesEnumMap = {
  Languages.ENGLISH: 'ENGLISH',
  Languages.FRANCH: 'FRANCH',
  Languages.GERMAN: 'GERMAN',
  Languages.UKRANIAN: 'UKRANIAN',
  Languages.UNDEFINED: 'UNDEFINED',
};

const _$TypeWalkEnumMap = {
  TypeWalk.PAID: 'PAID',
  TypeWalk.FREE: 'FREE',
};
