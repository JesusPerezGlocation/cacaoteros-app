import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
/*
clase para los nombres de las categorias, en caso de que cambien solo cambiarla aqui y se cambiará global en la app
*/

class NameSurveys {
  static const String beneficiaries =
      'Caracterización de potenciales beneficiarios';
  static const String visits = 'Registro de visitas';
  static const String taskAdminist = 'Tareas administrativas';
  static const String caracterization = 'Caracterización de Cacaocultores';
  static const String collectionCenter = 'Caracterización de Centro de Acopio';
  static const String kardex = 'Kardex';
  static const String registerCocoa = 'Registro Calidad del Grano';

  static const Color beneficiariesColor = PaletteColorsTheme.principalColor;
  static const Color visitsColor = PaletteColorsTheme.principalColor;
  static const Color taskAdministColor = PaletteColorsTheme.principalColor;
  static const Color caracterizationColor = PaletteColorsTheme.secondaryColor;
  static const Color collectionCenterColor = PaletteColorsTheme.secondaryColor;
  static const Color kardexColor = PaletteColorsTheme.secondaryColor;
  static const Color registerCocoaColor = PaletteColorsTheme.secondaryColor;
}
