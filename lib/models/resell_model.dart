import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class ResellModel {
  String productImg;
  String productName;
  String productPrice;
  String productCategory;
  String phone;
  String username;
  Timestamp timestamp;
  String userId;
  bool isSold;
  bool isFeatured;

  String productid;
  List user_bookmarked;

  ResellModel({
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

  factory ResellModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic>? map = doc.data() as Map<String, dynamic>?;
    if (map == null) {
      throw Exception("Document data is null");
    }

    return ResellModel(
      productImg: map['Product_img'] ?? "",
      productName: map['Product_name'] ?? "NA",
      productPrice: map['Product_price'] ?? "NA",
      productCategory: map['Product_category'] ?? "NA",
      phone: map['Phone'] ?? "",
      username: map['username'] ?? "",
      timestamp: map['timestamp'] ?? Timestamp.now(),
      userId: map['userid'] ?? "",
      productid: map['product_id'] ?? "NA",
      isSold: map['isSold'] ?? false,
      isFeatured: map['isFeatured'] ?? false,
      user_bookmarked: map['user_bookmarked_list'] ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResellModel.fromJson(String source) =>
      ResellModel.fromFirestore(json.decode(source));
}
