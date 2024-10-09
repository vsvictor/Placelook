// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Porfile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  set firstName(String value) => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  set lastName(String value) => throw _privateConstructorUsedError;
  List<Contact>? get contacts => throw _privateConstructorUsedError;
  set contacts(List<Contact>? value) => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  set role(Role value) => throw _privateConstructorUsedError;
  int get rate => throw _privateConstructorUsedError;
  set rate(int value) => throw _privateConstructorUsedError;
  Languages get language => throw _privateConstructorUsedError;
  set language(Languages value) => throw _privateConstructorUsedError;

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {String? id,
      String firstName,
      String lastName,
      List<Contact>? contacts,
      Role role,
      int rate,
      Languages language});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? contacts = freezed,
    Object? role = null,
    Object? rate = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Languages,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PorfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$PorfileImplCopyWith(
          _$PorfileImpl value, $Res Function(_$PorfileImpl) then) =
      __$$PorfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String firstName,
      String lastName,
      List<Contact>? contacts,
      Role role,
      int rate,
      Languages language});
}

/// @nodoc
class __$$PorfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$PorfileImpl>
    implements _$$PorfileImplCopyWith<$Res> {
  __$$PorfileImplCopyWithImpl(
      _$PorfileImpl _value, $Res Function(_$PorfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? contacts = freezed,
    Object? role = null,
    Object? rate = null,
    Object? language = null,
  }) {
    return _then(_$PorfileImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Languages,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PorfileImpl extends _Porfile with DiagnosticableTreeMixin {
  _$PorfileImpl(
      {this.id = null,
      this.firstName = "",
      this.lastName = "",
      required this.contacts,
      this.role = Role.TRIPPER,
      this.rate = 0,
      this.language = Languages.UNDEFINED})
      : super._();

  factory _$PorfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$PorfileImplFromJson(json);

  @override
  @JsonKey()
  String? id;
  @override
  @JsonKey()
  String firstName;
  @override
  @JsonKey()
  String lastName;
  @override
  List<Contact>? contacts;
  @override
  @JsonKey()
  Role role;
  @override
  @JsonKey()
  int rate;
  @override
  @JsonKey()
  Languages language;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Profile(id: $id, firstName: $firstName, lastName: $lastName, contacts: $contacts, role: $role, rate: $rate, language: $language)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Profile'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('contacts', contacts))
      ..add(DiagnosticsProperty('role', role))
      ..add(DiagnosticsProperty('rate', rate))
      ..add(DiagnosticsProperty('language', language));
  }

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PorfileImplCopyWith<_$PorfileImpl> get copyWith =>
      __$$PorfileImplCopyWithImpl<_$PorfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PorfileImplToJson(
      this,
    );
  }
}

abstract class _Porfile extends Profile {
  factory _Porfile(
      {String? id,
      String firstName,
      String lastName,
      required List<Contact>? contacts,
      Role role,
      int rate,
      Languages language}) = _$PorfileImpl;
  _Porfile._() : super._();

  factory _Porfile.fromJson(Map<String, dynamic> json) = _$PorfileImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  String get firstName;
  set firstName(String value);
  @override
  String get lastName;
  set lastName(String value);
  @override
  List<Contact>? get contacts;
  set contacts(List<Contact>? value);
  @override
  Role get role;
  set role(Role value);
  @override
  int get rate;
  set rate(int value);
  @override
  Languages get language;
  set language(Languages value);

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PorfileImplCopyWith<_$PorfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
