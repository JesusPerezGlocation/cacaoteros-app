import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:surveys_app/controllers/exports/exports.dart';

/*
clase para enviar la imagen la base de datos y que retorne una imagen con dominio
*/
class SendImageApi extends ChangeNotifier {
  String _image = '';
  String get image => _image;
  /*resultado de la imagen */
  dynamic _downloadUrl;
  dynamic get downloadUrl => _downloadUrl;

  setSignature(String signature) {
    _image = signature;
    notifyListeners();
  }

  /*envia la firma a la base de datos*/
  Future sendSignatureImageApi() async {
    try {
      final url = Uri.https(ApiPaths.apiUrl, ApiPathsEndpoint.image);
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'image': _image,
        },
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = json.decode(response.body);
        /*captura la respuesta */
        _downloadUrl = data['downloadUrl'];
        /*settea la imagen*/
        setSignature(downloadUrl);

        log('sendImageApi imagen url retornada $downloadUrl');
        notifyListeners();
      }
    } catch (e) {
      log('$e');
    }
  }

  //*ENVIA LA IMAGEN TOMADO POR EL USUARIO*/
  String _selectImage = '';
  String get selectImage => _selectImage;

  setSelectImage(String image) {
    _selectImage = image; //setea la imagen seleccionada
    notifyListeners();
  }

  /*envia la imagen a la api*/
  Future sendImageApi() async {
    try {
      /*transforma la imagen a String */

      final url = Uri.https(ApiPaths.apiUrl, ApiPathsEndpoint.image);
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'image': _selectImage,
        },
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = json.decode(response.body);
        /*captura la respuesta */
        _downloadUrl = data['downloadUrl'];
        /*settea la imagen*/
        setSelectImage(downloadUrl);

        log('sendImageApi imagen url retornada $downloadUrl');
        notifyListeners();
      }
    } catch (e) {
      log('$e');
    }
  }

  clearProvider() {
    _image = '';
    _downloadUrl = '';
    _selectImage = '';
    notifyListeners();
  }
}
