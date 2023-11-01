import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:upes_go/Shared/style.dart';
import 'package:upes_go/models/faq_model.dart';

import '../Outpass/view_outpass.dart';
import '../Shared/functions.dart';
import '../components/components.dart';
// import 'package:url_launcher/url_launcher.dart';

class HostelFeatures extends StatefulWidget {
  @override
  _HostelFeaturesState createState() => _HostelFeaturesState();
}

class _HostelFeaturesState extends State<HostelFeatures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: Colors.black87,
          height: 350,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              heading("Hostel\nFeatures", 60, color: Colors.white),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  slidelogo(Ionicons.cafe, "Mess", () {
                    // FirebaseFirestore.instance
                    //     .collection("Mess")
                    //     .doc("thursday")
                    //     .set(MessData.thursday);
                    // navigateslide(Bottomnavbar(index: 1), context);
                  }, fontColor: Colors.white),
                  slidelogo(Ionicons.receipt, "Complain", () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             OutPassViewScreen()));
                    AppUtils.showSnackMessage(
                      "This Feature is not Released Yet",
                    );
                  }, fontColor: Colors.white),
                  slidelogo(Ionicons.paper_plane, "Outpass", () {
                    // FirebaseFirestore.instance
                    //     .collection("Outpass")
                    //     .add(OutpassData.set1);
                    navigateslide(
                      OutPassViewScreen(),
                      context,
                    );
                  }, fontColor: Colors.white),
                ],
              )
            ],
          ),
        )
      ],
    ));
  }

  // onTap: () {
  //   _launchURL(
  //       "https://www.instagram.com/kitchenkart_app/");
  // },

  Widget questiontile(FAQModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3.5),
      child: ExpansionTileBorderItem(
        tilePadding: EdgeInsets.symmetric(horizontal: 15),
        trailing: model.isPermanent
            ? Icon(
                Ionicons.star,
                size: 18,
              )
            : null,
        title: Text(
          model.question,
        ),
        expendedBorderColor: Colors.blue,
        children: [
          Text(model.answer),
        ],
      ),
    );
  }
}
