import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_selector/widget/flutter_single_select.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:upes_go/Settings/reward_details.dart';
import 'package:upes_go/Shared/const.dart';
import 'package:upes_go/Shared/functions.dart';
import 'package:upes_go/components/static_widgets.dart';

import '../Shared/colors.dart';
import '../Shared/style.dart';
import '../provider/theme_provider.dart';
import 'custom_button.dart';

Widget upesCredit(int points, BuildContext context) {
  return GestureDetector(
    onTap: () {
      navigateslide(RewardDetail(), context);
    },
    child: Container(
      padding: EdgeInsets.all(5),
      decoration: dashbox(context),
      child: Row(
        children: [
          upesAvatar(context, 17),
          SizedBox(
            width: 5,
          ),
          heading1("${points} pts", 10)
        ],
      ),
    ),
  );
}

ClipRRect upesAvatar(BuildContext context, double size) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
      color: Theme.of(context).canvasColor,
      height: size,
      width: size,
      child: Image.asset(
        "assets/logo.jpg",
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget slidelogo(IconData icon, String name, Function() onpressIcon,
    {Color? fontColor}) {
  return GestureDetector(
    onTap: onpressIcon,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 9),
      // color: Colors.amber,
      // height: 106,
      width: 70,
      child: Column(
        children: [
          Container(
            child: Icon(
              icon,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),

              // border: Border.all(width: 2, color: Colors.white),
              color: ColorPalatte.primaryColor,
            ),
            height: 55,
            width: 65,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(fontSize: 15, color: fontColor),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget stepWidget() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 13),
    decoration: dashbox(Get.context!)
        .copyWith(color: Theme.of(Get.context!).canvasColor.withOpacity(0.5)),
    // padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        stepUnitWidget("Copy Code", Ionicons.copy_outline),
        stepUnitWidget("Friends Registered\nSuccessfully",
            Ionicons.checkmark_circle_outline),
        stepUnitWidget("Earn Points\nReward", Ionicons.server_outline),
      ],
    ),
  );
}

Widget stepUnitWidget(String title, IconData icon) {
  return Expanded(
    flex: 1,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            icon,
            size: 18,
            color: Colors.grey,
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: heading1(title, 12, center: true))
      ],
    ),
  );
}

Widget socialIcon(IconData icon, Color color, void Function()? onTap) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Icon(
            icon,
            color: Colors.white,
            size: 18,
          ),
          color: color,
        ),
      ),
    ),
  );
}

Widget perkTile(String text) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(7.0),
        child: Icon(
          Ionicons.checkmark,
          size: 15,
          color: Colors.green,
        ),
      ),
      heading1(text, 14, overF: TextOverflow.clip)
    ],
  );
}

Widget premiumWidget() {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: 10,
    ),
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
    // height: 300,
    width: double.infinity,
    decoration: dashbox(Get.context!).copyWith(
      gradient: const LinearGradient(
        colors: [
          Color(0xffffbf00),
          Color(0xffffdc73),
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        stops: [0.4, 0.7],
        tileMode: TileMode.repeated,
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Subscription is Activated",
              style: GoogleFonts.robotoSlab(
                fontSize: 38,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
                color: Colors.white,
              ),
            ),
            // DateTime.now().difference(validityDate).inDays > 10
            //     ?
            // Text(
            //     "Validity Till",
            //     style: GoogleFonts.robotoSlab(
            //       fontSize: 18,
            //       fontWeight: FontWeight.w600,
            //       decoration: TextDecoration.none,
            //       color: Colors.white,
            //     ),
            //   )
            // :
            Text(
              "Your subscription will over",
              style: GoogleFonts.robotoSlab(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
                color: Colors.white,
              ),
            ),
          ],
        ),

        customButton("Contact Admin", () {}, Get.context!, isExpanded: false)

        // )
      ],
    ),
  );
}

Widget genericPicker(
  List<String> itemsList,
  String initialValue,
  String title,
  void Function(dynamic)? onSelectionDone,
  BuildContext context, {
  double? width,
  double? height = 50,
  double radius = 5,
  IconData prefixIcon = Ionicons.filter,
}) {
  // final provider = Provider.of<FilterProvider>(context, listen: true);
  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

  return Container(
    width: width,
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 5),
    height: height,
    child: CustomSingleSelectField<String>(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 3),
          prefixIcon: Icon(
            prefixIcon,
            color: themeProvider.getCurrentThemes() == ThemeMode.dark
                ? Colors.white
                : Colors.black,
          ),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(radius))),
      width: 200,
      items: itemsList,
      initialValue: initialValue,
      title: title,
      // textColor: themeProvider.getCurrentThemes() == ThemeMode.dark
      //     ? Colors.white
      //     : Colors.black,
      onSelectionDone: onSelectionDone,
      itemAsString: (item) => item,
    ),
  );
}

Widget dottedBorder({
  required Color color,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: DottedBorder(
        dashPattern: const [6.7],
        // borderType: BorderType.RRect,

        color: color,
        radius: const Radius.circular(18),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Ionicons.cloud_upload_outline,
                // color: color,
                size: 35,
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: (() {}),
                  child: productTileText(
                    'Add Image',
                    22,
                    color: ColorPalatte.primaryColor,
                  ))
            ],
          ),
        )),
  );
}

Widget dottedNotice(
  String text,
) {
  return Container(
    decoration:
        dashbox(Get.context!).copyWith(color: Colors.green.withOpacity(0.2)),
    padding: const EdgeInsets.all(8.0),
    margin: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Icon(
          Ionicons.checkmark_circle,
          color: Colors.green,
        ),
        Text(
          text,
          style: Theme.of(Get.context!).textTheme.titleSmall,
        ),
      ],
    ),
  );
}

Widget customTextfield2(
    TextEditingController controller, String labelText, BuildContext context,
    {bool isExpanded = false, onChange, double wid = 500, double hgt = 40}) {
  return Container(
    decoration: dashbox(context),
    width: isExpanded ? double.infinity : wid,
    height: hgt,
    // padding: const EdgeInsets.all(6),
    child: TextField(
      style: GoogleFonts.nunito(
        fontWeight: FontWeight.w300,
      ),
      onChanged: onChange,
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: labelText,
        // isDense: true,
        contentPadding: const EdgeInsets.all(4),
      ),
    ),
  );
}

Widget customTextField(TextEditingController controller, String hintText,
    {TextInputType? keyboardType,
    bool hidden = false,
    bool highLight = false,
    onchange}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6),
    child: CustomTextField(
      controller,
      onPress: onchange,
      // onEditingComplete: ,
      keyboardType: keyboardType ?? null,
      obscure: hidden,
      password: false,
      backgroundColor: highLight == false
          ? Colors.transparent
          : Theme.of(Get.context!).cardColor,
      border: Border.all(
          width: 0,
          color: highLight == false
              ? Theme.of(Get.context!).cardColor
              : Colors.transparent),
      hint: hintText,
    ),
  );
}

Widget cachedImage(String companyImg) {
  return CachedNetworkImage(
    imageUrl: companyImg,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
          // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
        ),
      ),
    ),
    placeholder: (context, url) => customCircularLoader(""),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
