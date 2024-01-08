// import 'package:avatar_stack/avatar_stack.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:upes_go/models/notice_model.dart';

Widget notificationTile(NoticeModel model, BuildContext context) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      // color: Colors.red,
      margin: EdgeInsets.symmetric(
          vertical: 10, horizontal: MediaQuery.of(context).size.width * 0.05),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   height: 110,
          //   width: MediaQuery.of(context).size.width * 0.25,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(15),
          //   ),
          // ),.
          CircleAvatar(
            backgroundColor: Theme.of(context).canvasColor,
            child: Icon(
              Ionicons.megaphone_outline,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            // width: MediaQuery.of(context).size.width * 0.15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Container(
                    // padding: EdgeInsets.only(right: 10),
                    // width: 220,
                    child: Text(
                      model.heading,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Text(
                  model.content,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          // Spacer(),
          // CupertinoSwitch(
          //     activeColor: Theme.of(context).colorScheme.secondary,
          //     // return Switch.adaptive(
          //     // activeColor: Colors.black,
          //     // inactiveThumbColor: Colors.amber,
          //     value: model.isActive,
          //     onChanged: (value) {
          //       FirebaseFirestore.instance
          //           .collection("Notices")
          //           .doc(model.id)
          //           .update({"isActive": !model.isActive});
          //     })
        ],
      ),
    ),
  );
}
