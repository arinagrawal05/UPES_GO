// import 'package:MUJ_GO/shared/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:upes_go/Shared/functions.dart';
// import 'package:rounded_loading_button/rounded_loading_button.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:upes_go/components/custom_button.dart';

import '../Shared/colors.dart';
import '../provider/user_provider.dart';
// import 'package:smart_select/smart_select.dart';

class BugReportScreen extends StatefulWidget {
  @override
  _BugReportScreenState createState() => _BugReportScreenState();
}

class _BugReportScreenState extends State<BugReportScreen> {
  // String locationSelectedOptions = 'Select Categories';
  // List<S2Choice<String>> locationOptions = [
  //   S2Choice(value: "Mess Menu section", title: "Mess Menu"),
  //   S2Choice(value: "Outlet Food Menu", title: "Outlet Food Menu"),
  //   S2Choice(value: "Cab Sharing", title: "Cab Sharing"),
  //   S2Choice(
  //       value: "Faculty Contact Details", title: "Faculty Contact Details"),
  //   S2Choice(value: "Events", title: "Events"),
  //   S2Choice(value: "Complain section", title: "Complain section"),
  //   S2Choice(value: "Outpass section", title: "Outpass section"),
  //   S2Choice(
  //       value: "Used books Selling Section",
  //       title: "Used books Selling Section"),
  //   S2Choice(value: "Other", title: "Other"),
  // ];

  TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserDataProvider>(context);

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Text("Bug"),),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  "Report a Bug",
                  style: GoogleFonts.montserrat(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 30, left: 20, bottom: 20),
                  child: Text("Please Describe the Bug/Issue Below",
                      style: GoogleFonts.montserrat(
                          fontSize: 20, fontWeight: FontWeight.w600))),
              // SmartSelect<String>.single(
              //     title: 'Section',
              //     // value: locationSelectedOptions,
              //     choiceItems: locationOptions,
              //     onChange: (state) =>
              //         setState(() => locationSelectedOptions = state.value)),
              Container(
                margin: EdgeInsets.only(top: 7, left: 20, right: 20),
                // height: 50,
                // width: 252,
                child: TextField(
                    controller: _descController,
                    decoration: InputDecoration(
                        labelText: "Please Describe the Bug/Issue here",
                        hintStyle: GoogleFonts.montserrat(fontSize: 16),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    minLines: 4,
                    maxLines: 7,
                    style: StylingConfig.inputs),
              ),

              customButton("Report Bug", () {
                if (_descController.text.length > 10) {
                  FirebaseFirestore.instance.collection("feedback").add({
                    "bug_desc": _descController.text,
                    "username": userProvider.userModel.name,
                    "phone": userProvider.userModel.phone,
                    "userid": userProvider.userModel.userid,
                    "timestamp": DateTime.now(),
                    "Section": "locationSelectedOptions",
                    "type": "bug-report"
                  }).then((value) => {
                        AppUtils.showSnackMessage(
                            "Thank You For Reporting.\nWe will surely try to fix this ASAP")
                      });
                }
              }, context)
            ],
          ),
        ),
      ),
    );
  }
}
