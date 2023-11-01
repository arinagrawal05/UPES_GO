// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:ionicons/ionicons.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:upes_go/Event/events_banner_page.dart';
import 'package:upes_go/Shared/colors.dart';
import 'package:upes_go/Shared/functions.dart';
import 'package:upes_go/Shared/style.dart';
import '../models/place_model.dart';

class CampusMap extends StatefulWidget {
  @override
  _CampusMapState createState() => _CampusMapState();
}

class _CampusMapState extends State<CampusMap> {
  LatLngBounds bounds = LatLngBounds(
      latLng.LatLng(30.421368284841222, 77.96181697294233),
      latLng.LatLng(30.41397303770807, 77.9788281939994));
  latLng.LatLng initialPoint =
      latLng.LatLng(30.4172667653929, 77.96818608047379);
  String templateURL = 'https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: 410,
          child: FlutterMap(
            options: MapOptions(
                maxBounds: bounds,
                bounds: bounds,
                initialCenter: initialPoint,
                initialZoom: 17.5),
            children: [
              TileLayer(
                urlTemplate: templateURL,
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              )),
          margin: EdgeInsets.only(top: 380),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: PlaceModel.places.length,
                    itemBuilder: (context, index) {
                      return locationTile(PlaceModel.places[index]);
                    })
                // locationTile(places[0]),
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget locationTile(PlaceModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GestureDetector(
              onTap: () {
                navigateslide(
                    FullScreenBannerPage(
                        bannerUrl: model.imageUrl, name: model.name),
                    context);
              },
              child: Container(
                  height: 60,
                  width: 60,
                  child: Image.network(
                    model.imageUrl,
                    fit: BoxFit.cover,
                  )),
            )),
        title: heading(model.name, 18),
        subtitle: heading1(model.info, 12),
        trailing: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () {
                AppUtils.launchURL(
                    "https://maps.google.com/?q=${model.point.latitude},${model.point.longitude}");
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Ionicons.navigate_circle,
                  color: ColorPalatte.primaryColor,
                  size: 32,
                ),
              )),
        ),
      ),
    );
  }
  // onTap: () {
  //   _launchURL(
  //       "https://www.instagram.com/kitchenkart_app/");
  // },
}
