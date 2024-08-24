// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_email.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmailContactImpl _$$EmailContactImplFromJson(Map<String, dynamic> json) =>
    _$EmailContactImpl(
      email: json['email'] as String? ?? null,
    );

Map<String, dynamic> _$$EmailContactImplToJson(_$EmailContactImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  return val;
}
