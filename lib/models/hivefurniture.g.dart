// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hivefurniture.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveFurnitureAdapter extends TypeAdapter<HiveFurniture> {
  @override
  final int typeId = 0;

  @override
  HiveFurniture read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveFurniture(
      pcode: fields[0] as String,
      description: fields[1] as String,
      remarks: fields[3] as String?,
      retailprice: fields[2] as double,
      quantity: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveFurniture obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.pcode)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.retailprice)
      ..writeByte(3)
      ..write(obj.remarks)
      ..writeByte(4)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveFurnitureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
