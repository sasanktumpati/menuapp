// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuResponseModelImpl _$$MenuResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuResponseModelImpl(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      day: json['day'] as String?,
      breakfast: (json['breakfast'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lunch:
          (json['lunch'] as List<dynamic>?)?.map((e) => e as String).toList(),
      dinner:
          (json['dinner'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$MenuResponseModelImplToJson(
        _$MenuResponseModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'day': instance.day,
      'breakfast': instance.breakfast,
      'lunch': instance.lunch,
      'dinner': instance.dinner,
    };
