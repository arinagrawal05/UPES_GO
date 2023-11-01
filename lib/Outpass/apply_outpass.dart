import 'dart:math';

// import 'package:MUJ_GO/Screens/Outpass/outpass_ticket.dart';
// import 'package:MUJ_GO/shared/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:upes_go/components/custom_button.dart';
import 'package:upes_go/Firebase/firebase_notifications.dart';
import 'package:uuid/uuid.dart';

import '../Shared/colors.dart';
import '../provider/user_provider.dart';

class ApplyOutpass extends StatefulWidget {
  @override
  _ApplyOutpassState createState() => _ApplyOutpassState();
}

class _ApplyOutpassState extends State<ApplyOutpass> {
  // final RoundedLoadingButtonController _btnController =
  //     new RoundedLoadingButtonController();

  // String? startDate, startTime;
  // String? endDate, endTime;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void _showSnackMessage(String message) {
    // _scaffoldKey.currentState.showSnackBar(SnackBar(
    //   content: Text(message),
    // ));
  }

  TextEditingController _desc = TextEditingController();

  String? userid;
  String? deptname = " ";

  String? phone = " ";
  String? email = " ";
  String? name = "welcome";
  String? profileurl =
      "https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png";

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserDataProvider>(context);

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("data"),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Apply For OutPass",
                  style: GoogleFonts.montserrat(
                    // color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //     margin: EdgeInsets.only(top: 20),
                    //     child: Text("Leave Starting From...",
                    //         style: GoogleFonts.montserrat(
                    //           fontSize: 16,
                    //         ))),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   margin: EdgeInsets.only(top: 7),
                    //   // height: 50,
                    //   // width: 252,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Container(
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(5),
                    //           color: Color.fromRGBO(233, 233, 233, 1),
                    //         ),
                    //         height: 45,
                    //         width: 45,
                    //         child: Icon(
                    //           FontAwesomeIcons.calendar,
                    //           color: ColorPalatte.primaryColor,
                    //         ),
                    //       ),
                    //       // Container(
                    //       //   height: 45,
                    //       //   width: MediaQuery.of(context).size.width * 0.75,
                    //       //   child: DateTimePicker(
                    //       //     decoration: InputDecoration(
                    //       //         labelText: "Pick your Date ",
                    //       //         hintStyle:
                    //       //             GoogleFonts.montserrat(fontSize: 16),
                    //       //         border: OutlineInputBorder(
                    //       //             borderRadius: BorderRadius.all(
                    //       //                 Radius.circular(10)))),
                    //       //     type: DateTimePickerType.dateTime,

                    //       //     firstDate: DateTime(2000),
                    //       //     lastDate: DateTime(2100),
                    //       //     // dateLabelText: 'Date',
                    //       //     onChanged: (val) =>
                    //       //         {startDate = val, print(startDate)},
                    //       //     validator: (val) {
                    //       //       print(val);
                    //       //       return null;
                    //       //     },
                    //       //     onSaved: (val) => print(val),
                    //       //   ),
                    //       // ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   margin: EdgeInsets.only(top: 7),
                    //   // height: 50,
                    //   // width: 252,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Container(
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(5),
                    //           color: Color.fromRGBO(233, 233, 233, 1),
                    //         ),
                    //         height: 45,
                    //         width: 45,
                    //         child: Icon(
                    //           FontAwesomeIcons.clock,
                    //           color: ColorPalatte.primaryColor,
                    //         ),
                    //       ),
                    //       Container(
                    //         height: 45,
                    //         width: MediaQuery.of(context).size.width * 0.75,
                    //         child: DateTimePicker(
                    //           decoration: InputDecoration(
                    //               labelText: "Pick your Time ",
                    //               hintStyle: GoogleFonts.montserrat(fontSize: 16),
                    //               border: OutlineInputBorder(
                    //                   borderRadius:
                    //                       BorderRadius.all(Radius.circular(10)))),
                    //           type: DateTimePickerType.time,
                    //           // initialValue: 'Choose Time',
                    //           // fieldHintText: "Vv",
                    //           // dateHintText: "asdsad",
                    //           timeHintText: "Sdasd",
                    //           // firstDate: DateTime(2000),
                    //           // lastDate: DateTime(2100),
                    //           // dateLabelText: 'Date',
                    //           onChanged: (val) => {startTime = val, print(startTime)},
                    //           validator: (val) {
                    //             print(val);
                    //             return null;
                    //           },
                    //           onSaved: (val) => print(val),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //     margin: EdgeInsets.only(top: 20),
                    //     child: Text("Leave Till...",
                    //         style: GoogleFonts.montserrat(
                    // fontSize: 16,
                    // ))),
                  ],
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22.0, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text("Reason of Leave",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                            ))),
                    TextField(
                        controller: _desc,
                        decoration: InputDecoration(
                            hintText: "E.g. Emergency ",
                            hintStyle: GoogleFonts.montserrat(fontSize: 16),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                        minLines: 5,
                        maxLines: 5,
                        style: StylingConfig.inputs),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: customButton("Apply For Outpass", () {
                  var uid = Uuid();
                  var outpassId = uid.v4();
                  FirebaseNotifications.getToken().then((value) {
                    FirebaseFirestore.instance
                        .collection("Outpass")
                        .doc(outpassId)
                        .set({
                      "user_token": value,
                      "outpass_id": outpassId.toString(),
                      "userid": userProvider.userModel.userid,
                      "name": userProvider.userModel.name,
                      "approved_by": "Arin",
                      "registration_no": userProvider.registrationNo,
                      "phone": userProvider.userModel.phone,
                      "room_no": userProvider.room,
                      "block": userProvider.block,
                      // "leave_address": _leaveAddress.text,
                      "parent_phone": userProvider.parentsPhone,
                      "leave_reason": _desc.text,
                      "year": userProvider.userModel.year,
                      // "course": courseSelectedOptions,
                      // "mode_of_transport": modeOfTransport,
                      "applied_timestamp": DateTime.now(),
                      "decision_timestamp": DateTime.now(),
                      "checkin_timestamp": DateTime.now(),
                      "checkout_timestamp": DateTime.now(),
                      "outpass_number": randomSixDigit(),
                      "status": "applied"
                    }).then((value) {
                      Navigator.of(context).pop();
                    });
                  });

                  // _btnController.success();
                  // Timer(Duration(seconds: 1), () {
                  // });
                }, context),
              )
            ],
          ),
        ),
      ),
    );
  }

  static String randomSixDigit() {
    Random random = Random();

    String code = random.nextInt(10000).toString();

    return code;
  }

  Widget inputTitle(
      String title, TextEditingController _controller, TextInputType type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(title,
                textAlign: TextAlign.start,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                ))),
        Container(
          height: 45,
          child: TextField(
              keyboardType: type,
              controller: _controller,
              decoration: InputDecoration(
                  // hintText: "E.g. Bulb Fuse ",
                  hintStyle: GoogleFonts.montserrat(fontSize: 16),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)))),
              // minLines: 5,
              // maxLines: 5s,
              style: StylingConfig.inputs),
        ),
      ],
    );
  }
}
