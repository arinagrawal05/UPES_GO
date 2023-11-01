import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userid;
  String name;
  String sapID;
  String registration;
  String phone;
  String email;
  String year;
  String dept;
  String fcmToken;
  String photoUrl;
  int points;
  List enrolledList = [];
  UserModel({
    required this.userid,
    required this.name,
    required this.sapID,
    required this.registration,
    required this.phone,
    required this.email,
    required this.year,
    required this.dept,
    required this.fcmToken,
    required this.photoUrl,
    required this.enrolledList,
    required this.points,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userid,
      'name': name,
      'sapID': sapID,
      'registration': registration,
      'phone': phone,
      'email': email,
      'year': year,
      'dept': dept,
      'fcmToken': fcmToken,
      'photoUrl': photoUrl,
      'events_enrolled_list': enrolledList,
      'points': points,
    };
  }

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    dynamic map = doc.data();

    return UserModel(
      userid: map['userId'] ?? "NA",
      name: map['name'] ?? "NA",
      sapID: map['sapID'] ?? "NA",
      registration: map['registration'] ?? "NA",
      phone: map['phone'] ?? "NA",
      email: map['email'] ?? "NA",
      year: map['year'] ?? "NA",
      dept: map['dept'] ?? "NA",
      fcmToken: map['fcmToken'] ?? "NA",
      photoUrl: map['photoUrl'] ??
          "https://wallpapers.com/images/hd/cool-profile-picture-87h46gcobjl5e4xu.jpg",
      enrolledList: map['events_enrolled_list'] ?? [],
      points: map['points'] ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJsonString(String source) =>
      UserModel.fromFirestore(json.decode(source));
}
