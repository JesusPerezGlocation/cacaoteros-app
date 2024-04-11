
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
/*
clase para manejar los tipos de fuentes del tema oscuro o claro 
*/

class FontsTypeTheme {
  /*tipo de fuente */
  static TextStyle typeFont = GoogleFonts.inter();
  
  /*tipos de textos a usar modo claro*/
  static TextTheme lightThemeFont = TextTheme(
  displayLarge: typeFont.copyWith(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: PaletteColorsTheme.blackColor,
   ),  
   displayMedium: typeFont.copyWith( 
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: PaletteColorsTheme.blackColor,
  ),

  displaySmall: typeFont.copyWith( 
        fontSize: 20,
        fontWeight: FontWeight.w300,
        color: PaletteColorsTheme.blackColor,
  ),
   headlineLarge: typeFont.copyWith( 
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: PaletteColorsTheme.blackColor,
  ),
  headlineMedium: typeFont.copyWith( 
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: PaletteColorsTheme.blackColor,
  ),
  headlineSmall: typeFont.copyWith( 
        fontSize: 12,
        fontWeight: FontWeight.w200,
        color: PaletteColorsTheme.blackColor,
  ),
  titleLarge: typeFont.copyWith( 
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: PaletteColorsTheme.principalColor,
  ),
   titleMedium: typeFont.copyWith( 
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: PaletteColorsTheme.blackColor,
  ),
   titleSmall: typeFont.copyWith( 
        fontSize: 10,
        fontWeight: FontWeight.w300,
        color: PaletteColorsTheme.blackColor,
  ),

  bodyLarge: typeFont.copyWith( 
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: PaletteColorsTheme.blackColor,
  ),
   bodyMedium: typeFont.copyWith( 
        fontSize: 12,
        fontWeight: FontWeight.w300,
        color: PaletteColorsTheme.blackColor,
  ),
   bodySmall: typeFont.copyWith( 
        fontSize: 10,
        fontWeight: FontWeight.w100,
        color: PaletteColorsTheme.blackColor,
  ),
      labelLarge: typeFont.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: PaletteColorsTheme.greyColor,
  ),
    labelMedium: typeFont.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w200,
        color: PaletteColorsTheme.greyColor,
  ),
    labelSmall: typeFont.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w100,
        color: PaletteColorsTheme.greyColor,
  ),
  );
  /*tipos de textos a usar modo oscuro*/
  static TextTheme dartThemeFont = TextTheme(
      displayLarge: typeFont.copyWith(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: PaletteColorsTheme.whiteColor,
   ),  
   displayMedium: typeFont.copyWith( 
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: PaletteColorsTheme.whiteColor,
  ),

  displaySmall: typeFont.copyWith( 
        fontSize: 20,
        fontWeight: FontWeight.w300,
        color: PaletteColorsTheme.whiteColor,
  ),
   headlineLarge: typeFont.copyWith( 
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: PaletteColorsTheme.whiteColor,
  ),
  headlineMedium: typeFont.copyWith( 
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: PaletteColorsTheme.whiteColor,
  ),
  headlineSmall: typeFont.copyWith( 
        fontSize: 12,
        fontWeight: FontWeight.w200,
        color: PaletteColorsTheme.whiteColor,
  ),
    titleLarge: typeFont.copyWith( 
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: PaletteColorsTheme.principalColor,
  ),
  
   titleMedium: typeFont.copyWith( 
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: PaletteColorsTheme.whiteColor,
  ),
   titleSmall: typeFont.copyWith( 
        fontSize: 10,
        fontWeight: FontWeight.w300,
        color: PaletteColorsTheme.whiteColor,
  ),

  bodyLarge: typeFont.copyWith( 
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: PaletteColorsTheme.whiteColor,
  ),
   bodyMedium: typeFont.copyWith( 
        fontSize: 12,
        fontWeight: FontWeight.w300,
        color: PaletteColorsTheme.whiteColor,
  ),
   bodySmall: typeFont.copyWith( 
        fontSize: 10,
        fontWeight: FontWeight.w100,
        color: PaletteColorsTheme.whiteColor,
  ),
      labelLarge: typeFont.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: PaletteColorsTheme.greyColor,
  ),
    labelMedium: typeFont.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w200,
        color: PaletteColorsTheme.greyColor,
  ),
    labelSmall: typeFont.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w100,
        color: PaletteColorsTheme.greyColor,
  ),
  );
 
}