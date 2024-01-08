import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upes_go/provider/auth_provider.dart';
import 'package:upes_go/Routes/route_const.dart';
import 'package:upes_go/provider/ref_provider.dart';
import 'Hive/Hive_helpers/hive_helper.dart';
import 'init_settings.dart';
import 'Routes/router_config.dart';
import 'provider/theme_provider.dart';
import 'provider/user_provider.dart';

Future<void> main() async {
  // errorervices();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  final isLogged = prefs.getBool('isLogged') ?? false;
  enableFirebaseSettings();
  // NavigationService().setupLocator();
  HiveHelper.init();

  runApp(MyApp(
    isLogged: isLogged,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLogged;
  MyApp({required this.isLogged});

  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ThemeProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => UserDataProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => AuthProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => RefProvider(),
            ),
          ],
          builder: (context, _) {
            final themeProvider = Provider.of<ThemeProvider>(context);

            return GetMaterialApp(
              // routes: ,
              initialRoute: "/",
              title: 'UPES GO',
              // key: Get.key,
              color: themeProvider.mainColor,
              themeMode: themeProvider.themeMode,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              getPages: getPages,
              debugShowCheckedModeBanner: false,
            );
          });
}

class AuthGuardMiddleware extends GetMiddleware {
  // final provider = Provider.of<AuthProvider>(Get.context!);

  @override
  RouteSettings? redirect(String? route) {
    // Check if the user is authenticated (you need to implement your authentication logic)
    bool isLogged = true; // Implement this function

    if (isLogged) {
      // User is authenticated, allow access to the requested route
      return null;
    } else {
      // User is not authenticated, redirect to the login page
      return RouteSettings(name: RouteConstants.walkthough);
    }
  }
}
