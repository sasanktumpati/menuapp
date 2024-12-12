// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_timings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MealTimingsImpl _$$MealTimingsImplFromJson(Map<String, dynamic> json) =>
    _$MealTimingsImpl(
      defaultTimings:
          Timings.fromJson(json['default_timings'] as Map<String, dynamic>),
      sundayTimings:
          Timings.fromJson(json['sunday_timings'] as Map<String, dynamic>),
      specialDays: (json['special_days'] as List<dynamic>)
          .map((e) => SpecialDay.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MealTimingsImplToJson(_$MealTimingsImpl instance) =>
    <String, dynamic>{
      'default_timings': instance.defaultTimings,
      'sunday_timings': instance.sundayTimings,
      'special_days': instance.specialDays,
      'meta': instance.meta,
    };

_$TimingsImpl _$$TimingsImplFromJson(Map<String, dynamic> json) =>
    _$TimingsImpl(
      breakfast: MealType.fromJson(json['breakfast'] as Map<String, dynamic>),
      lunch: MealType.fromJson(json['lunch'] as Map<String, dynamic>),
      dinner: MealType.fromJson(json['dinner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TimingsImplToJson(_$TimingsImpl instance) =>
    <String, dynamic>{
      'breakfast': instance.breakfast,
      'lunch': instance.lunch,
      'dinner': instance.dinner,
    };

_$MealTypeImpl _$$MealTypeImplFromJson(Map<String, dynamic> json) =>
    _$MealTypeImpl(
      start: json['start'] as String,
      end: json['end'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$MealTypeImplToJson(_$MealTypeImpl instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
      'type': instance.type,
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      timezone: json['timezone'] as String,
      lastUpdated: DateTime.parse(json['last_updated'] as String),
      version: json['version'] as String,
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'timezone': instance.timezone,
      'last_updated': instance.lastUpdated.toIso8601String(),
      'version': instance.version,
    };

_$SpecialDayImpl _$$SpecialDayImplFromJson(Map<String, dynamic> json) =>
    _$SpecialDayImpl(
      date: DateTime.parse(json['date'] as String),
      name: json['name'] as String,
      timings: Timings.fromJson(json['timings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SpecialDayImplToJson(_$SpecialDayImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'name': instance.name,
      'timings': instance.timings,
    };
