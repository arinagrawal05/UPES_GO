// import 'package:carousel_pro/carousel_pro.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:upes_go/components/static_widgets.dart';

import '../models/notice_model.dart';

class NoticeSliderWidget extends StatefulWidget {
  @override
  _NoticeSliderWidgetState createState() => _NoticeSliderWidgetState();
}

class _NoticeSliderWidgetState extends State<NoticeSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 170,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Notices')
                .where("isActive", isEqualTo: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: customCircularLoader("Notices"),
                );
              }
              if (snapshot.data!.docs.isEmpty) {
                return noDataWidget();
              }
              return FlutterCarousel(
                options: CarouselOptions(
                  disableCenter: true,
                  autoPlay: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 3),
                  showIndicator: false,
                ),
                items: snapshot.data!.docs.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return noticecard(NoticeModel.fromFirestore(i), context);
                    },
                  );
                }).toList(),
              );
            }));
  }
}

Widget noticecard(NoticeModel model, BuildContext context) {
  return Container(
      height: 121,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(70, 67, 211, 1),
        // color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      // border: Border.all(width: 2),),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 11,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.heading,
                  style:
                      GoogleFonts.montserrat(color: Colors.white, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  model.content,
                  style: GoogleFonts.sourceCodePro(
                      color: Color.fromRGBO(255, 255, 255, 0.47), fontSize: 14),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                Share.share('*' + model.heading + "*\n" + model.content);
              },
              child: CircleAvatar(
                backgroundColor: Color.fromRGBO(255, 255, 255, 0.46),
                child: Icon(
                  Icons.share,
                  color: Color.fromRGBO(70, 67, 211, 1),
                ),
              ),
            ),
          ),
        ],
      ));
}
