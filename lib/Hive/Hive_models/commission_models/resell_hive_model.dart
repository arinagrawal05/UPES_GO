// import '/shared/exports.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

part 'resell_hive_model.g.dart';

@HiveType(typeId: 1)
class ResellHiveModel extends HiveObject {
  @HiveField(0)
  String productImg;

  @HiveField(1)
  String productName;

  @HiveField(2)
  String productPrice;

  @HiveField(3)
  String productCategory;

  @HiveField(4)
  String phone;

  @HiveField(5)
  String username;

  @HiveField(6)
  DateTime timestamp;

  @HiveField(7)
  String userId;

  @HiveField(8)
  bool isSold;

  @HiveField(9)
  bool isFeatured;

  @HiveField(10)
  String productid;

  @HiveField(11)
  List<String> user_bookmarked; // Use the actual type of elements

  ResellHiveModel({
    required this.productImg,
    required this.productName,
    required this.productPrice,
    required this.productCategory,
    required this.phone,
    required this.username,
    required this.timestamp,
    required this.userId,
    required this.isSold,
    required this.isFeatured,
    required this.productid,
    required this.user_bookmarked,
  });

  Map<String, dynamic> toMap() {
    return {
      'Product_img': productImg,
      'Product_name': productName,
      'Product_price': productPrice,
      'Product_category': productCategory,
      'Phone': phone,
      'username': username,
      'timestamp': timestamp,
      'userid': userId,
      'isSold': isSold,
      'isFeatured': isFeatured,
      'product_id': productid,
      'user_bookmarked_list': user_bookmarked,
    };
  }

  factory ResellHiveModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic>? map = doc.data() as Map<String, dynamic>?;
    if (map == null) {
      throw Exception("Document data is null");
    }

    return ResellHiveModel(
      productImg: map['Product_img'] ?? "",
      productName: map['Product_name'] ?? "NA",
      productPrice: map['Product_price'] ?? "NA",
      productCategory: map['Product_category'] ?? "NA",
      phone: map['Phone'] ?? "",
      username: map['username'] ?? "",
      timestamp: map['timestamp'].toDate() ?? Timestamp.now(),
      userId: map['userid'] ?? "",
      productid: map['product_id'] ?? "NA",
      isSold: map['isSold'] ?? false,
      isFeatured: map['isFeatured'] ?? false,
      user_bookmarked: map['user_bookmarked_list'] ?? [],
    );
  }
}
