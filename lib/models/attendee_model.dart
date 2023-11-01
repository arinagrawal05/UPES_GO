import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class AttendeeModel {
  String? name, photo, phone, email, dept, sapId, registrationNo;

  AttendeeModel({
    this.name,
    this.photo,
    this.sapId,
    this.registrationNo,
    this.phone,
    this.dept,
    this.email,
  });
  Map<String, dynamic> toMap() {
    return {
      "username": name,
      "photo": phone,
      "phone": phone,
      "sap_id": sapId,
      "dept": dept,
      "email": email,
      "registration_no": registrationNo,
      // 'question': eventName,
      // 'timestamp': eventDate,
      // 'isPermanent': eventCoverImage,
      // 'answer': eventDesc,
    };
  }

  factory AttendeeModel.fromFirestore(DocumentSnapshot doc) {
    dynamic map = doc.data();

    return AttendeeModel(
      name: map['username'] ?? "NA",
      photo: map['photo'] ?? true,
      sapId: map['sap_id'] ?? "NA",
      dept: map['dept'] ?? "NA",
      email: map['email'] ?? "NA",
      phone: map['phone'] ?? "NA",
      registrationNo: map['registration_no'] ?? "0000000000",
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendeeModel.fromJson(String source) =>
      AttendeeModel.fromFirestore(json.decode(source));
}

// FirebaseFirestore.instance
//                             .collection("events")
//                             .doc("1003")
//                             .set({
//                           "event_name": "Muj Hackathon Conference 2021",
//                           "event_date":
//                               "Fri, Nov 18, 2021, 6:30 PM IST",
//                           "event_venue": "Online Event",
//                           "Description":
//                               "2020 marks the year of disruption through technology. The 7th annual MIT FinTech Conference is a student-run event that brings together over 1,000 leaders, companies, and students dedicated to transforming and innovating the FinTech space across the globe. Join us in understanding what this critical juncture means for FinTech's trajectory over the next 10 years.",
//                           "event_attendee_count": 5,
//                           "event_id": "1003",
//                           "event_register_link":
//                               "https://www.eventbrite.com/e/mit-sloan-fintech-conference-2021-tickets-124594929789?aff=ebdssbonlinesearch",
//                           "isVisible": true,
//                           "event_cover_image":
//                               "https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F120100739%2F485586024857%2F1%2Foriginal.20201204-212244?h=2000&w=720&auto=format%2Ccompress&q=75&sharp=10&s=bbd7d4240d4e7bea6e7e7dddc2b9d9b6"


//                         });
