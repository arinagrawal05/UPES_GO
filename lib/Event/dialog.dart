import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/attendee_model.dart';

void eventAttendeesList(String docId, BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 300,
            // color: Colors.amber,
            height: 350,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(15)),
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Going List",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Divider(endIndent: 10, indent: 10),
                  Container(
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('Events')
                            .doc(docId)
                            .collection("attendees")
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return attendeeTile(
                                  AttendeeModel.fromFirestore(
                                      snapshot.data!.docs[index]),
                                );
                              });
                        }),
                  )
                ],
              ),
            ),
          ),
        );
      });
}

Widget attendeeTile(AttendeeModel model) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              height: 40,
              width: 40,
              child: Image.network(model.photo!),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.name!,
              style: GoogleFonts.montserrat(fontSize: 20),
            ),
            Text(
              "Dept. of " + model.dept!,
              style: GoogleFonts.montserrat(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ],
    ),
  );
}
