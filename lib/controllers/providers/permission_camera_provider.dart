// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
provider para gestionar los permisos de camera o galeria
*/
class CameraPermissionProvider extends ChangeNotifier {
  /*estado de los permisos*/
  PermissionStatus? _cameraPermissionStatus;
  PermissionStatus? _galleryPermissionStatus;
  PermissionStatus? get cameraPermissionStatus => _cameraPermissionStatus;
  PermissionStatus? get galleryPermissionStatus => _galleryPermissionStatus;

  /*metodo para solicitar permiso de cámara */
  Future<void> requestCameraPermission(BuildContext context) async {
    // await Permission.camera.request();
    final status = await Permission.camera.request();

    if (status.isDenied) {
      return ShowModalPermissionGalleryWidget.showNoPermission(context);
    } else {
      _galleryPermissionStatus = status;
      notifyListeners();
    }
  }

  // Método para solicitar permiso de galería
  Future<void> requestGalleryPermission(BuildContext context) async {
    final status = await Permission.photos.request();

    if (status.isDenied) {
      return ShowModalPermissionGalleryWidget.showNoPermission(context);
    } else {
      _galleryPermissionStatus = status;
      notifyListeners();
    }

    log(_galleryPermissionStatus.toString());
  }
}
