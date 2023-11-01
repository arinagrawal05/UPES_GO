import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget heading(String text, double fontSize,
    {Color? color, bool center = false}) {
  return Text(text,
      textAlign: center ? TextAlign.center : null,
      style: GoogleFonts.montserrat(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none,
      ));
}

// TextStyle fontStyle(double fontSize) {
//   return );
// }

Widget heading1(String text, double fontSize,
    {TextOverflow overF = TextOverflow.ellipsis,
    bool center = false,
    Color? color}) {
  return Text(
    text,
    maxLines: 2,
    style: GoogleFonts.nunito(
        color: color ?? Colors.grey,
        fontSize: fontSize,
        fontWeight: FontWeight.w500),
    overflow: overF,
    textAlign: center ? TextAlign.center : TextAlign.justify,
  );
}

Widget productTileText(String text, double fontSize,
    {TextOverflow overF = TextOverflow.ellipsis,
    bool center = false,
    Color? color}) {
  return Text(
    text,
    softWrap: true,
    overflow: overF,
    textAlign: center ? TextAlign.center : TextAlign.justify,
    style: GoogleFonts.nunito(
        fontSize: fontSize, fontWeight: FontWeight.w500, color: color),
  );
}

Widget simpleText(String text, double fontSize,
    {TextAlign align = TextAlign.left}) {
  return Text(
    text,
    textAlign: align,
    style: GoogleFonts.nunito(
      fontSize: fontSize,
    ),
  );
}

BoxDecoration dashbox(BuildContext context) {
  return BoxDecoration(
    color: Theme.of(context).canvasColor,
    borderRadius: BorderRadius.circular(12),
  );
}
