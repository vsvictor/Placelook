// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PorfileImpl _$$PorfileImplFromJson(Map<String, dynamic> json) =>
    _$PorfileImpl(
      id: json['id'] as String? ?? null,
      firstName: json['firstName'] as String? ?? "",
      lastName: json['lastName'] as String? ?? "",
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']) ?? Role.TRIPPER,
      rate: (json['rate'] as num?)?.toInt() ?? 0,
      language: $enumDecodeNullable(_$LanguagesEnumMap, json['language']) ??
          Languages.UNDEFINED,
    );

Map<String, dynamic> _$$PorfileImplToJson(_$PorfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'contacts': instance.contacts,
      'role': _$RoleEnumMap[instance.role]!,
      'rate': instance.rate,
      'language': _$LanguagesEnumMap[instance.language]!,
    };

const _$RoleEnumMap = {
  Role.GUID: 'GUID',
  Role.TRIPPER: 'TRIPPER',
};

const _$LanguagesEnumMap = {
  Languages.ENGLISH: 'ENGLISH',
  Languages.FRANCH: 'FRANCH',
  Languages.GERMAN: 'GERMAN',
  Languages.UKRANIAN: 'UKRANIAN',
  Languages.UNDEFINED: 'UNDEFINED',
};
