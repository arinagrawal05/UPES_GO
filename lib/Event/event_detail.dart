import 'package:avatar_stack/avatar_stack.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
// import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.userModel.dart';
import 'package:upes_go/Event/dialog.dart';
import 'package:upes_go/Shared/functions.dart';
import 'package:upes_go/Shared/style.dart';
import 'package:upes_go/components/custom_button.dart';
import 'package:upes_go/models/event_model.dart';

import '../Shared/colors.dart';
import '../Shared/const.dart';
import '../components/components.dart';
import '../provider/user_provider.dart';
// import '../provider/user_provider.userModel.dart';
import 'events_banner_page.dart';

class EventDetailScreen extends StatefulWidget {
  final EventModel event;
  EventDetailScreen({required this.event});

  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // int eventAttendeeCount = 5;

  // fetchGoing() {
  //   FirebaseFirestore.instance
  //       .collection("events")
  //       .doc(widget.event.eventId)
  //       .collection("attendees")
  //       .get()
  //       .then((value) => {
  //             print(value.docs.length),
  //             setState(() {
  //               eventAttendeeCount = value.docs.length;
  //             }),
  //             value.docs.forEach((element) {
  //               print(element["name"] + "  is the person");
  //               if (element["userId"] == userid) {
  //                 setState(() {
  //                   mark = true;
  //                 });
  //               }
  //             })
  //           });
  // }

  // String? name, userid, profileurl;
  // getpref() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   userid = prefs.getString("userId");
  //   name = prefs.getString("username");
  //   profileurl = prefs.getString("profileUrl");
  //   // fetchGoing();
  // }

  // _launchURLsms(String sem) async {
  //   String url = sem;
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserDataProvider>(context, listen: false);

    if (widget.event.bookmarkList.contains(userProvider.userModel.userid)) {
      mark = true;
    }
  }

  bool sendbuttonActive = false;

  TextEditingController _commentController = TextEditingController();
  int slabcode = 0;
  int upperless = 0;
  bool mark = false;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserDataProvider>(context);

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FullScreenBannerPage(
                              name: widget.event.eventName,
                              bannerUrl: widget.event.eventCoverImage,
                            )));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          // "https://iierd.com/IIERD-INCLUDE/images/1.jpg"
                          widget.event.eventCoverImage,
                        ),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    Positioned(
                        top: 20,
                        left: 20,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                            size: 35,
                          ),
                        )),
                    Positioned(
                      left: 20,
                      top: 200,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        color: ColorPalatte.primaryColor.withOpacity(0.5),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                widget.event.eventName,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(
                                top: 7,
                              ),
                              child: Text(
                                AppUtils.dateTimetoText(
                                    widget.event.eventDate.toDate()),
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.45 - upperless),
              width: double.infinity,
              height: slabcode == 1
                  ? MediaQuery.of(context).size.height * 0.6 + upperless - 38
                  : MediaQuery.of(context).size.height * 0.6 - 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).cardColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              slabcode = 0;
                              upperless = 0;
                            });
                          },
                          child: Container(
                              height: 50,
                              decoration: slabcode == 0
                                  ? BoxDecoration(
                                      // color: Colors.red,
                                      border: Border(
                                        bottom: BorderSide(
                                            width: 2.0,
                                            color: Colors.lightBlue.shade900),
                                      ),
                                    )
                                  : BoxDecoration(),
                              padding: EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 20),
                              child: Text("Overview",
                                  style: slabcode == 0
                                      ? GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.lightBlue.shade900)
                                      : GoogleFonts.montserrat(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.grey))),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     setState(() {
                        //       slabcode = 1;
                        //       upperless = 180;
                        //     });
                        //   },
                        //   child: Container(
                        //     padding: EdgeInsets.symmetric(
                        //         vertical: 14, horizontal: 20),
                        //     decoration: slabcode == 1
                        //         ? BoxDecoration(
                        //             border: Border(
                        //               bottom: BorderSide(
                        //                   width: 2.0,
                        //                   color: Colors.lightBlue.shade900),
                        //             ),
                        //           )
                        //         : BoxDecoration(),
                        //     child: Text("Comments",
                        //         style: slabcode == 1
                        //             ? GoogleFonts.montserrat(
                        //                 fontWeight: FontWeight.w600,
                        //                 fontSize: 16,
                        //                 color: Colors.lightBlue.shade900)
                        //             : GoogleFonts.montserrat(
                        //                 // fontWeight: FontWeight.bold,
                        //                 fontSize: 16,
                        //                 color: Colors.grey)),
                        //   ),
                        // )
                      ],
                    ),
                    slabcode == 0
                        ? overviewSlab(userProvider)
                        : commentSlab(userProvider)
                  ],
                ),
              ),
            ),

            // slabcode == 0
            // ?
            Positioned(
              top: MediaQuery.of(context).size.height * 0.41,
              left: MediaQuery.of(context).size.width * 0.8,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).canvasColor.withOpacity(0.8),
                      blurRadius: 20.0, // soften the shadow
                      spreadRadius: 5.0, //extend the shadow
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 55,
                width: 50,
                child: mark == false
                    ? GestureDetector(
                        onTap: () {
                          widget.event.bookmarkList
                              .add(userProvider.userModel.userid);
                          FirebaseFirestore.instance
                              .collection("Events")
                              .doc(widget.event.eventId)
                              .update({
                            "event_bookmark_list": widget.event.bookmarkList,
                          }).then((value) => {
                                    setState(() {
                                      mark = true;
                                    })
                                  });
                        },
                        child: Icon(
                          Icons.bookmark_outline,
                          color: Color.fromRGBO(35, 34, 32, 1),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          widget.event.bookmarkList
                              .remove(userProvider.userModel.userid);
                          FirebaseFirestore.instance
                              .collection("Events")
                              .doc(widget.event.eventId)
                              .update({
                            "event_bookmark_list": widget.event.bookmarkList,
                          }).then((value) => {
                                    setState(() {
                                      mark = false;
                                    })
                                  });
                        },
                        child: Icon(
                          Icons.bookmark,
                          color: Color.fromRGBO(244, 177, 0, 1),
                        ),
                      ),
              ),
            )
            //     : Container(),
          ],
        ),
      ),
    );
  }

  Widget overviewSlab(UserDataProvider provider) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          tile(
            FontAwesomeIcons.map,
            "Location",
            widget.event.eventVenue,
          ),
          tile(
            FontAwesomeIcons.calendar,
            "Date",
            AppUtils.dateTimetoText(widget.event.eventDate.toDate()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.event.attendeesProfile.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          eventAttendeesList(widget.event.eventId, context);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text("Going List",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            AvatarStack(
                              width: 150,
                              height: 40,
                              settings: PropConst.settings,
                              avatars: [
                                for (var n = 0;
                                    n < widget.event.attendeesProfile.length;
                                    n++)
                                  // NetworkImage(widget.event.attendeesProfile![n]),
                                  NetworkImage(
                                      widget.event.attendeesProfile[n]),

                                // NetworkImage('https://i.pravatar.cc/150?img=$n'),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 9,
                        child: customButton("Register Now", () {
                          AppUtils.launchURL(widget.event.eventRegisterLink);
                        }, context),
                      ),
                      Expanded(
                        flex: 2,
                        child:
                            customSquareButton(Ionicons.call, Colors.green, () {
                          AppUtils.launchURL(
                              "tel:" + widget.event.eventContactNo);
                        }, context),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description : ",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        )),
                    Container(
                      // height: 80,
                      child: Text(widget.event.eventDesc,
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.montserrat(
                              // fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey)),
                    ),
                    provider.userModel.enrolledList
                            .contains(widget.event.eventId)
                        ? Center(
                            child: dottedNotice(" You are Already Enrolled"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: customButton("Enroll Me!", () {
                              List userlocal = provider.userModel.enrolledList;
                              // List eventlocal = widget.event.attendeeList;
                              userlocal.add(widget.event.eventId);
                              widget.event.attendeeList
                                  .add(provider.userModel.userid);
                              widget.event.attendeesProfile
                                  .add(provider.userModel.photoUrl);
                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(provider.userModel.userid)
                                  .update({"events_enrolled_list": userlocal});
                              FirebaseFirestore.instance
                                  .collection("Events")
                                  .doc(widget.event.eventId)
                                  .update({
                                "attendees_userid_list":
                                    widget.event.attendeeList,
                                "event_attendees_profile":
                                    widget.event.attendeesProfile
                              });
                              setState(() {});
                            }, context),
                          )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Map<String, dynamic> userDataMap(UserDataProvider user) {
  //   return {
  //     "photo": user.photo,
  //     "username": user.name,
  //     "phone": user.phone,
  //     "email": user.email,
  //     "sap_id": user.sapID,
  //     "registration_no": user.registrationNo,
  //     "dept": user.dept
  //   };
  // }

  Widget commentSlab(UserDataProvider userdata) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // color: Colors.red,
            // height: 30,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text("Comments",
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                )),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.55 + upperless - 180,
            width: double.infinity,
            // color: Colors.red,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('event_comments')
                    .where("event_id", isEqualTo: widget.event.eventId)
                    .orderBy("timettamp")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text("ccc"),
                    );
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        if (snapshot.data!.docs[index]["isDeleted"] == true) {
                          if (snapshot.data!.docs[index]["userId"] ==
                              userdata.userModel.userid) {
                            return ourdeletedcomment(
                              snapshot.data!.docs[index]["profile_url"],
                              snapshot.data!.docs[index]["username"],
                            );
                          } else {
                            return deletedcomment(
                              snapshot.data!.docs[index]["profile_url"],
                              snapshot.data!.docs[index]["username"],
                            );
                          }
                        } else {
                          if (snapshot.data!.docs[index]["userId"] ==
                              userdata.userModel.userid) {
                            return ourcomment(
                                snapshot.data!.docs[index]["profile_url"],
                                snapshot.data!.docs[index]["username"],
                                snapshot.data!.docs[index]["comment_text"],
                                snapshot.data!.docs[index].id);
                          } else {
                            return comment(
                                snapshot.data!.docs[index]["profile_url"],
                                snapshot.data!.docs[index]["username"],
                                snapshot.data!.docs[index]["comment_text"],
                                snapshot.data!.docs[index]["userId"]);
                          }
                        }
                      });
                }),

            // child: Column(
            //   children: [
            // comment(
            //     "https://coresites-cdn-adm.imgix.net/mpora_new/wp-content/uploads/2017/06/GettyImages-586171960.jpg",
            //     "Arin Agrawal",
            //     "Lorem Ipsum is simply dummy text of the text of the printing  text of the printing text of "),
            //     comment(
            //         "https://coresites-cdn-adm.imgix.net/mpora_new/wp-content/uploads/2017/06/GettyImages-586171960.jpg",
            //         "Rudra Gosh",
            //         "Lorem Ipsum is simply dummy text of the printing m Ipsum is simply of the printing m Ipsum is simply dummy text of the printing  text of the printing text of "),
            //     ourcomment(
            //         "https://coresites-cdn-adm.imgix.net/mpora_new/wp-content/uploads/2017/06/GettyImages-586171960.jpg",
            //         "You",
            //         "Lorem Ipsum is simply text of the printing  text of the printing text of "),
            //   ],
            // ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: DottedBorder(
                      // padding: EdgeInsets.all(20),
                      color: Color.fromRGBO(155, 155, 155, 1),
                      strokeWidth: 1,
                      dashPattern: [4, 5, 4, 5],
                      child: Container(
                          height: 50,
                          // color: Colors.red,
                          width: 270,
                          child: TextField(
                            onChanged: (value) {
                              print(value);
                              if (value.length == 0 ||
                                  _commentController.text == "" ||
                                  _commentController.text == " " ||
                                  _commentController.text == "  " ||
                                  _commentController.text == "   " ||
                                  _commentController.text == "    ") {
                                setState(() {
                                  sendbuttonActive = false;
                                });
                              } else {
                                setState(() {
                                  sendbuttonActive = true;
                                });
                              }
                            },
                            controller: _commentController,
                            style: GoogleFonts.montserrat(fontSize: 20),
                            cursorHeight: 25,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Your Comment",
                              hintStyle: GoogleFonts.montserrat(fontSize: 15),
                            ),
                          ))),
                ),
                sendbuttonActive == false
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blueGrey,
                        ),
                        height: 50,
                        width: 55,
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          if (_commentController.text == "" ||
                              _commentController.text == " " ||
                              _commentController.text == "  " ||
                              _commentController.text == "   " ||
                              _commentController.text == "    ") {
                            _commentController.clear();
                            print("blank space send stopped");
                          } else {
                            FirebaseFirestore.instance
                                .collection("event_comments")
                                .add({
                              "userId": userdata.userModel.userid,
                              "username": userdata.userModel.name,
                              "comment_text": _commentController.text,
                              "profile_url": userdata.userModel.photoUrl,
                              "event_id": widget.event.eventId,
                              "isDeleted": false,
                              "timestamp": DateTime.now()
                            }).then((value) => {_commentController.clear()});
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromRGBO(70, 67, 211, 1),
                          ),
                          height: 50,
                          width: 55,
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget ourdeletedcomment(
    img,
    name,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.all(15),
                    // height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "This Comment was deleted",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ))
              ],
            ),
          ),
          CircleAvatar(
            maxRadius: 27,
            backgroundImage: NetworkImage(img),
          ),
        ],
      ),
    );
  }

  Widget ourcomment(String img, String name, String comment, String docId) {
    return GestureDetector(
      onLongPress: () {
        deletecommentdialog(docId);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.all(15),
                      // height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        comment,
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                        ),
                      ))
                ],
              ),
            ),
            CircleAvatar(
              maxRadius: 27,
              backgroundImage: NetworkImage(img),
            ),
          ],
        ),
      ),
    );
  }

  Widget deletedcomment(img, name) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            maxRadius: 27,
            backgroundImage: NetworkImage(img),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.all(15),
                    // height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "This Comment was deleted",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget comment(String img, String name, String comment, String userUid) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              // print("object");
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => UserChatScreen(
              //               other: userUid,
              //               name: name,
              //               me: userid,
              //             )));
            },
            child: CircleAvatar(
              maxRadius: 27,
              backgroundImage: NetworkImage(img),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.all(15),
                    // height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      comment,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget tile(IconData icon, title, subtitle) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 7),
      height: 54,
      // width: 252,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(70, 67, 211, 1).withOpacity(0.15),
              ),
              height: 50,
              width: 50,
              child: Icon(
                icon,
                color: ColorPalatte.primaryColor,
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: StylingConfig.inputs),
                Text(subtitle,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  void deletecommentdialog(String docId) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: 140,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      FirebaseFirestore.instance
                          .collection("event_comments")
                          .doc(docId)
                          .update({"isDeleted": true}).then((value) => {
                                Navigator.of(context).pop(),
                                _showSnackMessage("Comment Deleted"),

                                // snack bar
                              });
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 13),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          child: Text(
                            "Delete",
                            // textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                fontSize: 18, color: Colors.red),
                          ),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 13),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          child: Text(
                            "Report",
                            // textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(fontSize: 18),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showSnackMessage(String message) {
    // _scaffoldKey.currentState.showSnackBar(SnackBar(
    //   content: Text(message),
    // ));
  }
}
