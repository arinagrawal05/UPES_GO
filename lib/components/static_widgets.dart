import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Shared/style.dart';

Widget noDataWidget({double sizee = 400}) {
  double size = sizee;
  return Center(
    child: Container(
      height: size,
      width: size,
      child: Lottie.asset("assets/lotties/nodata_lotties.json"),
    ),
  );
}

Widget customCircularLoader(String term) {
  return Center(
    child: Column(
      children: [
        CircularProgressIndicator(
          strokeWidth: 1,
          backgroundColor: Colors.grey,
          color: Colors.grey.withOpacity(0.5),
        ),
        const SizedBox(
          height: 10,
        ),
        simpleText("Loading $term", 15)
      ],
    ),
  );
}
