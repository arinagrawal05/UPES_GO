import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:upes_go/Hive/Hive_models/commission_models/resell_hive_model.dart';
import 'package:upes_go/components/components.dart';

import '../Event/events_banner_page.dart';
import '../Hive/Hive_helpers/resell_hive_helper.dart';
import '../Shared/functions.dart';
import '../Shared/style.dart';
import '../models/resell_model.dart';
import 'custom_button.dart';

Widget producttile(
    ResellHiveModel model, String myuserid, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ), // clipBehavior: ,
      color: Theme.of(context).cardColor,
      elevation: 2,
      child: Container(
        // margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(8),
        // height: 130,
        // width: 343,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                navigateslide(
                    FullScreenBannerPage(
                        bannerUrl: model.productImg, name: model.productName),
                    Get.context!);
              },
              child: Container(
                height: 120,
                width: 90,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: cachedImage(model.productImg),
                  // Image.network(
                  //   model.productImg,
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              model.productName,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(fontSize: 16),
                            ),
                          ),
                        ),
                        // Spacer(),
                        GestureDetector(
                          onTap: () {
                            ResellHiveHelper.updateSpecifiProduct(
                                documentID: model.productid);
                          },
                          child: model.isFeatured
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 3),
                    child: Text(
                      model.productPrice + " Rs",
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(244, 117, 0, 1)),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        heading1("Seller: ", 12),
                        Text(
                          model.username,
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  model.userId != myuserid
                      ? Container(
                          // width: 80,
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  AppUtils.launchURL("sms: ${model.phone}");
                                },
                                child: CircleAvatar(
                                  maxRadius: 17,
                                  backgroundColor:
                                      Color.fromRGBO(70, 67, 211, 1),
                                  child: Icon(
                                    Ionicons.chatbox,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: GestureDetector(
                                  onTap: () {
                                    AppUtils.launchURL(
                                        "https://wa.me/91${model.phone}");
                                  },
                                  child: CircleAvatar(
                                    maxRadius: 17,
                                    backgroundColor:
                                        Color.fromRGBO(70, 67, 211, 1),
                                    child: Icon(
                                      Ionicons.logo_whatsapp,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  AppUtils.launchURL("tel: ${model.phone}");
                                },
                                child: CircleAvatar(
                                  maxRadius: 17,
                                  backgroundColor:
                                      Color.fromRGBO(70, 67, 211, 1),
                                  child: Icon(
                                    Ionicons.call,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : model.isSold
                          ? dottedNotice("Sold")
                          : Container(
                              child: customButton("Mark as Sold Out", () {
                                FirebaseFirestore.instance
                                    .collection("Re-sell")
                                    .doc(model.productid)
                                    .update({"isSold": true});
                              }, context, isExpanded: false),
                            )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
