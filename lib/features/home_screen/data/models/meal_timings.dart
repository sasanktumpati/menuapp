// To parse this JSON data, do
//
//     final mealTimings = mealTimingsFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'dart:convert';

part 'meal_timings.freezed.dart';
part 'meal_timings.g.dart';

MealTimings mealTimingsFromJson(String str) =>
    MealTimings.fromJson(json.decode(str));

String mealTimingsToJson(MealTimings data) => json.encode(data.toJson());

@freezed
class MealTimings with _$MealTimings {
  const factory MealTimings({
    @JsonKey(name: "default_timings") required Timings defaultTimings,
    @JsonKey(name: "sunday_timings") required Timings sundayTimings,
    @JsonKey(name: "special_days") required List<SpecialDay> specialDays,
    @JsonKey(name: "meta") required Meta meta,
  }) = _MealTimings;

  factory MealTimings.fromJson(Map<String, dynamic> json) =>
      _$MealTimingsFromJson(json);
}

@freezed
class Timings with _$Timings {
  const factory Timings({
    @JsonKey(name: "breakfast") required MealType breakfast,
    @JsonKey(name: "lunch") required MealType lunch,
    @JsonKey(name: "dinner") required MealType dinner,
  }) = _Timings;

  factory Timings.fromJson(Map<String, dynamic> json) =>
      _$TimingsFromJson(json);
}

@freezed
class MealType with _$MealType {
  const factory MealType({
    @JsonKey(name: "start") required String start,
    @JsonKey(name: "end") required String end,
    @JsonKey(name: "type") required String type,
  }) = _MealType;

  factory MealType.fromJson(Map<String, dynamic> json) =>
      _$MealTypeFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    @JsonKey(name: "timezone") required String timezone,
    @JsonKey(name: "last_updated") required DateTime lastUpdated,
    @JsonKey(name: "version") required String version,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
class SpecialDay with _$SpecialDay {
  const factory SpecialDay({
    @JsonKey(name: "date") required DateTime date,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "timings") required Timings timings,
  }) = _SpecialDay;

  factory SpecialDay.fromJson(Map<String, dynamic> json) =>
      _$SpecialDayFromJson(json);
}
