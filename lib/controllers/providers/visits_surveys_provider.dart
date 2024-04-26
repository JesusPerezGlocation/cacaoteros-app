// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
provider para las encuestas de visitas
*/
class VisitsSurveysProvider extends ChangeNotifier {
/*instancia*/
  final CollectionReference databaseReference =
      FirebaseFirestore.instance.collection(ApiPaths.visitstesting);

  //*categoria de la encuenta y colores*/
  String _categorieSurveys = '';
  String get categorieSurveys => _categorieSurveys;

  setcategorieSurveys(String categorie) {
    _categorieSurveys = categorie; //setea la categoria de la encuesta
    notifyListeners();
  }

  //*TIMEOUT PARA EL TIEMPO DE ENVIO*/
  bool _isSendingData = false;
  bool get isSendingData => _isSendingData;

  setisTimeoutSend(bool send) {
    _isSendingData = send; //setea el el bool para el timout de la petición
    notifyListeners();
  }

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
  int _idSurveys = 0;
  int get idSurveys => _idSurveys;
  String _dateCreateSurvey = '';
  String get dateCreateSurvey => _dateCreateSurvey;

  String _metaInstanceUIID = '';
  String get metaInstanceUIID => _metaInstanceUIID;

  String _dateTimeSurveys = '';
  String get dateTimeSurveys => _dateTimeSurveys;

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

  setdateCreateSurvey(String time) {
    _dateCreateSurvey = time; //fecha de creación de la encuesta
    notifyListeners();
  }

  setdateTimeSurveys(String time) {
    _dateTimeSurveys =
        time; //fecha general de la encuesta, que se mira arriba de la primeera pantalla ej. day/month/year
    notifyListeners();
  }

  generateIDsurveys(int id) {
    _idSurveys = id; //genera un id para la encuesta
    notifyListeners();
  }

  setmetaInstanceUIID(String id) {
    _metaInstanceUIID = id; //id de la encuesta tipo uiid
    notifyListeners();
  }

  //*PANTALLA #3------*/
  final TextEditingController _nameFarm = TextEditingController();
  TextEditingController get nameFarm => _nameFarm;
  final TextEditingController _areaFarm = TextEditingController();
  TextEditingController get areaFarm => _areaFarm;
  final TextEditingController _areaCocoaFarm = TextEditingController();
  TextEditingController get areaCocoaFarm => _areaCocoaFarm;

  setnameFarm(String val) {
    _nameFarm.text = val; // nombre de la finca
    notifyListeners();
  }

  setareaFarm(String val) {
    _areaFarm.text = val; //area de la finca
    notifyListeners();
  }

  setareaCocoaFarm(String val) {
    _areaCocoaFarm.text = val; //area de cacao
    notifyListeners();
  }

//*PANTALLA #4-------*/

  String _latLngString = '';
  final List<String> _listSendCoordinates = [];
  List<String> get listSendCoordinates => _listSendCoordinates;

  String _latitude = '0.0';
  String _longitude = '0.0';
  String _accuracy = '0.0';
  String _altitude = '0.0';
  String get latitude => _latitude;
  String get longitude => _longitude;
  String get accuracy => _accuracy;
  String get altitude => _altitude;

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

  setLatAndLong(String lat, String long, String accuracy, String altitude) {
    _latitude = lat;
    _longitude = long;
    _altitude = altitude;
    _accuracy = accuracy;
    log('lat: $_latitude long: $_longitude, alt: $_altitude, acc: $_accuracy');
    notifyListeners();
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

  // sendSignatureApiBeneficiary() async {
  //   await SendImageApi().sendImageApi(
  //       _signatureBeneficiary, setSignatureBeneficiary(_signatureBeneficiary));
  //   notifyListeners();
  // }

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
      _selectImage = '';

      notifyListeners();
    } catch (e) {
      log('deleteOneImage $e');
    }
  }

  /*función para eliminar todas las imagenes */
  void deleteAllImage() {
    try {
      _selectImage = '';
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
        /*añade a la lista de imagenes*/
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

  String _selectImage = '';
  String get selectImage => _selectImage;

  setImageSelect(String image) {
    _selectImage = image; //selecciona la imagen
    notifyListeners();
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

  String _endSurveys = '';
  String get endSurveys => _endSurveys;

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

  setendDateSurveys(String end) async {
    _endSurveys = end; //guarda la fecha de finalización

    notifyListeners();
  }

  //*ENVIO DE DATOS A FIREBASE*/
  Future<void> sendDataVisitsFirebase(BuildContext context) async {
    try {
      databaseReference.add({
        /*PANTALLA #1*/
        "SubmitterName": 'iPhoneUser',
        "SubmitterID": _idSurveys,
        "start": _dateCreateSurvey,
        "ubicacionbeneficiariop4_beneficiario": _beneficiaryName.text,
        "ubicacionbeneficiariop5_cedula": _beneficiaryNumDoc.text,
        "ubicaciontecnicop3_fecha": _dateTimeSurveys,
        "metainstanceID": 'uuid:$_metaInstanceUIID',
        /*PANTALLA #2*/
        "ubicacionubicacion_fincap6_departamento": _selectDepartment.text,
        "ubicacionubicacion_fincap6_codigo_departamento": _codeDepartament.text,
        "ubicacionubicacion_fincap7_municipio": _selectMunicipality.text,
        "ubicacionubicacion_fincap7_codigo_municipio": _codeMunicipality.text,
        "ubicacionubicacion_fincap8_vereda": _place.text,
        "ubicacionubicacion_fincap8_codigo_vereda": _codePlace.text,

        /*PANTALLA #3*/
        "ubicacioninformacion_fincap_9_nombre_finca": _nameFarm.text,
        "ubicacioninformacion_fincap10_area_finca": _areaFarm.text,
        "ubicacioninformacion_fincap11_area_cacao": _areaCocoaFarm.text,

        /*PANTALLA #4*/
        "coordenadasp22_poligono": _latLngString,
        "startgeopointLatitude": _latitude,
        "startgeopointLongitude": _longitude,
        "startgeopointAccuracy": _accuracy,
        "startgeopointAltitude": _altitude,

        /*PANTALLA #5*/
        "situacion_actualvisitap14_objetivo_visita": _objectiveVisit.text,
        "situacion_actualvisitap13_descripcion_proyecto": _situationFound
            .text, //aqui pase la descripción x situacion encontrada
        "situacion_actualvisita_resultadop19_recomendaciones":
            _recomendations.text,
        "situacion_actualvisita_resultadop18_compromisos":
            _beneficiaryCommitment.text,

        /*PANTALLA #6*/
        "firmasp20_firma_agricultor": _signatureBeneficiary,
        "firmasp21_firma_tecnico": _signatureTecns,

        /*PANTALLA #7*/
        "registroregistro_fotograficop23_foto_registro": _selectImage,

        /*PANTALLA #8*/
        "datos_personalespdp_lugar": _placeExpeditions.text,
        "datos_personalespdp_direccion": _addresBeneficiary.text,
        "datos_personalespdp_telefono": _numberPhone.text,
        "datos_personalespdp_firma": _signature,
        "end": _endSurveys,

        /*DATOS VACIOS */
        "ubicacioninformacion_fincap_visita": '',
        "datos_personalespdp_fecha_nota": '',
        "datos_personalespdp_nota": '',
        "datos_personalespdp_nota3": '',
        "datos_personalespdp_nota4": '',
        "ubicaciontecniconota_inicial": '',
        "ubicaciontecnicop_fecha_nota": '',
      }).then((_) {
        /*si los datos se enviaron con exito*/

        notifyListeners();
        SnackBarGlobalWidget.showSnackBar(context, '¡Datos enviados con éxito!',
            Icons.check_circle_rounded, PaletteColorsTheme.principalColor);
      }).catchError((error) {
        /*si ocurre un error, muestra un mensaje de error */
        SnackBarGlobalWidget.showSnackBar(context, 'Error $error',
            Icons.error_outline_rounded, PaletteColorsTheme.redErrorColor);
      });
    } catch (e) {
      log('error:$e');
      notifyListeners();
      SnackBarGlobalWidget.showSnackBar(context, 'Error $e',
          Icons.error_outline_rounded, PaletteColorsTheme.redErrorColor);
    }
  }

  /*limpia los campos de los proivider */
  cleanProvider() {
    _listImagesAdd.clear();
    _selectImage = '';
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

    _idSurveys = 0;
    _dateCreateSurvey = '';
    _dateTimeSurveys = '';
    _metaInstanceUIID = '';

    _isSendingData = false;

    notifyListeners();
  }
}
