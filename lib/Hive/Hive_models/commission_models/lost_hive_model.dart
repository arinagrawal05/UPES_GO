// import '/shared/exports.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

part 'lost_hive_model.g.dart';

@HiveType(typeId: 2)
class LostHiveModel extends HiveObject {
  @HiveField(0)
  String userId;

  @HiveField(1)
  String name;

  @HiveField(2)
  String phone;

  @HiveField(3)
  String collectorUserId;

  @HiveField(4)
  String collectorName;

  @HiveField(5)
  String collectorPhone;

  @HiveField(6)
  String handoverTo;

  @HiveField(8)
  String image;

  @HiveField(9)
  String itemName;

  @HiveField(10)
  String description;

  @HiveField(11)
  String location;

  @HiveField(12)
  String locationSpecific;

  @HiveField(13)
  List<dynamic> reportList;

  @HiveField(14)
  String handoverLocation;

  @HiveField(15)
  String status;

  @HiveField(16)
  int rewardAmount;

  @HiveField(17)
  DateTime timestamp;

  @HiveField(18)
  String iD;

  LostHiveModel({
    required this.userId,
    required this.name,
    required this.phone,
    required this.collectorUserId,
    required this.collectorName,
    required this.collectorPhone,
    required this.handoverTo,
    required this.image,
    required this.itemName,
    required this.description,
    required this.location,
    required this.locationSpecific,
    required this.reportList,
    required this.handoverLocation,
    required this.status,
    required this.rewardAmount,
    required this.timestamp,
    required this.iD,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'phone': phone,
      'collectorUserId': collectorUserId,
      'collectorName': collectorName,
      'collectorPhone': collectorPhone,
      'handoverTo': handoverTo,
      'image': image,
      'itemName': itemName,
      'description': description,
      'location': location,
      'locationSpecific': locationSpecific,
      'reportList': reportList,
      'handoverLocation': handoverLocation,
      'status': status,
      'rewardAmount': rewardAmount,
      'timestamp': timestamp,
      'id': iD,
    };
  }

  factory LostHiveModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
    if (data == null) {
      throw Exception("Document data is null");
    }

    return LostHiveModel(
      iD: data['id'] ?? "NA",
      userId: data['userId'] ?? "NA",
      name: data['name'] ?? "NA",
      phone: data['phone'] ?? "NA",
      collectorUserId: data['collectorUserId'] ?? "NA",
      collectorName: data['collectorName'] ?? "NA",
      collectorPhone: data['collectorPhone'] ?? "NA",
      handoverTo: data['handoverTo'] ?? "NA",
      image: data['image'] ?? "NA",
      itemName: data['itemName'] ?? "NA",
      description: data['description'] ?? "NA",
      location: data['location'] ?? "NA",
      locationSpecific: data['location_specific'] ?? "NA",
      reportList: data['reportList'] ?? [],
      handoverLocation: data['handoverLocation'] ?? "NA",
      status: data['status'] ?? "NA",
      rewardAmount: data['rewardAmount'] ?? 0,
      timestamp: data['timestamp'].toDate() ?? DateTime.now(),
    );
  }
}
