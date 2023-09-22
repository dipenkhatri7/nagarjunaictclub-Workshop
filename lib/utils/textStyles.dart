import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(
    double fontSize, Color color, FontWeight fontWeight, double letterSpacing) {
  return GoogleFonts.urbanist(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
  );
}
