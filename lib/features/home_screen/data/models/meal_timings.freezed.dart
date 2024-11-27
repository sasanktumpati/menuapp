// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_timings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MealTimings _$MealTimingsFromJson(Map<String, dynamic> json) {
  return _MealTimings.fromJson(json);
}

/// @nodoc
mixin _$MealTimings {
  @JsonKey(name: "default_timings")
  Timings get defaultTimings => throw _privateConstructorUsedError;
  @JsonKey(name: "sunday_timings")
  Timings get sundayTimings => throw _privateConstructorUsedError;
  @JsonKey(name: "special_days")
  List<SpecialDay> get specialDays => throw _privateConstructorUsedError;
  @JsonKey(name: "meta")
  Meta get meta => throw _privateConstructorUsedError;

  /// Serializes this MealTimings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealTimings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealTimingsCopyWith<MealTimings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealTimingsCopyWith<$Res> {
  factory $MealTimingsCopyWith(
          MealTimings value, $Res Function(MealTimings) then) =
      _$MealTimingsCopyWithImpl<$Res, MealTimings>;
  @useResult
  $Res call(
      {@JsonKey(name: "default_timings") Timings defaultTimings,
      @JsonKey(name: "sunday_timings") Timings sundayTimings,
      @JsonKey(name: "special_days") List<SpecialDay> specialDays,
      @JsonKey(name: "meta") Meta meta});

  $TimingsCopyWith<$Res> get defaultTimings;
  $TimingsCopyWith<$Res> get sundayTimings;
  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$MealTimingsCopyWithImpl<$Res, $Val extends MealTimings>
    implements $MealTimingsCopyWith<$Res> {
  _$MealTimingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealTimings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultTimings = null,
    Object? sundayTimings = null,
    Object? specialDays = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      defaultTimings: null == defaultTimings
          ? _value.defaultTimings
          : defaultTimings // ignore: cast_nullable_to_non_nullable
              as Timings,
      sundayTimings: null == sundayTimings
          ? _value.sundayTimings
          : sundayTimings // ignore: cast_nullable_to_non_nullable
              as Timings,
      specialDays: null == specialDays
          ? _value.specialDays
          : specialDays // ignore: cast_nullable_to_non_nullable
              as List<SpecialDay>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ) as $Val);
  }

  /// Create a copy of MealTimings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimingsCopyWith<$Res> get defaultTimings {
    return $TimingsCopyWith<$Res>(_value.defaultTimings, (value) {
      return _then(_value.copyWith(defaultTimings: value) as $Val);
    });
  }

  /// Create a copy of MealTimings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimingsCopyWith<$Res> get sundayTimings {
    return $TimingsCopyWith<$Res>(_value.sundayTimings, (value) {
      return _then(_value.copyWith(sundayTimings: value) as $Val);
    });
  }

  /// Create a copy of MealTimings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res> get meta {
    return $MetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MealTimingsImplCopyWith<$Res>
    implements $MealTimingsCopyWith<$Res> {
  factory _$$MealTimingsImplCopyWith(
          _$MealTimingsImpl value, $Res Function(_$MealTimingsImpl) then) =
      __$$MealTimingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "default_timings") Timings defaultTimings,
      @JsonKey(name: "sunday_timings") Timings sundayTimings,
      @JsonKey(name: "special_days") List<SpecialDay> specialDays,
      @JsonKey(name: "meta") Meta meta});

  @override
  $TimingsCopyWith<$Res> get defaultTimings;
  @override
  $TimingsCopyWith<$Res> get sundayTimings;
  @override
  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$MealTimingsImplCopyWithImpl<$Res>
    extends _$MealTimingsCopyWithImpl<$Res, _$MealTimingsImpl>
    implements _$$MealTimingsImplCopyWith<$Res> {
  __$$MealTimingsImplCopyWithImpl(
      _$MealTimingsImpl _value, $Res Function(_$MealTimingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealTimings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultTimings = null,
    Object? sundayTimings = null,
    Object? specialDays = null,
    Object? meta = null,
  }) {
    return _then(_$MealTimingsImpl(
      defaultTimings: null == defaultTimings
          ? _value.defaultTimings
          : defaultTimings // ignore: cast_nullable_to_non_nullable
              as Timings,
      sundayTimings: null == sundayTimings
          ? _value.sundayTimings
          : sundayTimings // ignore: cast_nullable_to_non_nullable
              as Timings,
      specialDays: null == specialDays
          ? _value._specialDays
          : specialDays // ignore: cast_nullable_to_non_nullable
              as List<SpecialDay>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealTimingsImpl implements _MealTimings {
  const _$MealTimingsImpl(
      {@JsonKey(name: "default_timings") required this.defaultTimings,
      @JsonKey(name: "sunday_timings") required this.sundayTimings,
      @JsonKey(name: "special_days")
      required final List<SpecialDay> specialDays,
      @JsonKey(name: "meta") required this.meta})
      : _specialDays = specialDays;

  factory _$MealTimingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealTimingsImplFromJson(json);

  @override
  @JsonKey(name: "default_timings")
  final Timings defaultTimings;
  @override
  @JsonKey(name: "sunday_timings")
  final Timings sundayTimings;
  final List<SpecialDay> _specialDays;
  @override
  @JsonKey(name: "special_days")
  List<SpecialDay> get specialDays {
    if (_specialDays is EqualUnmodifiableListView) return _specialDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialDays);
  }

  @override
  @JsonKey(name: "meta")
  final Meta meta;

  @override
  String toString() {
    return 'MealTimings(defaultTimings: $defaultTimings, sundayTimings: $sundayTimings, specialDays: $specialDays, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealTimingsImpl &&
            (identical(other.defaultTimings, defaultTimings) ||
                other.defaultTimings == defaultTimings) &&
            (identical(other.sundayTimings, sundayTimings) ||
                other.sundayTimings == sundayTimings) &&
            const DeepCollectionEquality()
                .equals(other._specialDays, _specialDays) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, defaultTimings, sundayTimings,
      const DeepCollectionEquality().hash(_specialDays), meta);

  /// Create a copy of MealTimings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealTimingsImplCopyWith<_$MealTimingsImpl> get copyWith =>
      __$$MealTimingsImplCopyWithImpl<_$MealTimingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealTimingsImplToJson(
      this,
    );
  }
}

abstract class _MealTimings implements MealTimings {
  const factory _MealTimings(
      {@JsonKey(name: "default_timings") required final Timings defaultTimings,
      @JsonKey(name: "sunday_timings") required final Timings sundayTimings,
      @JsonKey(name: "special_days")
      required final List<SpecialDay> specialDays,
      @JsonKey(name: "meta") required final Meta meta}) = _$MealTimingsImpl;

  factory _MealTimings.fromJson(Map<String, dynamic> json) =
      _$MealTimingsImpl.fromJson;

  @override
  @JsonKey(name: "default_timings")
  Timings get defaultTimings;
  @override
  @JsonKey(name: "sunday_timings")
  Timings get sundayTimings;
  @override
  @JsonKey(name: "special_days")
  List<SpecialDay> get specialDays;
  @override
  @JsonKey(name: "meta")
  Meta get meta;

  /// Create a copy of MealTimings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealTimingsImplCopyWith<_$MealTimingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Timings _$TimingsFromJson(Map<String, dynamic> json) {
  return _Timings.fromJson(json);
}

/// @nodoc
mixin _$Timings {
  @JsonKey(name: "breakfast")
  MealType get breakfast => throw _privateConstructorUsedError;
  @JsonKey(name: "lunch")
  MealType get lunch => throw _privateConstructorUsedError;
  @JsonKey(name: "dinner")
  MealType get dinner => throw _privateConstructorUsedError;

  /// Serializes this Timings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Timings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimingsCopyWith<Timings> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimingsCopyWith<$Res> {
  factory $TimingsCopyWith(Timings value, $Res Function(Timings) then) =
      _$TimingsCopyWithImpl<$Res, Timings>;
  @useResult
  $Res call(
      {@JsonKey(name: "breakfast") MealType breakfast,
      @JsonKey(name: "lunch") MealType lunch,
      @JsonKey(name: "dinner") MealType dinner});

  $MealTypeCopyWith<$Res> get breakfast;
  $MealTypeCopyWith<$Res> get lunch;
  $MealTypeCopyWith<$Res> get dinner;
}

/// @nodoc
class _$TimingsCopyWithImpl<$Res, $Val extends Timings>
    implements $TimingsCopyWith<$Res> {
  _$TimingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Timings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breakfast = null,
    Object? lunch = null,
    Object? dinner = null,
  }) {
    return _then(_value.copyWith(
      breakfast: null == breakfast
          ? _value.breakfast
          : breakfast // ignore: cast_nullable_to_non_nullable
              as MealType,
      lunch: null == lunch
          ? _value.lunch
          : lunch // ignore: cast_nullable_to_non_nullable
              as MealType,
      dinner: null == dinner
          ? _value.dinner
          : dinner // ignore: cast_nullable_to_non_nullable
              as MealType,
    ) as $Val);
  }

  /// Create a copy of Timings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MealTypeCopyWith<$Res> get breakfast {
    return $MealTypeCopyWith<$Res>(_value.breakfast, (value) {
      return _then(_value.copyWith(breakfast: value) as $Val);
    });
  }

  /// Create a copy of Timings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MealTypeCopyWith<$Res> get lunch {
    return $MealTypeCopyWith<$Res>(_value.lunch, (value) {
      return _then(_value.copyWith(lunch: value) as $Val);
    });
  }

  /// Create a copy of Timings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MealTypeCopyWith<$Res> get dinner {
    return $MealTypeCopyWith<$Res>(_value.dinner, (value) {
      return _then(_value.copyWith(dinner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TimingsImplCopyWith<$Res> implements $TimingsCopyWith<$Res> {
  factory _$$TimingsImplCopyWith(
          _$TimingsImpl value, $Res Function(_$TimingsImpl) then) =
      __$$TimingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "breakfast") MealType breakfast,
      @JsonKey(name: "lunch") MealType lunch,
      @JsonKey(name: "dinner") MealType dinner});

  @override
  $MealTypeCopyWith<$Res> get breakfast;
  @override
  $MealTypeCopyWith<$Res> get lunch;
  @override
  $MealTypeCopyWith<$Res> get dinner;
}

/// @nodoc
class __$$TimingsImplCopyWithImpl<$Res>
    extends _$TimingsCopyWithImpl<$Res, _$TimingsImpl>
    implements _$$TimingsImplCopyWith<$Res> {
  __$$TimingsImplCopyWithImpl(
      _$TimingsImpl _value, $Res Function(_$TimingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Timings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breakfast = null,
    Object? lunch = null,
    Object? dinner = null,
  }) {
    return _then(_$TimingsImpl(
      breakfast: null == breakfast
          ? _value.breakfast
          : breakfast // ignore: cast_nullable_to_non_nullable
              as MealType,
      lunch: null == lunch
          ? _value.lunch
          : lunch // ignore: cast_nullable_to_non_nullable
              as MealType,
      dinner: null == dinner
          ? _value.dinner
          : dinner // ignore: cast_nullable_to_non_nullable
              as MealType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimingsImpl implements _Timings {
  const _$TimingsImpl(
      {@JsonKey(name: "breakfast") required this.breakfast,
      @JsonKey(name: "lunch") required this.lunch,
      @JsonKey(name: "dinner") required this.dinner});

  factory _$TimingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimingsImplFromJson(json);

  @override
  @JsonKey(name: "breakfast")
  final MealType breakfast;
  @override
  @JsonKey(name: "lunch")
  final MealType lunch;
  @override
  @JsonKey(name: "dinner")
  final MealType dinner;

  @override
  String toString() {
    return 'Timings(breakfast: $breakfast, lunch: $lunch, dinner: $dinner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimingsImpl &&
            (identical(other.breakfast, breakfast) ||
                other.breakfast == breakfast) &&
            (identical(other.lunch, lunch) || other.lunch == lunch) &&
            (identical(other.dinner, dinner) || other.dinner == dinner));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, breakfast, lunch, dinner);

  /// Create a copy of Timings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimingsImplCopyWith<_$TimingsImpl> get copyWith =>
      __$$TimingsImplCopyWithImpl<_$TimingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimingsImplToJson(
      this,
    );
  }
}

abstract class _Timings implements Timings {
  const factory _Timings(
      {@JsonKey(name: "breakfast") required final MealType breakfast,
      @JsonKey(name: "lunch") required final MealType lunch,
      @JsonKey(name: "dinner") required final MealType dinner}) = _$TimingsImpl;

  factory _Timings.fromJson(Map<String, dynamic> json) = _$TimingsImpl.fromJson;

  @override
  @JsonKey(name: "breakfast")
  MealType get breakfast;
  @override
  @JsonKey(name: "lunch")
  MealType get lunch;
  @override
  @JsonKey(name: "dinner")
  MealType get dinner;

  /// Create a copy of Timings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimingsImplCopyWith<_$TimingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MealType _$MealTypeFromJson(Map<String, dynamic> json) {
  return _MealType.fromJson(json);
}

/// @nodoc
mixin _$MealType {
  @JsonKey(name: "start")
  String get start => throw _privateConstructorUsedError;
  @JsonKey(name: "end")
  String get end => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String get type => throw _privateConstructorUsedError;

  /// Serializes this MealType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealTypeCopyWith<MealType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealTypeCopyWith<$Res> {
  factory $MealTypeCopyWith(MealType value, $Res Function(MealType) then) =
      _$MealTypeCopyWithImpl<$Res, MealType>;
  @useResult
  $Res call(
      {@JsonKey(name: "start") String start,
      @JsonKey(name: "end") String end,
      @JsonKey(name: "type") String type});
}

/// @nodoc
class _$MealTypeCopyWithImpl<$Res, $Val extends MealType>
    implements $MealTypeCopyWith<$Res> {
  _$MealTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealTypeImplCopyWith<$Res>
    implements $MealTypeCopyWith<$Res> {
  factory _$$MealTypeImplCopyWith(
          _$MealTypeImpl value, $Res Function(_$MealTypeImpl) then) =
      __$$MealTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "start") String start,
      @JsonKey(name: "end") String end,
      @JsonKey(name: "type") String type});
}

/// @nodoc
class __$$MealTypeImplCopyWithImpl<$Res>
    extends _$MealTypeCopyWithImpl<$Res, _$MealTypeImpl>
    implements _$$MealTypeImplCopyWith<$Res> {
  __$$MealTypeImplCopyWithImpl(
      _$MealTypeImpl _value, $Res Function(_$MealTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? type = null,
  }) {
    return _then(_$MealTypeImpl(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealTypeImpl implements _MealType {
  const _$MealTypeImpl(
      {@JsonKey(name: "start") required this.start,
      @JsonKey(name: "end") required this.end,
      @JsonKey(name: "type") required this.type});

  factory _$MealTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealTypeImplFromJson(json);

  @override
  @JsonKey(name: "start")
  final String start;
  @override
  @JsonKey(name: "end")
  final String end;
  @override
  @JsonKey(name: "type")
  final String type;

  @override
  String toString() {
    return 'MealType(start: $start, end: $end, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealTypeImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, start, end, type);

  /// Create a copy of MealType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealTypeImplCopyWith<_$MealTypeImpl> get copyWith =>
      __$$MealTypeImplCopyWithImpl<_$MealTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealTypeImplToJson(
      this,
    );
  }
}

abstract class _MealType implements MealType {
  const factory _MealType(
      {@JsonKey(name: "start") required final String start,
      @JsonKey(name: "end") required final String end,
      @JsonKey(name: "type") required final String type}) = _$MealTypeImpl;

  factory _MealType.fromJson(Map<String, dynamic> json) =
      _$MealTypeImpl.fromJson;

  @override
  @JsonKey(name: "start")
  String get start;
  @override
  @JsonKey(name: "end")
  String get end;
  @override
  @JsonKey(name: "type")
  String get type;

  /// Create a copy of MealType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealTypeImplCopyWith<_$MealTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  @JsonKey(name: "timezone")
  String get timezone => throw _privateConstructorUsedError;
  @JsonKey(name: "last_updated")
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  @JsonKey(name: "version")
  String get version => throw _privateConstructorUsedError;

  /// Serializes this Meta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call(
      {@JsonKey(name: "timezone") String timezone,
      @JsonKey(name: "last_updated") DateTime lastUpdated,
      @JsonKey(name: "version") String version});
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timezone = null,
    Object? lastUpdated = null,
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaImplCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$MetaImplCopyWith(
          _$MetaImpl value, $Res Function(_$MetaImpl) then) =
      __$$MetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "timezone") String timezone,
      @JsonKey(name: "last_updated") DateTime lastUpdated,
      @JsonKey(name: "version") String version});
}

/// @nodoc
class __$$MetaImplCopyWithImpl<$Res>
    extends _$MetaCopyWithImpl<$Res, _$MetaImpl>
    implements _$$MetaImplCopyWith<$Res> {
  __$$MetaImplCopyWithImpl(_$MetaImpl _value, $Res Function(_$MetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timezone = null,
    Object? lastUpdated = null,
    Object? version = null,
  }) {
    return _then(_$MetaImpl(
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaImpl implements _Meta {
  const _$MetaImpl(
      {@JsonKey(name: "timezone") required this.timezone,
      @JsonKey(name: "last_updated") required this.lastUpdated,
      @JsonKey(name: "version") required this.version});

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  @JsonKey(name: "timezone")
  final String timezone;
  @override
  @JsonKey(name: "last_updated")
  final DateTime lastUpdated;
  @override
  @JsonKey(name: "version")
  final String version;

  @override
  String toString() {
    return 'Meta(timezone: $timezone, lastUpdated: $lastUpdated, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaImpl &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, timezone, lastUpdated, version);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      __$$MetaImplCopyWithImpl<_$MetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaImplToJson(
      this,
    );
  }
}

abstract class _Meta implements Meta {
  const factory _Meta(
      {@JsonKey(name: "timezone") required final String timezone,
      @JsonKey(name: "last_updated") required final DateTime lastUpdated,
      @JsonKey(name: "version") required final String version}) = _$MetaImpl;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  @JsonKey(name: "timezone")
  String get timezone;
  @override
  @JsonKey(name: "last_updated")
  DateTime get lastUpdated;
  @override
  @JsonKey(name: "version")
  String get version;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpecialDay _$SpecialDayFromJson(Map<String, dynamic> json) {
  return _SpecialDay.fromJson(json);
}

/// @nodoc
mixin _$SpecialDay {
  @JsonKey(name: "date")
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "timings")
  Timings get timings => throw _privateConstructorUsedError;

  /// Serializes this SpecialDay to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpecialDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecialDayCopyWith<SpecialDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialDayCopyWith<$Res> {
  factory $SpecialDayCopyWith(
          SpecialDay value, $Res Function(SpecialDay) then) =
      _$SpecialDayCopyWithImpl<$Res, SpecialDay>;
  @useResult
  $Res call(
      {@JsonKey(name: "date") DateTime date,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "timings") Timings timings});

  $TimingsCopyWith<$Res> get timings;
}

/// @nodoc
class _$SpecialDayCopyWithImpl<$Res, $Val extends SpecialDay>
    implements $SpecialDayCopyWith<$Res> {
  _$SpecialDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpecialDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? name = null,
    Object? timings = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      timings: null == timings
          ? _value.timings
          : timings // ignore: cast_nullable_to_non_nullable
              as Timings,
    ) as $Val);
  }

  /// Create a copy of SpecialDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimingsCopyWith<$Res> get timings {
    return $TimingsCopyWith<$Res>(_value.timings, (value) {
      return _then(_value.copyWith(timings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SpecialDayImplCopyWith<$Res>
    implements $SpecialDayCopyWith<$Res> {
  factory _$$SpecialDayImplCopyWith(
          _$SpecialDayImpl value, $Res Function(_$SpecialDayImpl) then) =
      __$$SpecialDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "date") DateTime date,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "timings") Timings timings});

  @override
  $TimingsCopyWith<$Res> get timings;
}

/// @nodoc
class __$$SpecialDayImplCopyWithImpl<$Res>
    extends _$SpecialDayCopyWithImpl<$Res, _$SpecialDayImpl>
    implements _$$SpecialDayImplCopyWith<$Res> {
  __$$SpecialDayImplCopyWithImpl(
      _$SpecialDayImpl _value, $Res Function(_$SpecialDayImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpecialDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? name = null,
    Object? timings = null,
  }) {
    return _then(_$SpecialDayImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      timings: null == timings
          ? _value.timings
          : timings // ignore: cast_nullable_to_non_nullable
              as Timings,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecialDayImpl implements _SpecialDay {
  const _$SpecialDayImpl(
      {@JsonKey(name: "date") required this.date,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "timings") required this.timings});

  factory _$SpecialDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecialDayImplFromJson(json);

  @override
  @JsonKey(name: "date")
  final DateTime date;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "timings")
  final Timings timings;

  @override
  String toString() {
    return 'SpecialDay(date: $date, name: $name, timings: $timings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecialDayImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.timings, timings) || other.timings == timings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, name, timings);

  /// Create a copy of SpecialDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecialDayImplCopyWith<_$SpecialDayImpl> get copyWith =>
      __$$SpecialDayImplCopyWithImpl<_$SpecialDayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecialDayImplToJson(
      this,
    );
  }
}

abstract class _SpecialDay implements SpecialDay {
  const factory _SpecialDay(
          {@JsonKey(name: "date") required final DateTime date,
          @JsonKey(name: "name") required final String name,
          @JsonKey(name: "timings") required final Timings timings}) =
      _$SpecialDayImpl;

  factory _SpecialDay.fromJson(Map<String, dynamic> json) =
      _$SpecialDayImpl.fromJson;

  @override
  @JsonKey(name: "date")
  DateTime get date;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "timings")
  Timings get timings;

  /// Create a copy of SpecialDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecialDayImplCopyWith<_$SpecialDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
