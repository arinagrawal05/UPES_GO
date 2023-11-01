import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:upes_go/Event/event_home.dart';
import 'package:upes_go/Lost&Found/lost_home.dart';
import 'package:upes_go/Shared/functions.dart';
import 'package:upes_go/Features/campus_map.dart';
import 'package:upes_go/Firebase/firebase_dynamic_link.dart';
import 'package:upes_go/Settings/faqs_screen.dart';
import 'package:upes_go/Features/hostel_features.dart';
import 'package:upes_go/Resell/enter_resell.dart';
import 'package:upes_go/Resell/resell_home.dart';
import 'package:upes_go/models/event_model.dart';
import 'package:upes_go/provider/user_provider.dart';
import 'Boarding/walk.dart';
import 'components/components.dart';
import 'components/event_card.dart';
import 'components/notice_slider.dart';

class Homepagescreen extends StatefulWidget {
  @override
  _HomepagescreenState createState() => _HomepagescreenState();
}

class _HomepagescreenState extends State<Homepagescreen> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    FirebaseDynamicLink.initDynamicLinks(context);
    FirebaseMessaging.instance.subscribeToTopic("all_users");
    // setpref();
  }

  // setpref() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString("userId", "def");
  //   prefs.setString("username", "Ayush");
  //   prefs.setString("phone", "9039123139");
  //   prefs
  //       .setString("profileUrl",
  //           "https://www.bigredcloud.com/wp-content/uploads/4-tips-for-taking-professional-profile-pictures.jpg")
  //       .then((value) => {print("Shared prefrences Set")});
  // }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserDataProvider>(context);

    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                  left: 10,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                        child: Text(
                          "All Features",
                          style: GoogleFonts.montserrat(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          // width: double.infinity,
                          child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            slidelogo(Ionicons.map, "Map", () {
                              navigateslide(CampusMap(), context);
                            }),
                            slidelogo(Ionicons.calendar, "Events", () {
                              // print("object");
                              // FirebaseFirestore.instance
                              //     .collection("Events")
                              //     .doc("1004")
                              //     .set(EventData.set1);
                              navigateslide(EventHomeScreen(), context);
                            }),
                            slidelogo(Ionicons.id_card, "Faculty", () {
                              navigateslide(Walkthough(), context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             FacultyDepartmentscreen()));
                              AppUtils.showSnackMessage(
                                "This Feature is not Released Yet",
                              );
                            }),
                            slidelogo(Ionicons.bag_handle, "Re Sell", () {
                              // FirebaseMessaging.instance
                              //     .subscribeToTopic("sports");
                              navigateslide(Resellhomescreen(), context);
                            }),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            slidelogo(Ionicons.school, "About\nCollege", () {
                              navigateslide(Faqscreen(), context);
                            }),
                            slidelogo(Ionicons.medal_outline, "Clubs & Society",
                                () {
                              navigateslide(Faqscreen(), context);
                            }),
                            slidelogo(Ionicons.paw, "Lost & found", () {
                              navigateslide(LostHome(), context);
                              // FirebaseDynamicLink.createDynamicLink(
                              //         true, "/faq")
                              //     .then((value) {
                              //   print(value.toString());
                              //   AppUtils.showSnackMessage(value.toString());
                              // });
                            }),
                            slidelogo(Ionicons.home, "Hostel Features", () {
                              if (userProvider.isHosteller) {
                                navigateslide(HostelFeatures(), context);
                              } else {
                                AppUtils.showSnackMessage(
                                    "Only Hostellers Are allowed");
                              }
                              // navigateslide(Faqscreen(), context);
                            }),
                          ],
                        )
                      ])),
                    ]),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20,
                  // horizontal: 5,
                  top: 10,
                ),
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Notice Board",
                        style: GoogleFonts.montserrat(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ]),
              ),
              NoticeSliderWidget(),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Text(
                          "Featured Events",
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ]),
              ),
              homeEventSlider(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget homeEventSlider(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Events')
              .where("isVisible", isEqualTo: true)
              .orderBy("event_date")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  return EventCard(
                      context: context,
                      event:
                          EventModel.fromFirestore(snapshot.data!.docs[index]));
                });
          }),
    );
  }
}
