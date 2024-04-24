// ignore_for_file: use_build_context_synchronously

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
//*PANTALLA #1------*/

  final TextEditingController _beneficiaryName = TextEditingController();
  TextEditingController get beneficiaryName => _beneficiaryName;
  final TextEditingController _beneficiaryNumDoc = TextEditingController();
  TextEditingController get beneficiaryNumDoc => _beneficiaryNumDoc;
  final TextEditingController _selectDepartment = TextEditingController();
  TextEditingController get selectDepartment => _selectDepartment;
  final TextEditingController _codeDepartament = TextEditingController();
  TextEditingController get codeDepartament => _codeDepartament;
  final TextEditingController _selectMunicipality = TextEditingController();
  TextEditingController get selectMunicipality => _selectMunicipality;
  final TextEditingController _codeMunicipality = TextEditingController();
  TextEditingController get codeMunicipality => _codeMunicipality;
  final TextEditingController _place = TextEditingController(); //vereda
  TextEditingController get place => _place;

  final TextEditingController _codePlace =
      TextEditingController(); //codigo vereda
  TextEditingController get codePlace => _codePlace;

  setBeneficiaryName(String val) {
    _beneficiaryName.text = val; // nombre del beneficiario
    notifyListeners();
  }

  setbeneficiaryNumDoc(String val) {
    _beneficiaryNumDoc.text = val; // número de documento del beneficiario
    notifyListeners();
  }

  setselectDepartment(String val) {
    _selectDepartment.text = val; //seleccionar departamentos
    notifyListeners();
  }

  setCodeDepartament(String val) {
    _codeDepartament.text = val; //codigo del departamento

    notifyListeners();
  }

  setselectMunicipality(String val) {
    _selectMunicipality.text = val; //seleccionar municipio
    notifyListeners();
  }

  setCodeMunicipality(String val) {
    _codeMunicipality.text = val; //codigo del municipio
    notifyListeners();
  }

  setPlace(String date) {
    _place.text = date; //vereda
    notifyListeners();
  }

  setCodePlace(String val) {
    _codePlace.text = val;
    notifyListeners();
  }

//*PANTALLA #7-----*/
  final List<String> _listImagesAdd = [];
  List<String> get listImagesAdd => _listImagesAdd;

  /*añade a la lista de imagenes*/
  addListImagesData(Uint8List imageBytes) {
    try {
      final compressedImageBytes = compressImage(imageBytes, 800, 800, 360);
      String base64String = base64Encode(compressedImageBytes);
      _listImagesAdd
          .add(base64String); // Agrega la imagen sin verificar si está vacía
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
  void deleteOneImage(Uint8List imageBytes) {
    try {
      final base64Image = base64Encode(imageBytes);

      _listImagesAdd.remove(base64Image);

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
      notifyListeners();
    } catch (e) {
      log('dataPickerImage $e');
    }
  }

  /*abre la galaria*/
  Future dataPickerGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image != null) {
        File fileImage = File(image.path);

        final Uint8List imageBytes = await fileImage.readAsBytes();

        addListImagesData(imageBytes);

        notifyListeners();
      }
      notifyListeners();
    } catch (e) {
      log('dataPickerImage $e');
    }
  }

  /*limpia los campos de los proivider */
  cleanProvider() {
    _listImagesAdd.clear();
    _beneficiaryName.clear();
    _beneficiaryNumDoc.clear();
    _selectDepartment.clear();
    _selectMunicipality.clear();
    notifyListeners();
  }
}
