import 'package:get/get.dart';
import 'package:upes_go/Event/event_home.dart';
import 'package:upes_go/Outpass/view_outpass.dart';
import 'package:upes_go/Boarding/walk.dart';
import 'package:upes_go/components/bottom_nav.dart';
import 'package:upes_go/Settings/faqs_screen.dart';
import 'package:upes_go/Routes/route_const.dart';
import 'package:upes_go/Settings/settings.dart';

import '../Boarding/enter_phone.dart';
import '../Boarding/ref_page.dart';
import '../main.dart';

/// Add this list variable into your GetMaterialApp as the value of getPages parameter.
/// You can get the reference to the above GetMaterialApp code.
final getPages = [
  GetPage(
    name: RouteConstants.base,
    page: () => Bottomnavbar(
      index: 0,
    ),
    middlewares: [AuthGuardMiddleware()],
  ),
  GetPage(
    name: RouteConstants.walkthough,
    page: () => Walkthough(),
  ),
  GetPage(
    name: RouteConstants.login,
    page: () => EnterPhonepage(),
  ),
  GetPage(
    name: RouteConstants.referral,
    page: () => EnterRefCodePage(),
  ),
  GetPage(
    name: RouteConstants.event,
    page: () => EventHomeScreen(),
  ),
  GetPage(
    name: RouteConstants.outpass,
    page: () => OutPassViewScreen(),
  ),
  GetPage(
    name: RouteConstants.faq,
    page: () => Faqscreen(),
  ),
  GetPage(
    name: RouteConstants.settings,
    page: () => SettingsPage(),
  ),
  GetPage(
    name: RouteConstants.mess,
    page: () => Bottomnavbar(index: 1),
  ),
];

// class RouteGuard extends GetMiddleware {
//   @override
//   RouteSettings? redirect(String route) {
//     return userToken == null ? const RouteSettings(name: RouteConstants.login) : null;
//   }
// }
