// import 'package:upes_go/Boarding/enterphone.dart';
// import 'package:upes_go/Settings/bugReport.dart';
// import 'package:upes_go/Settings/featureAddition.dart';
// import 'package:upes_go/faqs_screen.dart';
// import 'package:upes_go/Settings/termsCondition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upes_go/Settings/bugReport.dart';
import 'package:upes_go/Settings/featureAddition.dart';
import 'package:upes_go/Settings/refer_friend.dart';
import 'package:upes_go/Settings/termsCondition.dart';
import 'package:upes_go/Shared/const.dart';
import 'package:upes_go/Shared/functions.dart';
import 'package:upes_go/Shared/style.dart';
import 'package:upes_go/Boarding/enter_phone.dart';

import '../components/theme_toggle.dart';
import 'faqs_screen.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: Container(
          // height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 20, bottom: 30),
                child: Text(
                  "Settings",
                  style: GoogleFonts.montserrat(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  optiontile(Ionicons.color_palette_outline, "Dark Mode", () {
                    navigateslide(FeatureSuggestionScreen(), context);
                  }, trailer: const ChangeThemeButtonWidget()),
                  optiontile(Ionicons.help_circle_outline, "FAQ", () {
                    navigateslide(Faqscreen(), context);
                  }),

                  optiontile(Ionicons.help_buoy_outline, "Contact DSW Helpline",
                      () {
                    // navigateslide(FeatureSuggestionScreen(), context);
                  }),
                  optiontile(Ionicons.megaphone_outline,
                      "Refer a ${AppConsts.appUserNicks}", () {
                    navigateslide(ReferFriendScreen(), context);
                  }),
                  optiontile(
                      Ionicons.bulb_outline, "Any New Feature Suggestion", () {
                    navigateslide(FeatureSuggestionScreen(), context);
                  }),
                  optiontile(
                      Ionicons.logo_google_playstore, "Rate us on Play Store",
                      () {
                    // _launchURL(
                    //     "https://play.google.com/store/apps/details?id=com.manipal.upes_go");
                  }),
                  // optiontile("Change Phone Number"),
                  optiontile(Ionicons.bug_outline, "Report a Bug", () {
                    navigateslide(BugReportScreen(), context);
                  }),
                  optiontile(
                      Ionicons.document_text_outline, "Terms & Conditions", () {
                    navigateslide(TermsAndCondition(), context);
                  }),

                  optiontile(Ionicons.log_out_outline, "Log Out", () {
                    navigateslide(EnterPhonepage(), context);
                  }),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "version 1.0.4",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  setpreflogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool("isLogged", false);
  }

  Widget optiontile(IconData icon, String name, ontap, {Widget? trailer}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(icon),
                    ),
                    heading(name, 16),
                    Spacer(),
                    trailer == null
                        ? Icon(
                            Ionicons.chevron_forward,
                            // color: Colors.black,
                          )
                        : trailer
                  ],
                ),
                Divider()
              ],
            ),
          )),
    );
  }
}
