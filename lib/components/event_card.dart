import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upes_go/Event/event_detail.dart';
import 'package:upes_go/Shared/functions.dart';

import '../models/event_model.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.context,
    // required this.context,
    required this.event,
  });

  final BuildContext context;
  // final BuildContext context;
  final EventModel event;

  @override
  Widget build(BuildContext context) {
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
        height: 193,
        width: 139,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // border: Border.all(width: 2),
            image: DecorationImage(
                image: NetworkImage(event.eventCoverImage), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  event.eventName,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  top: 7,
                ),
                child: Text(
                  AppUtils.dateTimetoText(event.eventDate.toDate()),
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
