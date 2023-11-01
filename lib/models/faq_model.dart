import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class FAQModel {
  String question;
  // String address;
  // String phone;
  // String email;
  String answer;
  bool isPermanent;
  Timestamp dateAdded;

  FAQModel({
    required this.question,
    required this.answer,
    required this.isPermanent,
    required this.dateAdded,
  });

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'timestamp': dateAdded,
      'isPermanent': isPermanent,
      'answer': answer,
    };
  }

  factory FAQModel.fromFirestore(DocumentSnapshot doc) {
    dynamic map = doc.data();

    return FAQModel(
      question: map['question'] ?? "NA",
      isPermanent: map['isPermanent'] ?? false,
      dateAdded: map['timestamp'] ?? DateTime.now(),
      answer: map['answer'] ?? "NA",
    );
  }

  String toJson() => json.encode(toMap());

  factory FAQModel.fromJson(String source) =>
      FAQModel.fromFirestore(json.decode(source));
}
