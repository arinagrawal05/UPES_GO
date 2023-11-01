// import 'package:MUJ_GO/Screens/Outpass/outpass.dart';
// import 'package:MUJ_GO/Screens/Outpass/outpass_ticket.dart';
// import 'package:MUJ_GO/shared/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upes_go/Outpass/apply_outpass.dart';
import 'package:upes_go/Outpass/outpass_ticket.dart';
import 'package:upes_go/Shared/functions.dart';
import 'package:upes_go/Shared/style.dart';
import 'package:upes_go/components/custom_button.dart';
import 'package:upes_go/models/outpass_model.dart';

import '../Shared/colors.dart';
import '../components/static_widgets.dart';
import '../provider/user_provider.dart';

class OutPassViewScreen extends StatefulWidget {
  @override
  _OutPassViewScreenState createState() => _OutPassViewScreenState();
}

class _OutPassViewScreenState extends State<OutPassViewScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserDataProvider>(context);

    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPalatte.primaryColor,
        onPressed: () {
          navigateslide(
            ApplyOutpass(),
            context,
          );
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => OutpassScreen()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Past Outing Records"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Outpass')
                      .orderBy("applied_timestamp")
                      .where("userid", isEqualTo: userProvider.userModel.userid)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: customCircularLoader("Outpass"),
                      );
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return noDataWidget();
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return outpassCard(
                            OutpassModel.fromFirestore(
                                snapshot.data!.docs[index]),
                          );
                        });
                  }),
            )
          ],
        ),
      ),
    ));
  }

  //                   if (snapshot.connectionState == ConnectionState.waiting) {
  //   return customCircularLoader("Companies");
  // } else
  // {
  Widget outpassCard(
    OutpassModel model,
  ) {
    return Container(
      decoration: BoxDecoration(
          // border: Border.all(width: 0.5),
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          model.status == "approved"
              ? Icon(
                  Ionicons.checkmark_circle,
                  color: Colors.green,
                )
              : model.status == "applied"
                  ? Icon(
                      Ionicons.time,
                      color: ColorPalatte.primaryColor,
                    )
                  : Icon(
                      Ionicons.close_circle,
                      color: Colors.red,
                    ),
          heading(
              model.status == "approved"
                  ? "OutPass ID: " + model.outpassNumber
                  : "OutPass ID: NA",
              16),
          heading1(
            "Checkout by " +
                AppUtils.dateTimetoText(model.appliedTime.toDate()),
            12,
            // style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "Reason: " + model.leaveReason,
            style: GoogleFonts.montserrat(
                fontSize: 16, fontWeight: FontWeight.w400),
          ),
          model.status == "approved"
              ? customButton("View Outpass", () {
                  navigateslide(
                      OutpassTicketView(
                        model: model,
                      ),
                      context);
                }, context)
              : Container()
        ],
      ),
    );
  }
}
