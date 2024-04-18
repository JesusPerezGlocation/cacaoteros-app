// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
provider para la solicitud de permisos de ubicación y obtener la latitud y longitud
*/
class PermissionLocationProvider extends ChangeNotifier {
  double? _latitude;
  double? _longitude;

  double? get latitude => _latitude;
  double? get longitude => _longitude;

  void setUpdateLocation(double? lat, double? long) {
    _latitude = lat;
    _longitude = long;
    notifyListeners();
    log('log and lont $_latitude $_longitude');
  }

/*future para solicitar los permisos de ubicación*/
  Future<void> getPermissionLocation(BuildContext context) async {
    try {
      final permissionStatus = await Permission.location.request();

      if (permissionStatus.isGranted) {
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        setUpdateLocation(position.latitude, position.longitude);

        notifyListeners();
      } else {
        return ShowModalLocation.showModalLocation(context);
      }
    } catch (e) {
      log('Error al solicitar permisos: $e');
      return SnackBarGlobalWidget.showSnackBar(
        context,
        'Lo sentimos, hubo un error al obtener la ubicación',
        Icons.error_outline,
        PaletteColorsTheme.redErrorColor,
      );
    }
  }

  /*obtener ubicación del usuario*/
  getLocationUser() async {
    try {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      _latitude = position.latitude;
      _longitude = position.longitude;
      notifyListeners();
    } catch (e) {
      log('error location: $e');
    }
  }
}
