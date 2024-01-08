import 'dart:math';

// import 'package:upes_go/Animations/profile_animation.dart';
// import 'package:upes_go/Screens/Complaints/room_compaint.dart';
// import 'package:upes_go/Screens/Complaints/view_complaint.dart';
// import 'package:upes_go/Screens/Events/events_page.dart';
// import 'package:upes_go/Screens/Outpass/outpass.dart';
// import 'package:upes_go/Screens/Outpass/outpass_view.dart';
// import 'package:upes_go/mess_menu.dart';
// import 'package:upes_go/re-sell_home.dart';
// import 'package:upes_go/recent_chats.dart';
// import 'package:upes_go/settings.dart';
// import 'package:upes_go/shared/bottomnavbar.dart';
// import 'package:upes_go/shared/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:upes_go/Shared/functions.dart';
import 'package:upes_go/notification_home.dart';
import '../Shared/colors.dart';
import '../Shared/style.dart';
import '../components/bottom_nav.dart';
import '../components/components.dart';
import '../components/event_tile.dart';
import '../models/event_model.dart';
import '../provider/user_provider.dart';
import '../Settings/settings.dart';

class ProfileScreen extends StatefulWidget {
  // final String username, userid;

  // const ProfileScreen(
  //     {super.key, required this.username, required this.userid});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
// AnimationController controller;
// ProfileAnimation animation;
  int optionChoice = 0;
  decideOption() {
    int d = Random().nextInt(2);
    print(d.toString());
    setState(() {
      optionChoice = d;
    });
  }

  @override
  void initState() {
    super.initState();
    // getpref();
    decideOption();
    // controller = AnimationController(
    //   duration: Duration(milliseconds: 2000),
    //   vsync: this
    // );
    // animation = ProfileAnimation(controller);
    // controller.forward();
  }

  int activeint = 0;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserDataProvider>(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 310,
          leading: Container(),
          automaticallyImplyLeading: false,
          leadingWidth: 0,
          title: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigateslide(SettingsPage(), context);
                      },
                      child: Icon(
                        Ionicons.settings_outline,
                        size: 22,
                      ),
                    ),
                    Row(
                      children: [
                        upesCredit(userProvider.userModel.points, context),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            navigateslide(NotificationScreen(), context);
                          },
                          child: Icon(
                            Ionicons.notifications_outline,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //  Column()
              CircleAvatar(
                maxRadius: 50,
                backgroundImage: NetworkImage(userProvider.userModel.photoUrl),
                backgroundColor: Colors.amber.shade100,
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  userProvider.userModel.name,
                  style: GoogleFonts.montserrat(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Dept. of " + userProvider.userModel.dept,
                  style: GoogleFonts.montserrat(
                    fontSize: 17,
                    color: Colors.grey,
                    //  fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Share.share(' Contact Details | Download UPES GO APP');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(70, 67, 211, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 30,
                    width: 30,
                    child: Icon(Icons.share, size: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          bottom: TabBar(
            dividerColor: ColorPalatte.primaryColor,
            labelColor: ColorPalatte.primaryColor,
            indicatorColor: ColorPalatte.primaryColor,
            indicatorSize: TabBarIndicatorSize.label,
            // indicator: indicatord(),
            // indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
            indicatorWeight: 1,
            dividerHeight: 0,
            tabs: [
              customTab("Products", Ionicons.pricetag_outline),
              customTab("Events", Ionicons.sparkles_outline),
              customTab("News", Ionicons.notifications_outline),
            ],
          ),
        ),
        body: TabBarView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(),
            bookmarkedEvent(context, userProvider),

            // optionChoice == 0 ? optionSet1() : optionSet2(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Tab customTab(String title, IconData icon) {
    return Tab(
      height: 50,
      icon: Icon(icon),
      child: heading(title, 12),
      iconMargin: EdgeInsets.only(bottom: 0),
    );
  }

  Widget profiletile(
      BuildContext context, String text, int index, int activeint) {
    return GestureDetector(
      onTap: () {
        print("object");
        setState(() {
          activeint = index;
        });
      },
      child: Container(
          padding: EdgeInsets.all(8),
          decoration: dashbox(context).copyWith(
              color: activeint == index
                  ? ColorPalatte.primaryColor.withOpacity(0.4)
                  : null),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineSmall,
          )),
    );
  }

  Container bookmarkedEvent(
      BuildContext context, UserDataProvider userProvider) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 335,
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Events')
              .where("event_bookmark_list",
                  arrayContains: userProvider.userModel.userid)
              // .orderBy("TimeStamp")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                // scrollDirection: Axis.horizontal,
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  // return eventcard(EventModel.fromFirestore(
                  //     snapshot.data!.docs[index]));
                  return eventTile(
                      EventModel.fromFirestore(snapshot.data!.docs[index]),
                      context);
                });
          }),
    );
  }

  Widget optionSet1() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => Bottomnavbar(
            //               index: 1,
            //             )));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: ColorPalatte.primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 6.0, // soften the shadow
                  spreadRadius: 3.0, //extend the shadow
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            // height: 90,
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              children: [
                Container(
                  width: 90,
                  child: Icon(
                    Icons.menu_book_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                // Container(
                //   // padding: EdgeInsets.all(0),
                //   // color: Colors.amber,
                //   width: 90,
                //   height: 90,
                //   child: Image.network(
                //     "https://www.freepnglogos.com/uploads/google-play-png-logo/google-changes-play-store-png-logo-0.png",
                //     fit: BoxFit.cover,
                //   ),
                // ),
                Text(
                  "Check Today's Menu",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Bottomnavbar(
                          index: 2,
                        )));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: ColorPalatte.primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 6.0, // soften the shadow
                  spreadRadius: 3.0, //extend the shadow
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            // height: 90,
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              children: [
                Container(
                  width: 90,
                  child: Icon(
                    Icons.menu_book_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                // Container(
                //   // padding: EdgeInsets.all(0),
                //   // color: Colors.amber,
                //   width: 90,
                //   height: 90,
                //   child: Image.network(
                //     "https://www.freepnglogos.com/uploads/google-play-png-logo/google-changes-play-store-png-logo-0.png",
                //     fit: BoxFit.cover,
                //   ),
                // ),
                Text(
                  "Is it bad? Order Food",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => EventScreen()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),

            decoration: BoxDecoration(
              color: ColorPalatte.primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 6.0, // soften the shadow
                  spreadRadius: 3.0, //extend the shadow
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            // height: 90,
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              children: [
                Container(
                  width: 90,
                  child: Icon(
                    Icons.event_seat_rounded,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                // Container(
                //   // padding: EdgeInsets.all(0),
                //   // color: Colors.amber,
                //   width: 90,
                //   height: 90,
                //   child: Image.network(
                //     "https://www.freepnglogos.com/uploads/google-play-png-logo/google-changes-play-store-png-logo-0.png",
                //     fit: BoxFit.cover,
                //   ),
                // ),
                Text(
                  "Full now? Check Events",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget optionSet2() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => OutPassViewScreen()));

            // decideOption();
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: ColorPalatte.primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 6.0, // soften the shadow
                  spreadRadius: 3.0, //extend the shadow
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            height: 60,
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Wanna Go Out?  Take OutPass",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => ViewComplaintsPage()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: ColorPalatte.primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 6.0, // soften the shadow
                  spreadRadius: 3.0, //extend the shadow
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            height: 60,
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dirty Room? File Complaint",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => Resellhomescreen()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: ColorPalatte.primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 6.0, // soften the shadow
                  spreadRadius: 3.0, //extend the shadow
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            height: 60,
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Old Books? Sell them",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget event() {
    return Container(
      // color: Colors.red,
      margin: EdgeInsets.symmetric(
          vertical: 10, horizontal: MediaQuery.of(context).size.width * 0.05),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: [
          Container(
            height: 110,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // border: Border.all(width: 2),
                image: DecorationImage(
                    image: NetworkImage(
                      "https://iierd.com/IIERD-INCLUDE/images/1.jpg",
                    ),
                    fit: BoxFit.cover)),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            width: MediaQuery.of(context).size.width * 0.65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Arjit Singh Live 2020",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Icon(Icons.bookmark_outline)
                    ],
                  ),
                ),
                Text(
                  "Banqueted Hall",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.grey),
                ),
                Text(
                  "4 April 2020",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.grey),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        // margin: EdgeInsets.only(left: 20),
                        // padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            // gradient:
                            // LinearGradient(colors: [Colors.black,ColorPalatte.primaryColorAccent]),
                            border: Border.all(
                              width: 0.1,
                              color: Colors.grey,
                            ),
                            // color:ColorPalatte.primaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            )),
                        child: CircleAvatar(
                          maxRadius: 17,
                          backgroundImage: NetworkImage(
                              "https://coresites-cdn-adm.imgix.net/mpora_new/wp-content/uploads/2017/06/GettyImages-586171960.jpg"),
                        ),
                      ),
                      Text(" +20",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                          )),
                      Text(" Going",
                          style: GoogleFonts.montserrat(
                              // fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
