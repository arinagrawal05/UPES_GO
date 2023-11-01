import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import '../Shared/colors.dart';
import '../Shared/style.dart';
import '../components/components.dart';
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
// AnimationController controller;
// ProfileAnimation animation;
  int optionChoice = 0;

  TextEditingController searchController = TextEditingController();
  decideOption() {
    int d = Random().nextInt(2);
    print(d.toString());
    setState(() {
      optionChoice = d;
    });
  }

  @override
  void initState() {
    super.initState();
    // getpref();
    decideOption();
    // controller = AnimationController(
    //   duration: Duration(milliseconds: 2000),
    //   vsync: this
    // );
    // animation = ProfileAnimation(controller);
    // controller.forward();
  }

  int activeint = 0;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserDataProvider>(context);

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
              customTextField(searchController, "Search By Item Name",
                  highLight: true, onchange: (value) {
                // controller.filterProducts();
              }),
            ],
          ),
          bottom: TabBar(
            dividerColor: ColorPalatte.primaryColor,
            labelColor: ColorPalatte.primaryColor,
            indicatorColor: ColorPalatte.primaryColor,
            indicatorSize: TabBarIndicatorSize.label,
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
            tile(),
            SingleChildScrollView(
              child: ListView.builder(
                  // scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 35,
                  itemBuilder: (context, index) {
                    return tile();
                  }),
            ),
            tile(),
          ],
        ),
      ),
    );
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

Widget tile() {
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
                      heading1(
                          timeago.format(
                              DateTime.now().subtract(Duration(minutes: 15))),
                          12),
                      heading1(" Lost", 12, color: Colors.red),
                    ],
                  ),
                  heading("Blue Adidas Bag", 22),
                  Row(
                    children: [
                      heading1("Last Spotted", 12,
                          color: ColorPalatte.primaryColor),
                      heading1(" at Aphitheatre", 12, overF: TextOverflow.clip),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, right: 14),
                    child: heading1(
                        "Blue Adidas Bag Blue Adidas Bag Blue Adidas Bag Adidas Bag Blue Adidas Bag Blue Adidas Bag Adidas Bag Blue Adidas Bag Blue Adidas Bag  Adidas Bag Blue Adidas Bag Blue Adidas Bag ",
                        12,
                        overF: TextOverflow.clip),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Image.network(
                    "https://rukminim2.flixcart.com/image/850/1000/k4hcjgw0/backpack/2/n/s/stream-01-blue-sbstr1hablu-backpack-skybags-original-imafnds9zfuryyyu.jpeg?q=90"))
          ],
        ),
      ),
    ),
  );
}
