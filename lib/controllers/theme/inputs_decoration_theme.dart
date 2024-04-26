/*decoración y thema para el modo claro y oscuro*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

class InputDecorationMainTheme {
  /*tipo de fuente */
  static TextStyle typeFont = GoogleFonts.openSans();

  //: input modo claro
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 2),
    iconColor: PaletteColorsTheme.principalColor,
    fillColor: PaletteColorsTheme.whiteColor,
    prefixIconColor: PaletteColorsTheme.principalColor,
    suffixIconColor: PaletteColorsTheme.principalColor,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    floatingLabelStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: PaletteColorsTheme.principalColor),
    labelStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: PaletteColorsTheme.greyColorTwo),
    hintStyle: typeFont.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w200,
        color: PaletteColorsTheme.greyColorTwo),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
            color: PaletteColorsTheme.greyColorTwo, width: 1.0)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
            color: PaletteColorsTheme.greyColorTwo, width: 1.0)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
            color: PaletteColorsTheme.principalColor.withOpacity(0.4),
            width: 2.0)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
            color: PaletteColorsTheme.redErrorColor, width: 2.0)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
            color: PaletteColorsTheme.redErrorColor, width: 2.0)),
  );
  //: input modo oscuro
  static InputDecorationTheme inputDecorationDark = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 2),
    iconColor: PaletteColorsTheme.principalColor,
    prefixIconColor: PaletteColorsTheme.principalColor,
    suffixIconColor: PaletteColorsTheme.principalColor,
    fillColor: PaletteColorsTheme.blackColor,
    hintStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w300,
        color: PaletteColorsTheme.whiteColor),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:
            const BorderSide(color: PaletteColorsTheme.whiteColor, width: 1.0)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:
            const BorderSide(color: PaletteColorsTheme.whiteColor, width: 1.0)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
            color: PaletteColorsTheme.whiteColor.withOpacity(0.4), width: 2.0)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
            color: PaletteColorsTheme.redErrorColor, width: 2.0)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
            color: PaletteColorsTheme.redErrorColor, width: 2.0)),
  );
}
