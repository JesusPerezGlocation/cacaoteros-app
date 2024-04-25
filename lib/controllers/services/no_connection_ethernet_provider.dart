import 'dart:async';
import 'dart:developer';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

enum NetworkStatus { online, offline }

class NoConnectionEthernetProvider with ChangeNotifier {
  StreamController<NetworkStatus> controller = StreamController();

  NoConnectionEthernetProvider() {
    Connectivity().onConnectivityChanged.listen((event) {
      controller.add(_networkStatus(event));
    });
  }

  NetworkStatus _networkStatus(ConnectivityResult result) {
    return result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi
        ? NetworkStatus.online
        : NetworkStatus.offline;
  }

  Future<void> getCheckConnection(BuildContext context) async {
    try {
      final checkEthernet = await Connectivity().checkConnectivity();

      if (checkEthernet == ConnectivityResult.none) {
        // ignore: use_build_context_synchronously
        return ConecctionModalEthernetWidget.showConecctionModal(context);
      }
    } catch (e) {
      log('check errors: $e');
    }
  }

  //*TIMEOUT PARA EL TIEMPO DE ENVIO*/
  bool _isSendingData = true;
  bool get isSendingData => _isSendingData;

  setisTimeoutSend(bool send) {
    _isSendingData = send; //setea el el bool para el timout de la petición
    notifyListeners();
  }
}
