// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
provider para la solicitud de permisos de ubicación y obtener la latitud y longitud
*/
class PermissionLocationProvider extends ChangeNotifier {
  double? _latitude;
  double? _longitude;
  double? _accuracy;
  double? _altitude;

  double? get latitude => _latitude;
  double? get longitude => _longitude;
  double? get accuracy => _accuracy;
  double? get altitude => _altitude;

  void setUpdateLocation(
      double? lat, double? long, double? accu, double? alti) {
    _latitude = lat;
    _longitude = long;
    _accuracy = accu;
    _altitude = alti;
    notifyListeners();
  }

/*future para solicitar los permisos de ubicación*/
  Future<void> getPermissionLocation(BuildContext context) async {
    try {
      final permissionStatus = await Permission.location.request();

      if (permissionStatus.isGranted) {
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        setUpdateLocation(position.latitude, position.longitude,
            position.accuracy, position.altitude);

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

  /*para el mapa de la encuesta de visitas*/
  final List<LatLng> _markers = [];
  List<LatLng> get markers => _markers;

  // bool _isPolygonClosed = false;

  final MapController _mapController = MapController();
  MapController get mapController => _mapController;

  /*añade posiciones al mapa  */
  void addMarkerPolygon(TapPosition tap, LatLng point) {
    _markers.add(point);

    // /*verifica si se han agregado al menos dos coordenadas y si el polígono aún no está cerrado */
    // if (_markers.length > 1 && !_isPolygonClosed) {
    //   /*cierra el polígono agregando una copia de la primera coordenada al final de la lista */
    //   _markers.add(_markers.first);
    //   /*marca el polígono como cerrado */
    //   _isPolygonClosed = true;
    // }

    notifyListeners();
  }

  void listMarket(List<LatLng> latLong) {
    // _markers = latLong;
    latLong.add(LatLng(_latitude ?? 0.0, _longitude ?? 0.0));
    notifyListeners();
  }

  /*función para centrar el mapa en la posición actual del usuario */
  void centerMapToCurrentPosition() {
    _mapController.move(
      LatLng(_latitude ?? 0.0, _longitude ?? 0.0),
      18.0,
    );
    notifyListeners();
  }

  /*función para borrar los marcadores y el polígono dibujado */
  void clearMarkersAndPolygon() {
    _markers.clear();
    _selectedCoordinates.clear();
    // _isPolygonClosed = false;
    notifyListeners();
  }

  bool _isLoadingMap = true;
  bool get isLoadingMap => _isLoadingMap;

  /*función para actualizar el mapa */
  void reloadMapUpdate() {
    _isLoadingMap = true;
    Future.delayed(const Duration(seconds: 1), () {
      _isLoadingMap = false;
      /*limpia lo dibujado*/
      _markers.clear();
      /*limpia la lista de coordenadas*/
      _selectedCoordinates.clear();

      notifyListeners();
    });
    notifyListeners(); // Notificar a los widgets escuchando los cambios en el provider
  }

  /*coordeanadas dibujadas en el poligono*/
  final List<LatLng> _selectedCoordinates = [];
  List<LatLng> get selectedCoordinates => _selectedCoordinates;

  /*función para añadir coordenadas seleccionadas a la lista */
  void addSelectedCoordinate(LatLng coordinate) {
    _selectedCoordinates.add(coordinate);

    /*verifica si hay al menos dos coordenadas en la lista */
    if (_selectedCoordinates.length >= 2) {
      /*gerifica si el primer y el último dato no coinciden */
      if (_selectedCoordinates.first != _selectedCoordinates.last) {
        /*agregaa una copia del primer dato al final de la lista para que coincidan */
        _selectedCoordinates.add(_selectedCoordinates.first);
      }
    }

    notifyListeners();
    // _selectedCoordinates.add(coordinate);
    // notifyListeners();
  }
}
