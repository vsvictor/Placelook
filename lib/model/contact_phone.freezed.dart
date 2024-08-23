// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_phone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhoneContact _$PhoneContactFromJson(Map<String, dynamic> json) {
  return _PhoneContact.fromJson(json);
}

/// @nodoc
mixin _$PhoneContact {
  String? get phone => throw _privateConstructorUsedError;
  set phone(String? value) => throw _privateConstructorUsedError;

  /// Serializes this PhoneContact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhoneContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhoneContactCopyWith<PhoneContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneContactCopyWith<$Res> {
  factory $PhoneContactCopyWith(
          PhoneContact value, $Res Function(PhoneContact) then) =
      _$PhoneContactCopyWithImpl<$Res, PhoneContact>;
  @useResult
  $Res call({String? phone});
}

/// @nodoc
class _$PhoneContactCopyWithImpl<$Res, $Val extends PhoneContact>
    implements $PhoneContactCopyWith<$Res> {
  _$PhoneContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhoneContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhoneContactImplCopyWith<$Res>
    implements $PhoneContactCopyWith<$Res> {
  factory _$$PhoneContactImplCopyWith(
          _$PhoneContactImpl value, $Res Function(_$PhoneContactImpl) then) =
      __$$PhoneContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? phone});
}

/// @nodoc
class __$$PhoneContactImplCopyWithImpl<$Res>
    extends _$PhoneContactCopyWithImpl<$Res, _$PhoneContactImpl>
    implements _$$PhoneContactImplCopyWith<$Res> {
  __$$PhoneContactImplCopyWithImpl(
      _$PhoneContactImpl _value, $Res Function(_$PhoneContactImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhoneContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = freezed,
  }) {
    return _then(_$PhoneContactImpl(
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhoneContactImpl extends _PhoneContact {
  _$PhoneContactImpl({this.phone = ""}) : super._();

  factory _$PhoneContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhoneContactImplFromJson(json);

  @override
  @JsonKey()
  String? phone;

  @override
  String toString() {
    return 'PhoneContact(phone: $phone)';
  }

  /// Create a copy of PhoneContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneContactImplCopyWith<_$PhoneContactImpl> get copyWith =>
      __$$PhoneContactImplCopyWithImpl<_$PhoneContactImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhoneContactImplToJson(
      this,
    );
  }
}

abstract class _PhoneContact extends PhoneContact {
  factory _PhoneContact({String? phone}) = _$PhoneContactImpl;
  _PhoneContact._() : super._();

  factory _PhoneContact.fromJson(Map<String, dynamic> json) =
      _$PhoneContactImpl.fromJson;

  @override
  String? get phone;
  set phone(String? value);

  /// Create a copy of PhoneContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneContactImplCopyWith<_$PhoneContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
