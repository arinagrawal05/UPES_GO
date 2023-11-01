import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  String userid;
  String comment;
  String username;
  String profileUrl;
  String eventID;
  bool isDeleted;
  Timestamp dateAdded;

  CommentModel({
    required this.userid,
    required this.comment,
    required this.eventID,
    required this.profileUrl,
    required this.username,
    required this.isDeleted,
    required this.dateAdded,
    // required this.dateAdded,
  });

  Map<String, dynamic> toMap() {
    return {
      "userId": userid,
      "username": username,
      "comment_text": comment,
      "profile_url": profileUrl,
      "event_id": eventID,
      "isDeleted": isDeleted,
      "timestamp": dateAdded,
    };
  }

  factory CommentModel.CommentModel(DocumentSnapshot doc) {
    dynamic map = doc.data();

    return CommentModel(
      userid: map['userId'] ?? "NA",
      comment: map['comment_text'] ?? "NA",
      username: map['username'] ?? "NA",
      eventID: map['event_id'] ?? "NA",
      profileUrl: map['profile_url'] ?? "NA",
      isDeleted: map['isDeleted'] ?? false,
      dateAdded: map['timestamp'] ?? DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.CommentModel(json.decode(source));
}
