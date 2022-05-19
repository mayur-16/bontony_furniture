// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hiveaddress.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveAddressAdapter extends TypeAdapter<HiveAddress> {
  @override
  final int typeId = 1;

  @override
  HiveAddress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveAddress(
      contactname: fields[0] as String,
      contactphno: fields[1] as String,
      addname: fields[2] as String,
      addarea: fields[3] as String,
      addblockno: fields[4] as String,
      addstreetno: fields[5] as String,
      addbuildingno: fields[6] as String,
      addflatno: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveAddress obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.contactname)
      ..writeByte(1)
      ..write(obj.contactphno)
      ..writeByte(2)
      ..write(obj.addname)
      ..writeByte(3)
      ..write(obj.addarea)
      ..writeByte(4)
      ..write(obj.addblockno)
      ..writeByte(5)
      ..write(obj.addstreetno)
      ..writeByte(6)
      ..write(obj.addbuildingno)
      ..writeByte(7)
      ..write(obj.addflatno);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveAddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
