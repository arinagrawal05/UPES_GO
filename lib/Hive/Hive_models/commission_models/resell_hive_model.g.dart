// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resell_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResellHiveModelAdapter extends TypeAdapter<ResellHiveModel> {
  @override
  final int typeId = 1;

  @override
  ResellHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResellHiveModel(
      productImg: fields[0] as String,
      productName: fields[1] as String,
      productPrice: fields[2] as String,
      productCategory: fields[3] as String,
      phone: fields[4] as String,
      username: fields[5] as String,
      timestamp: fields[6] as DateTime,
      userId: fields[7] as String,
      isSold: fields[8] as bool,
      isFeatured: fields[9] as bool,
      productid: fields[10] as String,
      user_bookmarked: (fields[11] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ResellHiveModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.productImg)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.productPrice)
      ..writeByte(3)
      ..write(obj.productCategory)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.username)
      ..writeByte(6)
      ..write(obj.timestamp)
      ..writeByte(7)
      ..write(obj.userId)
      ..writeByte(8)
      ..write(obj.isSold)
      ..writeByte(9)
      ..write(obj.isFeatured)
      ..writeByte(10)
      ..write(obj.productid)
      ..writeByte(11)
      ..write(obj.user_bookmarked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResellHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
