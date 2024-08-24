// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmailContactImpl _$$EmailContactImplFromJson(Map<String, dynamic> json) =>
    _$EmailContactImpl(
      json['email'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmailContactImplToJson(_$EmailContactImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  val['runtimeType'] = instance.$type;
  return val;
}

_$PhoneContactImpl _$$PhoneContactImplFromJson(Map<String, dynamic> json) =>
    _$PhoneContactImpl(
      json['phone'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PhoneContactImplToJson(_$PhoneContactImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phone', instance.phone);
  val['runtimeType'] = instance.$type;
  return val;
}
