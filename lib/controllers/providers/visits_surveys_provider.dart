import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/*
provider para las encuestas de visitas
*/
class VisitsSurveysProvider extends ChangeNotifier {
//*PANTALLA #7-----*/
  final List<String> _listImagesAdd = [];
  List<String> get listImagesAdd => _listImagesAdd;

  /*añade a la lista de imagenes*/
  addListImagesData(Uint8List imageBytes) {
    notifyListeners();
    try {
      /*Ajusta maxWidth, maxHeight y quality*/
      final compressedImageBytes = compressImage(imageBytes, 800, 800, 360);

      String base64String = base64Encode(compressedImageBytes);
      if (_listImagesAdd.isEmpty) {
        _listImagesAdd.add(base64String);
        notifyListeners();
      }
      notifyListeners();
    } catch (e) {
      log('error en add imagen $e');
    }
  }

  /*función para realizar la compresión de los datos*/
  Uint8List compressImage(
      Uint8List imageBytes, int maxWidth, int maxHeight, int quality) {
    final image = img.decodeImage(imageBytes)!;

    /*Elimina datos EXIF (metadatos de la imagen) */
    image.exif.clear();

    /*Redimensiona la imagen a un nuevo tamaño */
    final resizedImage =
        img.copyResize(image, width: maxWidth, height: maxHeight);

    return img.encodeJpg(resizedImage, quality: quality);
  }

  /*eliminar una imagenes*/
  void deleteOneImage(String image) {
    try {
      _listImagesAdd.remove(image);
      notifyListeners();
    } catch (e) {
      log('deleteOneImage $e');
    }
  }

  /*función para eliminar todas las imagenes */
  void deleteAllImage() {
    try {
      _listImagesAdd.clear();
      notifyListeners();
    } catch (e) {
      log('deleteAllImage $e');
    }
  }

  /*estado inicial del provider */
  void setStatusProvider() {
    _listImagesAdd.clear();
    notifyListeners();
  }

/*abre la camara del usuario*/
  Future dataPickerImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        File fileImage = File(image.path);
        final Uint8List imageBytes = await fileImage.readAsBytes();
        addListImagesData(imageBytes);
        notifyListeners();
      }
    } catch (e) {
      log('dataPickerImage $e');
    }
  }
}
