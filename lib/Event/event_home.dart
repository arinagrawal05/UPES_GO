// import 'package:MUJ_GO/Models/event_model.dart';
// import 'package:MUJ_GO/Screens/Events/events_home.dart';
// import 'package:MUJ_GO/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:upes_go/components/event_card.dart';
import 'package:upes_go/models/event_model.dart';

import '../components/event_tile.dart';
import '../provider/user_provider.dart';

class EventHomeScreen extends StatefulWidget {
  @override
  _EventHomeScreenState createState() => _EventHomeScreenState();
}

class _EventHomeScreenState extends State<EventHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 44,
                // color: Colors.red,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Icon(
                          Icons.chevron_left,
                          size: 35,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 0),
                      child: Text(
                        "Discover Events",
                        style: GoogleFonts.montserrat(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Events')
                        .where("isVisible", isEqualTo: true)
                        .orderBy("event_date")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return eventcard(EventModel.fromFirestore(
                                snapshot.data!.docs[index]));
                          });
                    }),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  "Explore Event",
                  style: GoogleFonts.montserrat(
                      fontSize: 28, fontWeight: FontWeight.w300),
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Container(
                width: MediaQuery.of(context).size.width,
                // height: 335,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Events')
                        // .where("isVisible", isEqualTo: true)
                        .orderBy("event_date")
                        // .where("Department",
                        //     isEqualTo: "Department of Information Technology")
                        // .orderBy("TimeStamp")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                          // scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            // return eventcard(EventModel.fromFirestore(
                            //     snapshot.data!.docs[index]));
                            return eventTile(
                                EventModel.fromFirestore(
                                    snapshot.data!.docs[index]),
                                context);
                          });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget eventcard(EventModel event) {
    final userProvider = Provider.of<UserDataProvider>(context, listen: false);

    return Stack(
      children: [
        EventCard(
          context: context,
          event: event,
        ),
        event.bookmarkList.contains(userProvider.userModel.userid)
            ? Positioned(
                top: 7,
                left: 110,
                child: Container(
                  child: Icon(
                    Icons.bookmark,
                    color: Color.fromRGBO(244, 177, 0, 1),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
