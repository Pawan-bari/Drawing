// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offset.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OffsetcustomAdapter extends TypeAdapter<Offsetcustom> {
  @override
  final int typeId = 0;

  @override
  Offsetcustom read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Offsetcustom(
      fields[0] as double,
      fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Offsetcustom obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.dx)
      ..writeByte(1)
      ..write(obj.dy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OffsetcustomAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
