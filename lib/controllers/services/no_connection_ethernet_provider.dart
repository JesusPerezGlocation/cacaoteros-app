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
        ConecctionModalEthernetWidget.showConecctionModal(context);
      }
    } catch (e) {
      log('check errors: $e');
    }
  }
}
