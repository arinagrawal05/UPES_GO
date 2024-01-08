// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lost_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LostHiveModelAdapter extends TypeAdapter<LostHiveModel> {
  @override
  final int typeId = 2;

  @override
  LostHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LostHiveModel(
      userId: fields[0] as String,
      name: fields[1] as String,
      phone: fields[2] as String,
      collectorUserId: fields[3] as String,
      collectorName: fields[4] as String,
      collectorPhone: fields[5] as String,
      handoverTo: fields[6] as String,
      image: fields[8] as String,
      itemName: fields[9] as String,
      description: fields[10] as String,
      location: fields[11] as String,
      locationSpecific: fields[12] as String,
      reportList: (fields[13] as List).cast<String>(),
      handoverLocation: fields[14] as String,
      status: fields[15] as String,
      rewardAmount: fields[16] as int,
      timestamp: fields[17] as DateTime,
      iD: fields[18] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LostHiveModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.collectorUserId)
      ..writeByte(4)
      ..write(obj.collectorName)
      ..writeByte(5)
      ..write(obj.collectorPhone)
      ..writeByte(6)
      ..write(obj.handoverTo)
      ..writeByte(8)
      ..write(obj.image)
      ..writeByte(9)
      ..write(obj.itemName)
      ..writeByte(10)
      ..write(obj.description)
      ..writeByte(11)
      ..write(obj.location)
      ..writeByte(12)
      ..write(obj.locationSpecific)
      ..writeByte(13)
      ..write(obj.reportList)
      ..writeByte(14)
      ..write(obj.handoverLocation)
      ..writeByte(15)
      ..write(obj.status)
      ..writeByte(16)
      ..write(obj.rewardAmount)
      ..writeByte(17)
      ..write(obj.timestamp)
      ..writeByte(18)
      ..write(obj.iD);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LostHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
