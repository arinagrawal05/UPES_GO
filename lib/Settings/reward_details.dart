// import 'package:MUJ_GO/shared/colors.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:share/share.dart';
// import 'package:rounded_loading_button/rounded_loading_button.dart';
// ignore: unused_import
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:upes_go/Shared/colors.dart';
import 'package:upes_go/Shared/functions.dart';
import 'package:upes_go/Shared/style.dart';
import 'package:upes_go/components/components.dart';
import 'package:upes_go/components/custom_button.dart';
import 'package:upes_go/Boarding/ref_page.dart';

// import 'package:smart_select/smart_select.dart';

class RewardDetail extends StatefulWidget {
  @override
  _RewardDetailState createState() => _RewardDetailState();
}

class _RewardDetailState extends State<RewardDetail> {
  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserDataProvider>(context);
    String code =
        getRefCode("Arin Agrawal".trim(), "500120660".trim()).toUpperCase();
    return SafeArea(
      child: Scaffold(
        // key: _scaffoldKey,
        // appBar: AppBar(title: Text("Bug"),),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              width: double.infinity,
              height: 150,
              color: ColorPalatte.primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heading("Welcome to", 14, color: Colors.white),
                  heading("UPES Rewards", 24, color: Colors.white),
                ],
              ),
            ),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    decoration: dashbox(context)
                        .copyWith(color: Theme.of(context).cardColor),
                    width: MediaQuery.of(context).size.width * 0.85,
                    // height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(child: upesAvatar(context, 30)),
                            heading(" Points", 17),
                          ],
                        ),
                        Spacer(),
                        heading("1200", 20),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    decoration: dashbox(context)
                        .copyWith(color: Theme.of(context).cardColor),
                    width: MediaQuery.of(context).size.width * 0.85,
                    // height: 150,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Ionicons.trophy_outline,
                            size: 35,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              heading("Verified", 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: heading1("1890 points to Verified", 12),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SimpleAnimationProgressBar(
                                height: 10,
                                width: 330,
                                backgroundColor:
                                    ColorPalatte.primaryColor.withOpacity(0.2),
                                foregrondColor: ColorPalatte.primaryColor,
                                ratio: 0.5,
                                direction: Axis.horizontal,
                                curve: Curves.fastLinearToSlowEaseIn,
                                duration: const Duration(seconds: 3),
                                borderRadius: BorderRadius.circular(10),
                              )
                            ],
                          ),
                        )),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    decoration: dashbox(context)
                        .copyWith(color: Theme.of(context).cardColor),
                    width: MediaQuery.of(context).size.width * 0.85,
                    // height: 150,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(5.0),
                        //   child: Icon(
                        //     Ionicons.trophy_outline,
                        //     size: 35,
                        //   ),
                        // ),
                        Expanded(
                            child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              heading("Learn How To Earn", 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: heading1("1890 points to Verified", 12),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SimpleAnimationProgressBar(
                                height: 10,
                                width: 330,
                                backgroundColor:
                                    ColorPalatte.primaryColor.withOpacity(0.2),
                                foregrondColor: ColorPalatte.primaryColor,
                                ratio: 0.5,
                                direction: Axis.horizontal,
                                curve: Curves.fastLinearToSlowEaseIn,
                                duration: const Duration(seconds: 3),
                                borderRadius: BorderRadius.circular(10),
                              )
                            ],
                          ),
                        )),
                      ],
                    )),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          navigateslide(EnterRefCodePage(), context);
                          // Clipboard.setData(ClipboardData(text: code))
                          //     .then((value) {
                          //   AppUtils.showSnackMessage("Code Copied");
                          // });
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: dashbox(context),
                          child: Row(
                            children: [
                              heading(code, 20),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Ionicons.copy_outline),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Divider(
                  endIndent: 10,
                  indent: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Column(
                    children: [
                      heading1(
                        "To Understand How Refferal Work",
                        14,
                        center: true,
                        overF: TextOverflow.clip,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      heading1("View Invitation Rules", 14,
                          center: true,
                          overF: TextOverflow.clip,
                          color: ColorPalatte.primaryColor),
                    ],
                  ),
                ),
                stepWidget(),
                Spacer(),
                customButton("Refer a Friend", () {
                  Share.share(
                      'Download UPES GO with my referal Code "${code}" and earn amazing rewards');
                }, context)
                // Container(
                //   margin: EdgeInsets.only(top: 7, left: 20, right: 20),
                //   // height: 50,
                //   // width: 252,
                //   child: TextField(
                //       controller: _descController,
                //       decoration: InputDecoration(
                //           labelText: "Please Describe..",
                //           hintText:
                //               "Please describe us what all do you need more in this app. How can we make it even better..",
                //           hintStyle: GoogleFonts.montserrat(fontSize: 16),
                //           border: OutlineInputBorder(
                //               borderRadius:
                //                   BorderRadius.all(Radius.circular(10)))),
                //       minLines: 4,
                //       maxLines: 7,
                //       style: StylingConfig.inputs),
                // ),
                // customButton("Submit Suggestion", () {
                //   if (_descController.text.length > 10) {
                //     FirebaseFirestore.instance.collection("feedback").add({
                //       "feature_desc": _descController.text,
                //       "username": userProvider.userModel.name,
                //       "phone": userProvider.userModel.phone,
                //       "userid": userProvider.userModel.userid,
                //       "timestamp": DateTime.now(),
                //       "type": "new-addition"
                //       // "location": locationSelectedOptions
                //     }).then((value) => {
                //           AppUtils.showSnackMessage(
                //               "Thank You for your Feedback ${userProvider.userModel.name[0]}"),
                //           _descController.clear(),
                //           Timer(Duration(seconds: 5), () {
                //             Navigator.of(context).pop();
                //           })
                //         });
                //   }
                // }, context)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
