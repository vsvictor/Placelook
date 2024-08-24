// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_phone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhoneContactImpl _$$PhoneContactImplFromJson(Map<String, dynamic> json) =>
    _$PhoneContactImpl(
      phone: json['phone'] as String? ?? "",
    );

Map<String, dynamic> _$$PhoneContactImplToJson(_$PhoneContactImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phone', instance.phone);
  return val;
}
