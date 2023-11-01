import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:upes_go/Firebase/firebase_notifications.dart';

enableFirebaseSettings() {
  // FirebaseAuthentication.initFirebaseAuth();
  FirebaseNotifications.initfirebaseNotif();
}

void errorServices() {
  RenderErrorBox.backgroundColor = Colors.white;
  // RenderErrorBox.
  // RenderErrorBox.textStyle = GoogleFonts.ubuntu(fontWeight: FontWeight.bold);
  ErrorWidget.builder = (FlutterErrorDetails details) => CircleAvatar(
      // error: details,
      );
  FlutterError.onError = (FlutterErrorDetails details) {
    if (kDebugMode) {
      print("error mil gaya $details");
    } else {
      print("noli");
    }
  };
}
