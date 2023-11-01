import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upes_go/Shared/functions.dart';
import 'package:upes_go/Routes/router_config.dart';
import 'package:upes_go/Routes/route_const.dart';

class FirebaseDynamicLink {
  static FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  static Future<void> initDynamicLinks(BuildContext context) async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      final Uri uri = dynamicLinkData.link;
      final queryParams = uri.queryParameters;
      if (queryParams.isNotEmpty) {
        print("if case" + queryParams.toString());
        Map response = {"id": queryParams["id"]};
        Get.toNamed(dynamicLinkData.link.path, arguments: response);
        // String? productId = ;
        // Navigator.pushNamed(context, dynamicLinkData.link.path,
        //     arguments: {"productId": int.parse(productId!)});
      } else {
        // print();
        print("else case" + queryParams.toString());
        AppUtils.showSnackMessage("this happened");

        Get.toNamed(
          dynamicLinkData.link.path,
        );
      }
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }

  static Future<String> createDynamicLink(bool short, String link) async {
    // setState(() {
    //   _isCreatingLink = true;
    // });
    String _linkMessage;

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: kUriPrefix,
      link: Uri.parse(kUriPrefix + link),
      androidParameters: AndroidParameters(
        packageName: 'com.example.upes_go',
        minimumVersion: 125,
      ),
    );

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink = await dynamicLinks.buildShortLink(
        parameters,
      );
      url = shortLink.shortUrl;
    } else {
      url = await dynamicLinks.buildLink(parameters);
    }

    _linkMessage = url.toString();
    return _linkMessage;
  }
}

const String kUriPrefix = 'https://upesgo.page.link';
