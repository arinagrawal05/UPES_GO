import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart' as firabase_storage;

class AppUtils {
  static String getFirstWord(String fullName) {
    List local = fullName.split(" ");
    return local[0];
  }

  // static String getStatsControllerTag() {
  //   ProductType type = Get.find<DashProvider>().currentDashBoard;

  //   // GeneralStatsProvider statsController =
  //   //     Get.find<GeneralStatsProvider>(tag: 'statsFor${type.name}');

  //   return 'statsFor${type.name}';
  // }

  static String formatAmount(int number) {
    final NumberFormat numberFormat = NumberFormat("#,##0", "en_US");
    return numberFormat.format(number);
  }

  static void showSnackMessage(String title) {
    final snackBar = SnackBar(
      content: Text(title),

      // action: SnackBarAction(
      //   label: 'Undo',
      //   onPressed: () {
      //     print("object");
      //    },
      // ),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);

    // Get.snackbar(title, subtitle,
    //     snackPosition: SnackPosition.BOTTOM,
    //     barBlur: 3,
    //     margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20));
  }

  static String dateTimetoText(DateTime dateTime) {
    // final format = DateFormat('E, MMM d, y, h:mm a z', 'en_US');
    // Define day and month names
    List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    // Extract date components
    int year = dateTime.year;
    int month = dateTime.month;
    int day = dateTime.day;
    int hour = dateTime.hour;
    int minute = dateTime.minute;
    String period = hour < 12 ? 'AM' : 'PM';

    // Adjust hour for PM format
    if (hour > 12) {
      hour -= 12;
    }

    // Get the day of the week and month
    String dayOfWeek = days[dateTime.weekday - 1];
    String monthName = months[month - 1];

    // Create the formatted string
    String formattedDateTime =
        '$dayOfWeek, $monthName $day, $year, $hour:${minute.toString().padLeft(2, '0')} $period IST';

    // int month = date.month < 10
    //     ? int.parse(date.month.toString().padLeft(2, "0"))
    //     : date.month;
    return formattedDateTime;
    // return format.format(date);
  }

  static String dateTimetoTime(DateTime dateTime) {
    int hour = dateTime.hour;
    int minute = dateTime.minute;
    String period = hour < 12 ? 'AM' : 'PM';

    // Adjust hour for PM format
    if (hour > 12) {
      hour -= 12;
    }

    // Create the formatted string
    String formattedDateTime =
        '$hour:${minute.toString().padLeft(2, '0')} $period IST';

    // int month = date.month < 10
    //     ? int.parse(date.month.toString().padLeft(2, "0"))
    //     : date.month;
    return formattedDateTime;
    // return format.format(date);
  }

  // static String todayTextFormat() {
  //   DateTime date = DateTime.now();
  //   int month = date.month;
  //   // < 10
  //   //     ? int.parse(date.month.toString().padLeft(2, "0"))
  //   //     : date.month;
  //   return "${date.day}/$month/${date.year}";
  // }

  static DateTime textToDateTime(String text) {
    List data = text.split("/");

    return DateTime(
      int.parse(data[2]),
      int.parse(data[1]),
      int.parse(data[0]),
    );
  }

  static Future<Future> navigate(
    Widget pagename,
    BuildContext context,
  ) async {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => pagename,
      ),
    );
  }

  static launchURL(String url) async {
    var link = Uri.parse(url);
    if (!await launchUrl(link)) {
      throw Exception('Could not launch $link');
    }
  }
}

String getRefCode(String a, String b) {
  if (a.length >= 4 && b.length >= 3) {
    String firstPart = a.substring(0, 4).toLowerCase();
    String secondPart = b.substring(b.length - 3);
    return firstPart + secondPart;
  } else {
    // Handle cases where the input strings are too short
    return "Input strings are too short.";
  }
}

void navigateslide(Widget page, BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

Future<String?>? uploadFileToFirebase(
    {required Uint8List imageFile, required String fileName}) async {
  String imageUrl = '';
  try {
    firabase_storage.UploadTask uploadTask;

    firabase_storage.Reference ref = firabase_storage.FirebaseStorage.instance
        .ref()
        .child('Products')
        .child(
            '/' + Timestamp.now().millisecondsSinceEpoch.toString() + fileName);

    final metadata =
        firabase_storage.SettableMetadata(contentType: 'image/jpeg');

    //uploadTask = ref.putFile(File(file.path));
    uploadTask = ref.putData(imageFile, metadata);

    await uploadTask.whenComplete(() => null);
    imageUrl = await ref.getDownloadURL();
  } catch (e) {
    print(e);
  }
  return imageUrl;
}

// void navigateslide(Widget routeName, BuildContext context,
//     {required Map<String, String> arg}) {
//   Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) =>
//               routeName));
//                // GoRouter.of(context).pushNamed(routeName, pathParameters: arg);
// }