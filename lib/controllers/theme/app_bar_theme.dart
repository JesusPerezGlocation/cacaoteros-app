import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
tema para manejar el appbar de la aplicación
*/
class AppBarMainTheme {
  /*tipo de fuente */
  static TextStyle typeFont = GoogleFonts.openSans();
  //: modo claro
  static AppBarTheme appbarLight = AppBarTheme(
    iconTheme:
        const IconThemeData(color: PaletteColorsTheme.principalColor, size: 25),
    actionsIconTheme:
        const IconThemeData(color: PaletteColorsTheme.principalColor, size: 25),
    color: PaletteColorsTheme.transparentColor,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: PaletteColorsTheme.principalColor),
  );
  //: modo oscuro
  static AppBarTheme appbarDark = AppBarTheme(
    iconTheme:
        const IconThemeData(color: PaletteColorsTheme.principalColor, size: 25),
    actionsIconTheme:
        const IconThemeData(color: PaletteColorsTheme.principalColor, size: 25),
    color: PaletteColorsTheme.transparentColor,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: PaletteColorsTheme.whiteColor),
  );
}
