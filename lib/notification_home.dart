import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upes_go/models/notice_model.dart';
import 'package:upes_go/notification_tile.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: ColorPalatte.primaryColor,
          title: Text("Notification List"),
        ),
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('Notices').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return notificationTile(
                        NoticeModel.fromFirestore(snapshot.data!.docs[index]),
                        context);
                  });
            }));
  }
}
