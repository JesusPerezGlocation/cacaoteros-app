/*
tema para los botones
*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

class ButtonsMainTheme {
  /*tipo de fuente */
  static TextStyle typeFont = GoogleFonts.openSans();

  //: textos para el modo claro
  static ElevatedButtonThemeData elevatedButtonLight = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shadowColor: PaletteColorsTheme.principalColor.withOpacity(0.5),
          elevation: 20,
          textStyle: typeFont.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: PaletteColorsTheme.whiteColor),
          foregroundColor:
              PaletteColorsTheme.whiteColor, //color de las letras */
          backgroundColor:
              PaletteColorsTheme.principalColor, //color del boton */
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))));
  //
  static OutlinedButtonThemeData outlinedButtonLight = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: PaletteColorsTheme.blackColor,
      ),
      backgroundColor: PaletteColorsTheme.transparentColor,
      surfaceTintColor: PaletteColorsTheme.transparentColor,
      disabledBackgroundColor: PaletteColorsTheme.greyColor,
      disabledForegroundColor: PaletteColorsTheme.greyColor,
      elevation: 0,
      shadowColor: PaletteColorsTheme.transparentColor,
      side: const BorderSide(color: PaletteColorsTheme.greyColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
            color: PaletteColorsTheme.greyColor), // Color del borde
      ),
    ),
  );
  //
  static TextButtonThemeData textButtonLight = TextButtonThemeData(
      style: TextButton.styleFrom(
    shadowColor: PaletteColorsTheme.principalColor.withOpacity(0.5),
    elevation: 0,
    textStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: PaletteColorsTheme.whiteColor),
    foregroundColor: PaletteColorsTheme.principalColor,
  ));

  static IconButtonThemeData iconButtonLight = IconButtonThemeData(
      style: ButtonStyle(
    elevation: const MaterialStatePropertyAll(0),
    shadowColor: MaterialStatePropertyAll(
        PaletteColorsTheme.principalColor.withOpacity(0.5)),
    foregroundColor: const MaterialStatePropertyAll(
        PaletteColorsTheme.whiteColor), //color de las letras */

    iconSize: MaterialStateProperty.all(25),
    iconColor: MaterialStateProperty.all(PaletteColorsTheme.principalColor),
  ));
  //: textos para el modo oscuro

  static OutlinedButtonThemeData outlinedButtonDark = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    textStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: PaletteColorsTheme.whiteColor),
    backgroundColor: PaletteColorsTheme.transparentColor,
    surfaceTintColor: PaletteColorsTheme.transparentColor,
    disabledBackgroundColor: PaletteColorsTheme.greyColor,
    disabledForegroundColor: PaletteColorsTheme.greyColor,
    elevation: 0,
    shadowColor: PaletteColorsTheme.transparentColor,
    side: const BorderSide(color: PaletteColorsTheme.principalColor),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: const BorderSide(
          color: PaletteColorsTheme.principalColor), // Color del borde
    ),
  ));
  static ElevatedButtonThemeData elevatedButtonDark = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shadowColor: PaletteColorsTheme.transparentColor,
          textStyle: typeFont.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: PaletteColorsTheme.whiteColor),
          foregroundColor:
              PaletteColorsTheme.whiteColor, //color de las letras */
          backgroundColor:
              PaletteColorsTheme.principalColor, //color del boton */
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))));
  static TextButtonThemeData textButtonDark = TextButtonThemeData(
      style: TextButton.styleFrom(
    shadowColor: PaletteColorsTheme.transparentColor,
    textStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w300,
        color: PaletteColorsTheme.whiteColor),
    elevation: 0,
    foregroundColor: PaletteColorsTheme.whiteColor,
  ));
}
