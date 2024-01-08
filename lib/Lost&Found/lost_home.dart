import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:upes_go/Event/events_banner_page.dart';
import 'package:upes_go/Hive/Hive_models/commission_models/lost_hive_model.dart';
import 'package:upes_go/Lost&Found/enter_lost.dart';
import 'package:upes_go/Shared/functions.dart';
import 'package:upes_go/getx/lost_search_controller.dart';
import '../Shared/colors.dart';
import '../Shared/style.dart';
import '../components/components.dart';
import '../components/static_widgets.dart';
import '../provider/user_provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class LostHome extends StatefulWidget {
  // final String username, userid;

  // const LostHome({super.key, required this.username, required this.userid});
  @override
  _LostHomeState createState() => _LostHomeState();
}

class _LostHomeState extends State<LostHome>
    with SingleTickerProviderStateMixin {
//

  int activeint = 0;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserDataProvider>(context);
    return GetBuilder<LostSearchController>(
        init: LostSearchController(isPending: true),
        builder: (controller) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 200,
                leading: Container(),
                automaticallyImplyLeading: false,
                leadingWidth: 0,
                title: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Search any Item\nYou are Looking For ?",
                              style: GoogleFonts.montserrat(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  // ResellHiveHelper.fetchProductsFromFirebase();
                                },
                                child: upesAvatar(context, 40))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    customTextField(
                        controller.searchController, "Search By Item Name",
                        highLight: true, onchange: (value) {
                      controller.filterProducts();
                    }),
                  ],
                ),
                bottom: TabBar(
                  onTap: (index) {
                    controller.changeCategory(index == 0
                        ? "Lost"
                        : index == 1
                            ? "Found"
                            : "Recovered");
                  },
                  dividerColor: ColorPalatte.primaryColor,
                  labelColor: ColorPalatte.primaryColor,
                  indicatorColor: ColorPalatte.primaryColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  dividerHeight: 0,

                  // indicator: indicatord(),
                  // indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                  indicatorWeight: 1.5,
                  tabs: [
                    customTab("Lost", Ionicons.pricetag_outline),
                    customTab("Found", Ionicons.sparkles_outline),
                    customTab("Recovered", Ionicons.notifications_outline),
                  ],
                ),
              ),
              body: TabBarView(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(),
                  // tile(),
                  SingleChildScrollView(
                    child: ListView.builder(
                        // scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          if (controller.products.length == 0) {
                            return noDataWidget();
                          }
                          return tile(
                            controller.products[index],
                          );
                        }),
                  ),
                  Container(),

                  // tile(),
                ],
              ),
              floatingActionButton: FloatingActionButton.extended(
                label: heading("Add Request", 14, color: Colors.white),
                backgroundColor: ColorPalatte.primaryColor,
                onPressed: () {
                  navigateslide(EnterLost(model: null), context);
                },
              ),
            ),
          );
        });
  }

  Tab customTab(String title, IconData icon) {
    return Tab(
      height: 30,
      // icon: Icon(icon),
      child: heading(title, 16),
      iconMargin: EdgeInsets.only(bottom: 0),
    );
  }
}

Widget tile(LostHiveModel model) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ), // clipBehavior: ,
      color: Theme.of(Get.context!).cardColor,
      elevation: 2,
      child: Container(
        // margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      heading1(timeago.format(model.timestamp), 12),
                      heading1(" ${model.status}", 12, color: Colors.red),
                    ],
                  ),
                  heading(model.name, 22),
                  Row(
                    children: [
                      heading1("Last Spotted at ", 12,
                          color: ColorPalatte.primaryColor),
                      heading1("${model.location}", 12,
                          overF: TextOverflow.clip),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, right: 14),
                    child: heading1(model.description, 12,
                        overF: TextOverflow.clip),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: GestureDetector(
                    onTap: () {
                      navigateslide(
                          FullScreenBannerPage(
                              bannerUrl: model.image, name: model.name),
                          Get.context!);
                    },
                    child: cachedImage(model.image)))
          ],
        ),
      ),
    ),
  );
}
