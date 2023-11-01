import 'package:latlong2/latlong.dart' as latLng;

class PlaceModel {
  // String title, String subtitle, String url,
  String name, info, imageUrl;
  latLng.LatLng point;
  PlaceModel({
    required this.name,
    required this.info,
    required this.imageUrl,
    required this.point,
  });
  static List<PlaceModel> places = [
    PlaceModel(
        name: "Gandhi Chouk",
        info: "UPES Center",
        imageUrl: "https://pbs.twimg.com/media/EBlgbWqU4AA_bNX.jpg:large",
        point: latLng.LatLng(30.4172667653929, 77.96818608047379)),
    PlaceModel(
        name: "Library",
        info: "Reading Hall",
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/commons/5/56/Lib_upes.jpg",
        point: latLng.LatLng(30.41755624713586, 77.96766378465789)),
    PlaceModel(
        name: "Football Ground",
        info: "Sports",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipNC3edEKm85kCGHoRWs24Uhk9J9eGbR57Kg1wje=w408-h306-k-no",
        point: latLng.LatLng(30.418638737249978, 77.96836115896717)),
    PlaceModel(
        name: "Basketball Court",
        info: "Sports",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipMKQQWZdKtAszkC1qs60FxiC9_JgoKJWMFi0_47=w408-h544-k-no",
        point: latLng.LatLng(30.4172667653929, 77.96818608047379)),
    PlaceModel(
        name: "Girls Hostel",
        info: "Residence",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipMNufnnfrFUHPAerE1eg-NqWRT9UBjFvEwFOLq_=w426-h240-k-no",
        point: latLng.LatLng(30.4176454411844, 77.97094902566805)),
    PlaceModel(
        name: "MDC Guest House",
        info: "Residence",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipM34oZmRX0UYCH6qxQi8BOyf4p_uzNASX5bJAHg=w408-h306-k-no",
        point: latLng.LatLng(30.41844271834587, 77.96912366068658)),
    PlaceModel(
        name: "UPES Rock Museum",
        info: "Place",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipNC0liGlMQShsxQDgl3TVasPyXV0v2TstOSztv9=w408-h306-k-no",
        point: latLng.LatLng(30.417806524950542, 77.96901453409485)),
    PlaceModel(
        name: "The Barons",
        info: "Restaurant",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipPgCSY6C9nOV3-6QuA3tQ0d8CCL_i6jA0arCpKL=w203-h270-k-no",
        point: latLng.LatLng(30.41752868723325, 77.967287365039)),
    PlaceModel(
        name: "School Of Design",
        info: "Academic Block",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipNpG6PJsYZamXyXwa0NqaIuSAFL4K0qEoMMgXk0=w203-h152-k-no",
        point: latLng.LatLng(30.417156126766063, 77.96839583961446)),
    PlaceModel(
        name: "Container House",
        info: "Place",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipNw_TOi2BSoGoaEechyADPiWVS-0Rq1KIiXbBc=w408-h306-k-no",
        point: latLng.LatLng(30.41726479976891, 77.96923908585852)),
    PlaceModel(
        name: "MAC",
        info: "Activity Hall",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipP23lMjneph_frmbSm-F6iMIv_ExD_Zmzuhj9HV=w408-h302-k-no",
        point: latLng.LatLng(30.416993540863686, 77.96661760165064)),
    PlaceModel(
        name: "Old Amphitheatre",
        info: "Place",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipN2eE2z9Ynr59n-x6GmgXuA4BAXkcgz9VSi-C76=w408-h306-k-no",
        point: latLng.LatLng(30.416731147446335, 77.96679404171391)),
    PlaceModel(
        name: "Tulips Cafe",
        info: "Restaurant",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipOeD3pHHN9VanwAn0SKhRbQyrPnanZRS2GzpRd6=w203-h152-k-no",
        point: latLng.LatLng(30.416381415215923, 77.96953028385663)),
    PlaceModel(
        name: "Boys Hostel",
        info: "Residence",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipOhZPhYC571QQ5-tDFRX2es-MElO67GUvg-s87W=w426-h240-k-no",
        point: latLng.LatLng(30.41659672335105, 77.96974471992667)),
    PlaceModel(
        name: "Frisco",
        info: "Restaurant",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipO4tQ0xYKqHOQ6i5tkS2Z1O6bfeBzOlD7lGWkPc=w426-h240-k-no",
        point: latLng.LatLng(30.41619289067159, 77.96812033964879)),
    PlaceModel(
        name: "Infirmary",
        info: "Medical",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipNZ0biE4BrumciwyF9ZuJjpJwTqUBh35NpIlDJi=w426-h240-k-no",
        point: latLng.LatLng(30.416020952252424, 77.96784020932628)),
    PlaceModel(
        name: "Chai Garam",
        info: "Restaurant",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipPn9oS1WhSAdIHSfSSORJ9yrdDNDMm6j_W5q7Ik=w408-h544-k-no",
        point: latLng.LatLng(30.416363591110017, 77.96761096046876)),
    PlaceModel(
        name: "New Amphitheatre",
        info: "Place",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipPL1A2pcTZILsX41M0ZLFWuTp7J0PezvTekFZN7=w408-h306-k-no",
        point: latLng.LatLng(30.416292220469064, 77.96839118528675)),
    PlaceModel(
        name: "Food Court",
        info: "Restaurant",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipO6Fv1o0HKbO-nGqf5GA095NDFtv1kDySJ72k1Y=w203-h270-k-no",
        point: latLng.LatLng(30.415741389513624, 77.96770719086568)),
    PlaceModel(
        name: "Gym",
        info: "Fitness",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipNIbM16v9kqA3PNF6juug7koFUrXP-4WAEyWiWQ=w408-h306-k-no",
        point: latLng.LatLng(30.416983811331022, 77.96661398071751)),
    PlaceModel(
        name: "Rig Zone",
        info: "Place",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipNyS-VSdtlfgo9AFqlQoREicEkfSAkVqNWjTIug=w408-h306-k-no",
        point: latLng.LatLng(30.416258187056897, 77.97042468740355)),
    PlaceModel(
        name: "Hubble",
        info: "Energy House",
        imageUrl:
            "https://lh5.googleusercontent.com/p/AF1QipM_4jaLm_LxY-kBMeC2rseLBuLydAselwkE8HA=w408-h305-k-no",
        point: latLng.LatLng(30.41681031776578, 77.9668220721207)),
    // PlaceModel(
    //     name: "Rig Zone",
    //     info: "Gandhi Chouk",
    //     imageUrl:
    //         "https://lh5.googleusercontent.com/p/AF1QipNyS-VSdtlfgo9AFqlQoREicEkfSAkVqNWjTIug=w408-h306-k-no",
    //     point: latLng.LatLng(30.416258187056897, 77.97042468740355)),
  ];
}
