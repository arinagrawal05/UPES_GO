import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';

import 'package:ionicons/ionicons.dart';
import 'package:upes_go/Shared/colors.dart';
import 'package:upes_go/models/faq_model.dart';

import '../components/static_widgets.dart';
// import 'package:url_launcher/url_launcher.dart';

class Faqscreen extends StatefulWidget {
  @override
  _FaqscreenState createState() => _FaqscreenState();
}

class _FaqscreenState extends State<Faqscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalatte.primaryColor,
          title: Text("FAQs"),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('FAQ').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: customCircularLoader("FAQs"),
                );
              }
              if (snapshot.data!.docs.isEmpty) {
                return noDataWidget();
              }
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return questiontile(
                        FAQModel.fromFirestore(snapshot.data!.docs[index]));
                  });
            }));
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

    // ExpansionTile(
    //   clipBehavior: Clip.antiAlias,
    //   title: Text(
    //     model.question,
    //     style: GoogleFonts.mPlus1p(
    //       fontSize: 18,
    //       fontWeight: FontWeight.w500,
    //     ),
    //   ),
    //   children: <Widget>[
    //     Container(
    //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    //       child: Text(
    //         model.answer,
    //         style: GoogleFonts.roboto(
    //           fontSize: 20,
    //           fontWeight: FontWeight.w400,
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }
}
