import 'package:avatar_stack/avatar_stack.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upes_go/Shared/const.dart';

import '../Event/event_detail.dart';
import '../Shared/functions.dart';
import '../models/event_model.dart';

Widget eventTile(EventModel event, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EventDetailScreen(
                    event: event,
                  )));
    },
    child: Container(
      // color: Colors.red,
      margin: EdgeInsets.symmetric(
          vertical: 10, horizontal: MediaQuery.of(context).size.width * 0.05),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 110,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // border: Border.all(width: 2),
                image: DecorationImage(
                    image: NetworkImage(
                      event.eventCoverImage,
                    ),
                    fit: BoxFit.cover)),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            width: MediaQuery.of(context).size.width * 0.65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // padding: EdgeInsets.only(right: 10),
                        width: 220,
                        child: Text(
                          event.eventName,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      // Icon(Icons.bookmark_outline)
                    ],
                  ),
                ),
                Text(
                  event.eventVenue,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.grey),
                ),
                Text(
                  AppUtils.dateTimetoText(event.eventDate.toDate()),
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 5,
                ),
                AvatarStack(
                  width: 150,
                  height: 35,
                  borderWidth: 0.5,
                  settings: PropConst.settings,
                  avatars: [
                    for (var n = 0; n < event.attendeesProfile.length; n++)
                      // NetworkImage(widget.event.attendeesProfile![n]),
                      NetworkImage(event.attendeesProfile[n]),

                    // NetworkImage('https://i.pravatar.cc/150?img=$n'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
