// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class MealTimingsAdapter extends TypeAdapter<MealTimings> {
  @override
  final int typeId = 0;

  @override
  MealTimings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealTimings(
      defaultTimings: fields[0] as Timings,
      sundayTimings: fields[1] as Timings,
      specialDays: (fields[2] as List).cast<SpecialDay>(),
      meta: fields[3] as Meta,
    );
  }

  @override
  void write(BinaryWriter writer, MealTimings obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.defaultTimings)
      ..writeByte(1)
      ..write(obj.sundayTimings)
      ..writeByte(2)
      ..write(obj.specialDays)
      ..writeByte(3)
      ..write(obj.meta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealTimingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TimingsAdapter extends TypeAdapter<Timings> {
  @override
  final int typeId = 1;

  @override
  Timings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Timings(
      breakfast: fields[0] as MealType,
      lunch: fields[1] as MealType,
      dinner: fields[2] as MealType,
    );
  }

  @override
  void write(BinaryWriter writer, Timings obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.breakfast)
      ..writeByte(1)
      ..write(obj.lunch)
      ..writeByte(2)
      ..write(obj.dinner);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MealTypeAdapter extends TypeAdapter<MealType> {
  @override
  final int typeId = 2;

  @override
  MealType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealType(
      start: fields[0] as String,
      end: fields[1] as String,
      type: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MealType obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.start)
      ..writeByte(1)
      ..write(obj.end)
      ..writeByte(2)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MetaAdapter extends TypeAdapter<Meta> {
  @override
  final int typeId = 3;

  @override
  Meta read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meta(
      timezone: fields[0] as String,
      lastUpdated: fields[1] as DateTime,
      version: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Meta obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.timezone)
      ..writeByte(1)
      ..write(obj.lastUpdated)
      ..writeByte(2)
      ..write(obj.version);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpecialDayAdapter extends TypeAdapter<SpecialDay> {
  @override
  final int typeId = 4;

  @override
  SpecialDay read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpecialDay(
      date: fields[0] as DateTime,
      name: fields[1] as String,
      timings: fields[2] as Timings,
    );
  }

  @override
  void write(BinaryWriter writer, SpecialDay obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.timings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpecialDayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MenuResponseModelAdapter extends TypeAdapter<MenuResponseModel> {
  @override
  final int typeId = 5;

  @override
  MenuResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuResponseModel(
      date: fields[0] as DateTime?,
      day: fields[1] as String?,
      breakfast: (fields[2] as List?)?.cast<String>(),
      lunch: (fields[3] as List?)?.cast<String>(),
      dinner: (fields[4] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, MenuResponseModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.day)
      ..writeByte(2)
      ..write(obj.breakfast)
      ..writeByte(3)
      ..write(obj.lunch)
      ..writeByte(4)
      ..write(obj.dinner);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
