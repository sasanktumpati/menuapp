// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MenuResponseModel _$MenuResponseModelFromJson(Map<String, dynamic> json) {
  return _MenuResponseModel.fromJson(json);
}

/// @nodoc
mixin _$MenuResponseModel {
  DateTime? get date => throw _privateConstructorUsedError;
  String? get day => throw _privateConstructorUsedError;
  List<String>? get breakfast => throw _privateConstructorUsedError;
  List<String>? get lunch => throw _privateConstructorUsedError;
  List<String>? get dinner => throw _privateConstructorUsedError;

  /// Serializes this MenuResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuResponseModelCopyWith<MenuResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuResponseModelCopyWith<$Res> {
  factory $MenuResponseModelCopyWith(
          MenuResponseModel value, $Res Function(MenuResponseModel) then) =
      _$MenuResponseModelCopyWithImpl<$Res, MenuResponseModel>;
  @useResult
  $Res call(
      {DateTime? date,
      String? day,
      List<String>? breakfast,
      List<String>? lunch,
      List<String>? dinner});
}

/// @nodoc
class _$MenuResponseModelCopyWithImpl<$Res, $Val extends MenuResponseModel>
    implements $MenuResponseModelCopyWith<$Res> {
  _$MenuResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? day = freezed,
    Object? breakfast = freezed,
    Object? lunch = freezed,
    Object? dinner = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
      breakfast: freezed == breakfast
          ? _value.breakfast
          : breakfast // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      lunch: freezed == lunch
          ? _value.lunch
          : lunch // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      dinner: freezed == dinner
          ? _value.dinner
          : dinner // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuResponseModelImplCopyWith<$Res>
    implements $MenuResponseModelCopyWith<$Res> {
  factory _$$MenuResponseModelImplCopyWith(_$MenuResponseModelImpl value,
          $Res Function(_$MenuResponseModelImpl) then) =
      __$$MenuResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? date,
      String? day,
      List<String>? breakfast,
      List<String>? lunch,
      List<String>? dinner});
}

/// @nodoc
class __$$MenuResponseModelImplCopyWithImpl<$Res>
    extends _$MenuResponseModelCopyWithImpl<$Res, _$MenuResponseModelImpl>
    implements _$$MenuResponseModelImplCopyWith<$Res> {
  __$$MenuResponseModelImplCopyWithImpl(_$MenuResponseModelImpl _value,
      $Res Function(_$MenuResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? day = freezed,
    Object? breakfast = freezed,
    Object? lunch = freezed,
    Object? dinner = freezed,
  }) {
    return _then(_$MenuResponseModelImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
      breakfast: freezed == breakfast
          ? _value._breakfast
          : breakfast // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      lunch: freezed == lunch
          ? _value._lunch
          : lunch // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      dinner: freezed == dinner
          ? _value._dinner
          : dinner // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuResponseModelImpl implements _MenuResponseModel {
  const _$MenuResponseModelImpl(
      {this.date,
      this.day,
      final List<String>? breakfast,
      final List<String>? lunch,
      final List<String>? dinner})
      : _breakfast = breakfast,
        _lunch = lunch,
        _dinner = dinner;

  factory _$MenuResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuResponseModelImplFromJson(json);

  @override
  final DateTime? date;
  @override
  final String? day;
  final List<String>? _breakfast;
  @override
  List<String>? get breakfast {
    final value = _breakfast;
    if (value == null) return null;
    if (_breakfast is EqualUnmodifiableListView) return _breakfast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _lunch;
  @override
  List<String>? get lunch {
    final value = _lunch;
    if (value == null) return null;
    if (_lunch is EqualUnmodifiableListView) return _lunch;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _dinner;
  @override
  List<String>? get dinner {
    final value = _dinner;
    if (value == null) return null;
    if (_dinner is EqualUnmodifiableListView) return _dinner;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MenuResponseModel(date: $date, day: $day, breakfast: $breakfast, lunch: $lunch, dinner: $dinner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuResponseModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.day, day) || other.day == day) &&
            const DeepCollectionEquality()
                .equals(other._breakfast, _breakfast) &&
            const DeepCollectionEquality().equals(other._lunch, _lunch) &&
            const DeepCollectionEquality().equals(other._dinner, _dinner));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      day,
      const DeepCollectionEquality().hash(_breakfast),
      const DeepCollectionEquality().hash(_lunch),
      const DeepCollectionEquality().hash(_dinner));

  /// Create a copy of MenuResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuResponseModelImplCopyWith<_$MenuResponseModelImpl> get copyWith =>
      __$$MenuResponseModelImplCopyWithImpl<_$MenuResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuResponseModelImplToJson(
      this,
    );
  }
}

abstract class _MenuResponseModel implements MenuResponseModel {
  const factory _MenuResponseModel(
      {final DateTime? date,
      final String? day,
      final List<String>? breakfast,
      final List<String>? lunch,
      final List<String>? dinner}) = _$MenuResponseModelImpl;

  factory _MenuResponseModel.fromJson(Map<String, dynamic> json) =
      _$MenuResponseModelImpl.fromJson;

  @override
  DateTime? get date;
  @override
  String? get day;
  @override
  List<String>? get breakfast;
  @override
  List<String>? get lunch;
  @override
  List<String>? get dinner;

  /// Create a copy of MenuResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuResponseModelImplCopyWith<_$MenuResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
