// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroke.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StrokeAdapter extends TypeAdapter<Stroke> {
  @override
  final int typeId = 1;

  @override
  Stroke read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Stroke(
      points: (fields[0] as List).cast<Offsetcustom>(),
      color: fields[1] as int,
      brushsize: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Stroke obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.points)
      ..writeByte(1)
      ..write(obj.color)
      ..writeByte(2)
      ..write(obj.brushsize);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StrokeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
