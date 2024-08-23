// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String? ?? null,
      firstName: json['firstName'] as String? ?? "",
      lastName: json['lastName'] as String? ?? "",
      contacts: (json['contacts'] as List<dynamic>)
          .map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']) ?? Role.Tripper,
      language: $enumDecodeNullable(_$LanguagesEnumMap, json['language']) ??
          Languages.Undefined,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'contacts': instance.contacts,
      'role': _$RoleEnumMap[instance.role]!,
      'language': _$LanguagesEnumMap[instance.language]!,
    };

const _$RoleEnumMap = {
  Role.Guid: 'Guid',
  Role.Tripper: 'Tripper',
};

const _$LanguagesEnumMap = {
  Languages.English: 'English',
  Languages.Franch: 'Franch',
  Languages.German: 'German',
  Languages.Ukranian: 'Ukranian',
  Languages.Undefined: 'Undefined',
};
