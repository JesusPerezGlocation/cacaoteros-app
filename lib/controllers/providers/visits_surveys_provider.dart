// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';

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

  //*PANTALLA #3------*/
  final TextEditingController _nameFarm = TextEditingController();
  TextEditingController get nameFarm => _nameFarm;
  final TextEditingController _areaFarm = TextEditingController();
  TextEditingController get areaFarm => _areaFarm;

  setnameFarm(String val) {
    _nameFarm.text = val; // nombre de la finca
    notifyListeners();
  }

  setareaFarm(String val) {
    _areaFarm.text = val; //area de la finca
    notifyListeners();
  }

//*PANTALLA #4-------*/

  String _latLngString = '';
  final List<String> _listSendCoordinates = [];
  List<String> get listSendCoordinates => _listSendCoordinates;

  setCoordenates(LatLng coordinates) {
    _latLngString = '${coordinates.latitude}, ${coordinates.longitude}';
    _listSendCoordinates.add(_latLngString);

    /*verifica si hay al menos dos coordenadas en la lista */
    if (_listSendCoordinates.length >= 2) {
      /*erifica si el primer y el ultimo dato no coinciden */
      if (_listSendCoordinates.first != _listSendCoordinates.last) {
        /*agrega una copia del primer dato al final de la lista para que coincidan */
        _listSendCoordinates.add(_listSendCoordinates.first);
        notifyListeners();
      }
    }

    /*notifica a los oyentes después de completar la lista */
    notifyListeners();

    log('coordenadas lists: $_listSendCoordinates');
  }

//*PANTALLA #5-----*/
  final TextEditingController _objectiveVisit = TextEditingController();
  TextEditingController get objectiveVisit => _objectiveVisit;
  final TextEditingController _situationFound = TextEditingController();
  TextEditingController get situationFound => _situationFound;
  final TextEditingController _recomendations = TextEditingController();
  TextEditingController get recomendations => _recomendations;
  final TextEditingController _beneficiaryCommitment = TextEditingController();
  TextEditingController get beneficiaryCommitment => _beneficiaryCommitment;

  setobjectiveVisit(String val) {
    _objectiveVisit.text = val; // objetivo de la visita
    notifyListeners();
  }

  setsituationFound(String val) {
    _situationFound.text = val; // situación encontrada
    notifyListeners();
  }

  setrecomendations(String val) {
    _recomendations.text = val; //recomendación
    notifyListeners();
  }

  setbeneficiaryCommitment(String val) {
    _beneficiaryCommitment.text = val; //compromisos del beneficiario
    notifyListeners();
  }

//*PANTALLA #6------*/
  String _signatureBeneficiary = '';
  String get signatureBeneficiary => _signatureBeneficiary;
  String _signatureTecns = '';
  String get signatureTecns => _signatureTecns;

  setSignatureBeneficiary(String signature) {
    _signatureBeneficiary = signature; //set la firma del productor
    notifyListeners();
  }

  setSignatureTecns(String signature) {
    _signatureTecns = signature; //set la firma del tecnico
    notifyListeners();
  }

  deleteSignatureBeneficiary() {
    _signatureBeneficiary = ''; //elimina la firma del beneficiario
    notifyListeners();
  }

  deleteSignatureTecns() {
    _signatureTecns = ''; //elimina la firma del beneficiario
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

  //*PANTALLA #8*/

  final TextEditingController _placeExpeditions = TextEditingController();
  TextEditingController get placeExpeditions => _placeExpeditions;
  final TextEditingController _addresBeneficiary = TextEditingController();
  TextEditingController get addresBeneficiary => _addresBeneficiary;
  final TextEditingController _numberPhone = TextEditingController();
  TextEditingController get numberPhone => _numberPhone;
  String _signature = '';
  String get signature => _signature;
  bool _isAcceptsTerm = false;
  bool get isAcceptsTerm => _isAcceptsTerm;

  setplaceExpeditions(String val) {
    _placeExpeditions.text = val; //lugar de expdeción
    notifyListeners();
  }

  setaddresBeneficiary(String val) {
    _addresBeneficiary.text = val; // dirección del beneficario
    notifyListeners();
  }

  setnumberPhone(String val) {
    _numberPhone.text = val; // telefono del beneficiario
    notifyListeners();
  }

  setSignature(String signature) {
    _signature = signature; //set la firma
    notifyListeners();
  }

  setdeleteSignature() {
    _signature = ''; //elimina la firma del beneficiario
    notifyListeners();
  }

  setAcceptsTerm(bool val) {
    _isAcceptsTerm = val;
    notifyListeners();
  }

  /*limpia los campos de los proivider */
  cleanProvider() {
    _listImagesAdd.clear();
    _beneficiaryName.clear();
    _beneficiaryNumDoc.clear();
    _selectDepartment.clear();
    _codeDepartament.clear();
    _selectMunicipality.clear();
    _codeMunicipality.clear();
    _place.clear();
    _codePlace.clear();
    _nameFarm.clear();
    _areaFarm.clear();

    _latLngString = '';
    _listSendCoordinates.clear();

    _objectiveVisit.clear();
    _situationFound.clear();
    _situationFound.clear();
    _beneficiaryCommitment.clear();

    _signatureBeneficiary = '';
    _signatureTecns = '';

    _placeExpeditions.clear();
    _addresBeneficiary.clear();
    _numberPhone.clear();
    _signature = '';
    _isAcceptsTerm = false;

    notifyListeners();
  }
}
