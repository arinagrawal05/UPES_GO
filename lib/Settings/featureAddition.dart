import 'dart:async';

// import 'package:MUJ_GO/shared/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'package:rounded_loading_button/rounded_loading_button.dart';
// ignore: unused_import
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upes_go/Shared/functions.dart';
import 'package:upes_go/components/custom_button.dart';

import '../Shared/colors.dart';
import '../provider/user_provider.dart';
// import 'package:smart_select/smart_select.dart';

class FeatureSuggestionScreen extends StatefulWidget {
  @override
  _FeatureSuggestionScreenState createState() =>
      _FeatureSuggestionScreenState();
}

class _FeatureSuggestionScreenState extends State<FeatureSuggestionScreen> {
//   String locationSelectedOptions = 'Select Categories';
//   List<S2Choice<String>> locationOptions = [
//     S2Choice(value: "Mess Menu section", title: "Mess Menu"),
//     S2Choice(value: "Outlet Food Menu", title: "Outlet Food Menu"),
//     S2Choice(value: "Cab Sharing", title: "Cab Sharing"),
//  S2Choice(value: "Faculty Contact Details", title: "Faculty Contact Details"),
//     S2Choice(value: "Events", title: "Events"),
//     S2Choice(value: "Complain section", title: "Complain section"),
//       S2Choice(value: "Outpass section", title: "Outpass section"),
//         S2Choice(value: "Used books Selling Section", title: "Used books Selling Section"),
//           S2Choice(value: "Other", title: "Other"),
//   ];

  TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserDataProvider>(context);

    return SafeArea(
      child: Scaffold(
        // key: _scaffoldKey,
        // appBar: AppBar(title: Text("Bug"),),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  "Hello ${userProvider.userModel.name[0]}",
                  style: GoogleFonts.montserrat(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  margin:
                      EdgeInsets.only(top: 30, left: 20, bottom: 20, right: 20),
                  child: Text(
                      "Please Suggest us what new Feature do you want us to add in UPES GO APP",
                      style: GoogleFonts.montserrat(
                          fontSize: 20, fontWeight: FontWeight.w400))),

              //          SmartSelect<String>.single(
              // title: 'Location',
              // value: locationSelectedOptions,
              // choiceItems: locationOptions,
              // onChange: (state) => setState(
              //     () => locationSelectedOptions = state.value)),
              Container(
                margin: EdgeInsets.only(top: 7, left: 20, right: 20),
                // height: 50,
                // width: 252,
                child: TextField(
                    controller: _descController,
                    decoration: InputDecoration(
                        labelText: "Please Describe..",
                        hintText:
                            "Please describe us what all do you need more in this app. How can we make it even better..",
                        hintStyle: GoogleFonts.montserrat(fontSize: 16),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    minLines: 4,
                    maxLines: 7,
                    style: StylingConfig.inputs),
              ),
              customButton("Submit Suggestion", () {
                if (_descController.text.length > 10) {
                  FirebaseFirestore.instance.collection("feedback").add({
                    "feature_desc": _descController.text,
                    "username": userProvider.userModel.name,
                    "phone": userProvider.userModel.phone,
                    "userid": userProvider.userModel.userid,
                    "timestamp": DateTime.now(),
                    "type": "new-addition"
                    // "location": locationSelectedOptions
                  }).then((value) => {
                        AppUtils.showSnackMessage(
                            "Thank You for your Feedback ${userProvider.userModel.name[0]}"),
                        _descController.clear(),
                        Timer(Duration(seconds: 5), () {
                          Navigator.of(context).pop();
                        })
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
