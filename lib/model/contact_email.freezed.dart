// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_email.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmailContact _$EmailContactFromJson(Map<String, dynamic> json) {
  return _EmailContact.fromJson(json);
}

/// @nodoc
mixin _$EmailContact {
  String? get email => throw _privateConstructorUsedError;
  set email(String? value) => throw _privateConstructorUsedError;

  /// Serializes this EmailContact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmailContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmailContactCopyWith<EmailContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailContactCopyWith<$Res> {
  factory $EmailContactCopyWith(
          EmailContact value, $Res Function(EmailContact) then) =
      _$EmailContactCopyWithImpl<$Res, EmailContact>;
  @useResult
  $Res call({String? email});
}

/// @nodoc
class _$EmailContactCopyWithImpl<$Res, $Val extends EmailContact>
    implements $EmailContactCopyWith<$Res> {
  _$EmailContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmailContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailContactImplCopyWith<$Res>
    implements $EmailContactCopyWith<$Res> {
  factory _$$EmailContactImplCopyWith(
          _$EmailContactImpl value, $Res Function(_$EmailContactImpl) then) =
      __$$EmailContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? email});
}

/// @nodoc
class __$$EmailContactImplCopyWithImpl<$Res>
    extends _$EmailContactCopyWithImpl<$Res, _$EmailContactImpl>
    implements _$$EmailContactImplCopyWith<$Res> {
  __$$EmailContactImplCopyWithImpl(
      _$EmailContactImpl _value, $Res Function(_$EmailContactImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmailContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_$EmailContactImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailContactImpl extends _EmailContact {
  _$EmailContactImpl({this.email = null}) : super._();

  factory _$EmailContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailContactImplFromJson(json);

  @override
  @JsonKey()
  String? email;

  @override
  String toString() {
    return 'EmailContact(email: $email)';
  }

  /// Create a copy of EmailContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailContactImplCopyWith<_$EmailContactImpl> get copyWith =>
      __$$EmailContactImplCopyWithImpl<_$EmailContactImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailContactImplToJson(
      this,
    );
  }
}

abstract class _EmailContact extends EmailContact {
  factory _EmailContact({String? email}) = _$EmailContactImpl;
  _EmailContact._() : super._();

  factory _EmailContact.fromJson(Map<String, dynamic> json) =
      _$EmailContactImpl.fromJson;

  @override
  String? get email;
  set email(String? value);

  /// Create a copy of EmailContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailContactImplCopyWith<_$EmailContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
