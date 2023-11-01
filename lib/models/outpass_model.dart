import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class OutpassModel {
  final String outpassNumber,
      name,
      registrationNo,
      phone,
      leaveReason,
      parentsPhone,
      block,
      room,
      year,
      status;
  String? approvedBy;
  Timestamp appliedTime;
  Timestamp? decisionTime, checkoutTime, checkInTime;

  String outpassID, userid;

  OutpassModel({
    required this.phone,
    required this.leaveReason,
    required this.appliedTime,
    required this.decisionTime,
    required this.name,
    required this.registrationNo,
    required this.parentsPhone,
    required this.block,
    required this.room,
    required this.year,
    required this.status,
    required this.outpassID,
    required this.outpassNumber,
    this.checkInTime,
    this.checkoutTime,
    this.approvedBy,
    // this.checkoutTime,
    required this.userid,
  });

  Map<String, dynamic> toMap() {
    return {
      "userid": userid,
      "name": name,
      "phone": phone,
      "registration_no": registrationNo,
      "block": block,
      "year": year,
      "room_no": room,
      "parents_phone": parentsPhone,
      "applied_time": appliedTime,
      "decision_time": decisionTime,
      "leave_reason": leaveReason,
      "status": status,
      "outpass_id": outpassID,
      "outpass_number": outpassNumber,
      "checkin_time": checkInTime,
      "checkout_time": checkoutTime,
      "approved_by": approvedBy,
    };
  }

  factory OutpassModel.fromFirestore(DocumentSnapshot doc) {
    dynamic map = doc.data();

    return OutpassModel(
      userid: map['userid'] ?? "NA",
      name: map['name'] ?? "NA",
      phone: map['phone'] ?? "NA",
      parentsPhone: map['parents_phone'] ?? "NA",
      block: map['block'] ?? "NA",
      year: map['year'] ?? "NA",
      room: map['room_no'] ?? "NA",
      registrationNo: map['registration_no'] ?? "NA",
      leaveReason: map['leave_reason'] ?? "NA",
      appliedTime: map['applied_time'] ?? Timestamp.now(),
      decisionTime: map['decision_time'] ?? Timestamp.now(),
      checkInTime: map['checkin_time'] ?? Timestamp.now(),
      checkoutTime: map['checkout_time'] ?? Timestamp.now(),
      status: map['status'] ?? "NA",
      approvedBy: map['approved_by'] ?? "NA",
      outpassID: map['outpass_id'] ?? "NA",
      outpassNumber: map['outpass_number'] ?? "NA",
    );
  }

  String toJson() => json.encode(toMap());

  factory OutpassModel.fromJson(String source) =>
      OutpassModel.fromFirestore(json.decode(source));
}
