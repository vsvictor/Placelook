// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'walk.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Walk _$WalkFromJson(Map<String, dynamic> json) {
  return _Walk.fromJson(json);
}

/// @nodoc
mixin _$Walk {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  set city(String value) => throw _privateConstructorUsedError;
  String get about => throw _privateConstructorUsedError;
  set about(String value) => throw _privateConstructorUsedError;
  Location? get location => throw _privateConstructorUsedError;
  set location(Location? value) => throw _privateConstructorUsedError;
  DateTime? get time => throw _privateConstructorUsedError;
  set time(DateTime? value) => throw _privateConstructorUsedError;
  Profile? get who => throw _privateConstructorUsedError;
  set who(Profile? value) => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  set duration(int? value) => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  set count(int? value) => throw _privateConstructorUsedError;
  List<String>? get places => throw _privateConstructorUsedError;
  set places(List<String>? value) => throw _privateConstructorUsedError;
  Languages get language => throw _privateConstructorUsedError;
  set language(Languages value) => throw _privateConstructorUsedError;
  TypeWalk get typeWalk => throw _privateConstructorUsedError;
  set typeWalk(TypeWalk value) => throw _privateConstructorUsedError;

  /// Serializes this Walk to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Walk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalkCopyWith<Walk> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalkCopyWith<$Res> {
  factory $WalkCopyWith(Walk value, $Res Function(Walk) then) =
      _$WalkCopyWithImpl<$Res, Walk>;
  @useResult
  $Res call(
      {String id,
      String name,
      String city,
      String about,
      Location? location,
      DateTime? time,
      Profile? who,
      int? duration,
      int? count,
      List<String>? places,
      Languages language,
      TypeWalk typeWalk});

  $LocationCopyWith<$Res>? get location;
  $ProfileCopyWith<$Res>? get who;
}

/// @nodoc
class _$WalkCopyWithImpl<$Res, $Val extends Walk>
    implements $WalkCopyWith<$Res> {
  _$WalkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Walk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? city = null,
    Object? about = null,
    Object? location = freezed,
    Object? time = freezed,
    Object? who = freezed,
    Object? duration = freezed,
    Object? count = freezed,
    Object? places = freezed,
    Object? language = null,
    Object? typeWalk = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      who: freezed == who
          ? _value.who
          : who // ignore: cast_nullable_to_non_nullable
              as Profile?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      places: freezed == places
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Languages,
      typeWalk: null == typeWalk
          ? _value.typeWalk
          : typeWalk // ignore: cast_nullable_to_non_nullable
              as TypeWalk,
    ) as $Val);
  }

  /// Create a copy of Walk
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of Walk
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get who {
    if (_value.who == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.who!, (value) {
      return _then(_value.copyWith(who: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WalkImplCopyWith<$Res> implements $WalkCopyWith<$Res> {
  factory _$$WalkImplCopyWith(
          _$WalkImpl value, $Res Function(_$WalkImpl) then) =
      __$$WalkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String city,
      String about,
      Location? location,
      DateTime? time,
      Profile? who,
      int? duration,
      int? count,
      List<String>? places,
      Languages language,
      TypeWalk typeWalk});

  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $ProfileCopyWith<$Res>? get who;
}

/// @nodoc
class __$$WalkImplCopyWithImpl<$Res>
    extends _$WalkCopyWithImpl<$Res, _$WalkImpl>
    implements _$$WalkImplCopyWith<$Res> {
  __$$WalkImplCopyWithImpl(_$WalkImpl _value, $Res Function(_$WalkImpl) _then)
      : super(_value, _then);

  /// Create a copy of Walk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? city = null,
    Object? about = null,
    Object? location = freezed,
    Object? time = freezed,
    Object? who = freezed,
    Object? duration = freezed,
    Object? count = freezed,
    Object? places = freezed,
    Object? language = null,
    Object? typeWalk = null,
  }) {
    return _then(_$WalkImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      who: freezed == who
          ? _value.who
          : who // ignore: cast_nullable_to_non_nullable
              as Profile?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      places: freezed == places
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Languages,
      typeWalk: null == typeWalk
          ? _value.typeWalk
          : typeWalk // ignore: cast_nullable_to_non_nullable
              as TypeWalk,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalkImpl extends _Walk {
  _$WalkImpl(
      {this.id = "",
      this.name = "",
      this.city = "",
      this.about = "",
      this.location = null,
      this.time = null,
      this.who = null,
      this.duration = null,
      this.count = null,
      this.places = null,
      this.language = Languages.UNDEFINED,
      this.typeWalk = TypeWalk.FREE})
      : super._();

  factory _$WalkImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalkImplFromJson(json);

  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String name;
  @override
  @JsonKey()
  String city;
  @override
  @JsonKey()
  String about;
  @override
  @JsonKey()
  Location? location;
  @override
  @JsonKey()
  DateTime? time;
  @override
  @JsonKey()
  Profile? who;
  @override
  @JsonKey()
  int? duration;
  @override
  @JsonKey()
  int? count;
  @override
  @JsonKey()
  List<String>? places;
  @override
  @JsonKey()
  Languages language;
  @override
  @JsonKey()
  TypeWalk typeWalk;

  @override
  String toString() {
    return 'Walk(id: $id, name: $name, city: $city, about: $about, location: $location, time: $time, who: $who, duration: $duration, count: $count, places: $places, language: $language, typeWalk: $typeWalk)';
  }

  /// Create a copy of Walk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalkImplCopyWith<_$WalkImpl> get copyWith =>
      __$$WalkImplCopyWithImpl<_$WalkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalkImplToJson(
      this,
    );
  }
}

abstract class _Walk extends Walk {
  factory _Walk(
      {String id,
      String name,
      String city,
      String about,
      Location? location,
      DateTime? time,
      Profile? who,
      int? duration,
      int? count,
      List<String>? places,
      Languages language,
      TypeWalk typeWalk}) = _$WalkImpl;
  _Walk._() : super._();

  factory _Walk.fromJson(Map<String, dynamic> json) = _$WalkImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get name;
  set name(String value);
  @override
  String get city;
  set city(String value);
  @override
  String get about;
  set about(String value);
  @override
  Location? get location;
  set location(Location? value);
  @override
  DateTime? get time;
  set time(DateTime? value);
  @override
  Profile? get who;
  set who(Profile? value);
  @override
  int? get duration;
  set duration(int? value);
  @override
  int? get count;
  set count(int? value);
  @override
  List<String>? get places;
  set places(List<String>? value);
  @override
  Languages get language;
  set language(Languages value);
  @override
  TypeWalk get typeWalk;
  set typeWalk(TypeWalk value);

  /// Create a copy of Walk
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalkImplCopyWith<_$WalkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
