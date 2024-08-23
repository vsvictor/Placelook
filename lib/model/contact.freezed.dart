// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Contact _$ContactFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'email':
      return EmailContact.fromJson(json);
    case 'phone':
      return PhoneContact.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Contact',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Contact {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? email) email,
    required TResult Function(String? phone) phone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? email)? email,
    TResult? Function(String? phone)? phone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? email)? email,
    TResult Function(String? phone)? phone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailContact value) email,
    required TResult Function(PhoneContact value) phone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailContact value)? email,
    TResult? Function(PhoneContact value)? phone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailContact value)? email,
    TResult Function(PhoneContact value)? phone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this Contact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) then) =
      _$ContactCopyWithImpl<$Res, Contact>;
}

/// @nodoc
class _$ContactCopyWithImpl<$Res, $Val extends Contact>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$EmailContactImplCopyWith<$Res> {
  factory _$$EmailContactImplCopyWith(
          _$EmailContactImpl value, $Res Function(_$EmailContactImpl) then) =
      __$$EmailContactImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? email});
}

/// @nodoc
class __$$EmailContactImplCopyWithImpl<$Res>
    extends _$ContactCopyWithImpl<$Res, _$EmailContactImpl>
    implements _$$EmailContactImplCopyWith<$Res> {
  __$$EmailContactImplCopyWithImpl(
      _$EmailContactImpl _value, $Res Function(_$EmailContactImpl) _then)
      : super(_value, _then);

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_$EmailContactImpl(
      freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailContactImpl extends EmailContact {
  _$EmailContactImpl(this.email, {final String? $type})
      : $type = $type ?? 'email',
        super._();

  factory _$EmailContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailContactImplFromJson(json);

  @override
  String? email;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Contact.email(email: $email)';
  }

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailContactImplCopyWith<_$EmailContactImpl> get copyWith =>
      __$$EmailContactImplCopyWithImpl<_$EmailContactImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? email) email,
    required TResult Function(String? phone) phone,
  }) {
    return email(this.email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? email)? email,
    TResult? Function(String? phone)? phone,
  }) {
    return email?.call(this.email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? email)? email,
    TResult Function(String? phone)? phone,
    required TResult orElse(),
  }) {
    if (email != null) {
      return email(this.email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailContact value) email,
    required TResult Function(PhoneContact value) phone,
  }) {
    return email(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailContact value)? email,
    TResult? Function(PhoneContact value)? phone,
  }) {
    return email?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailContact value)? email,
    TResult Function(PhoneContact value)? phone,
    required TResult orElse(),
  }) {
    if (email != null) {
      return email(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailContactImplToJson(
      this,
    );
  }
}

abstract class EmailContact extends Contact {
  factory EmailContact(String? email) = _$EmailContactImpl;
  EmailContact._() : super._();

  factory EmailContact.fromJson(Map<String, dynamic> json) =
      _$EmailContactImpl.fromJson;

  String? get email;
  set email(String? value);

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailContactImplCopyWith<_$EmailContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PhoneContactImplCopyWith<$Res> {
  factory _$$PhoneContactImplCopyWith(
          _$PhoneContactImpl value, $Res Function(_$PhoneContactImpl) then) =
      __$$PhoneContactImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? phone});
}

/// @nodoc
class __$$PhoneContactImplCopyWithImpl<$Res>
    extends _$ContactCopyWithImpl<$Res, _$PhoneContactImpl>
    implements _$$PhoneContactImplCopyWith<$Res> {
  __$$PhoneContactImplCopyWithImpl(
      _$PhoneContactImpl _value, $Res Function(_$PhoneContactImpl) _then)
      : super(_value, _then);

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = freezed,
  }) {
    return _then(_$PhoneContactImpl(
      freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhoneContactImpl extends PhoneContact {
  _$PhoneContactImpl(this.phone, {final String? $type})
      : $type = $type ?? 'phone',
        super._();

  factory _$PhoneContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhoneContactImplFromJson(json);

  @override
  String? phone;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Contact.phone(phone: $phone)';
  }

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneContactImplCopyWith<_$PhoneContactImpl> get copyWith =>
      __$$PhoneContactImplCopyWithImpl<_$PhoneContactImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? email) email,
    required TResult Function(String? phone) phone,
  }) {
    return phone(this.phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? email)? email,
    TResult? Function(String? phone)? phone,
  }) {
    return phone?.call(this.phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? email)? email,
    TResult Function(String? phone)? phone,
    required TResult orElse(),
  }) {
    if (phone != null) {
      return phone(this.phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailContact value) email,
    required TResult Function(PhoneContact value) phone,
  }) {
    return phone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailContact value)? email,
    TResult? Function(PhoneContact value)? phone,
  }) {
    return phone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailContact value)? email,
    TResult Function(PhoneContact value)? phone,
    required TResult orElse(),
  }) {
    if (phone != null) {
      return phone(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PhoneContactImplToJson(
      this,
    );
  }
}

abstract class PhoneContact extends Contact {
  factory PhoneContact(String? phone) = _$PhoneContactImpl;
  PhoneContact._() : super._();

  factory PhoneContact.fromJson(Map<String, dynamic> json) =
      _$PhoneContactImpl.fromJson;

  String? get phone;
  set phone(String? value);

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneContactImplCopyWith<_$PhoneContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
