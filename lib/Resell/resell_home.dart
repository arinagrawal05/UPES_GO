import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:upes_go/Hive/Hive_helpers/resell_hive_helper.dart';
import 'package:upes_go/Shared/const.dart';
import 'package:upes_go/Shared/functions.dart';
import 'package:upes_go/Shared/style.dart';
import 'package:upes_go/components/components.dart';
import 'package:upes_go/Resell/enter_resell.dart';
import 'package:upes_go/components/product_card.dart';
import 'package:upes_go/components/static_widgets.dart';
import 'package:upes_go/getx/resell_search_controller.dart';

import '../Shared/colors.dart';
import '../Shared/dynamic_tabbar.dart';
import '../provider/user_provider.dart';

class Resellhomescreen extends StatefulWidget {
  @override
  _ResellhomescreenState createState() => _ResellhomescreenState();
}

class _ResellhomescreenState extends State<Resellhomescreen> {
  int initPosition = 0;

  List data = ["All", "Featured"];
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserDataProvider>(context);
    data.addAll(TermConsts.resellCate);
    return GetBuilder<ResellSearchController>(
        init: ResellSearchController(isPending: true),
        // tag: '${widget.type}ForPendingCommission',
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                toolbarHeight: 150,
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
                                  ResellHiveHelper.fetchProductsFromFirebase();
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
              ),
              floatingActionButton: FloatingActionButton.extended(
                label: heading("Add Product", 14, color: Colors.white),
                backgroundColor: ColorPalatte.primaryColor,
                onPressed: () {
                  navigateslide(EnterResell(model: null), context);
                },
              ),
              body: SafeArea(
                child: CustomTabView(
                  stub: Container(),
                  initPosition: initPosition,
                  itemCount: data.length,
                  tabBuilder: (context, index) => resultTab(index, controller),
                  pageBuilder: (context, index) {
                    return ListView.builder(
                        // controller: scrollController,
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        // shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          // if (EnumUtils.convertTypeToKey(widget.type) ==
                          //     controller.commissions[index].commissionType) {
                          //   if (controller.commissions[index].isPending ==
                          //       true) {
                          // if (!controller.products.isNotEmpty) {
                          //   return Center(
                          //     child: customCircularLoader("Products"),
                          //   );
                          // }
                          if (controller.products.length == 0) {
                            return noDataWidget();
                          }
                          return producttile(controller.products[index],
                              provider.userModel.userid, context);
                          //   }
                          // }
                          // return Container();
                        });
                  },
                  onPositionChange: (index) {
                    print('current position: $index');
                    controller.changeCategory(data[index]);
                    print(controller.categoryFilter);
                    initPosition = index;
                  },
                  onScroll: (position) {},
                ),
              ));
        });
  }

  Widget resultTab(int index, ResellSearchController count) {
    return Tab(
        height: 40,
        text: data[index] != count.categoryFilter
            ? data[index]
            : data[index] + "(${count.products.length})");
  }
}
