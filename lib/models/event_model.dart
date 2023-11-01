import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String eventName,
      eventCoverImage,
      eventVenue,
      eventRegisterLink,
      eventId,
      eventDesc,
      eventContactNo;
  List bookmarkList, attendeesProfile, attendeeList;
  Timestamp eventDate;
  int eventAttendeeCount;
  bool isFeatured;
  EventModel({
    required this.eventName,
    required this.bookmarkList,
    required this.attendeesProfile,
    required this.attendeeList,
    required this.eventDate,
    required this.eventCoverImage,
    required this.eventDesc,
    required this.eventContactNo,
    required this.eventVenue,
    required this.eventId,
    required this.eventAttendeeCount,
    required this.eventRegisterLink,
    required this.isFeatured,
  });
  Map<String, dynamic> toMap() {
    return {
      "event_name": eventName,
      "event_date": eventDate,
      "event_venue": eventVenue,
      "Description": eventDesc,
      "event_attendee_count": eventAttendeeCount,
      "event_id": eventId,
      "event_register_link": eventRegisterLink,
      "isVisible": true,
      "event_cover_image": eventCoverImage,
      "event_contact_no": eventContactNo,
      "event_bookmark_list": bookmarkList,
      "event_attendees_profile": attendeesProfile,
      "event_attendees_userid": attendeeList,
      // 'question': eventName,
      // 'timestamp': eventDate,
      // 'isPermanent': eventCoverImage,
      // 'answer': eventDesc,
    };
  }

  factory EventModel.fromFirestore(DocumentSnapshot doc) {
    dynamic map = doc.data();

    return EventModel(
      eventName: map['event_name'] ?? "NA",
      eventCoverImage: map['event_cover_image'] ?? true,
      eventDate: map['event_date'] ?? DateTime.now(),
      eventDesc: map['Description'] ?? "NA",
      eventId: map['event_id'] ?? "NA",
      eventRegisterLink: map['event_register_link'] ?? "NA",
      eventVenue: map['event_venue'] ?? "NA",
      eventAttendeeCount: map['event_attendee_count'] ?? 0,
      eventContactNo: map['event_contact_no'] ?? "0000000000",
      isFeatured: map['isVisible'] ?? false,
      bookmarkList: map['event_bookmark_list'] ?? [],
      attendeesProfile: map['event_attendees_profile'] ?? [],
      attendeeList: map['event_attendees_userid'] ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromFirestore(json.decode(source));
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
