import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:latlong2/latlong.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
mapa para la pantalla #4 de encuestas de visitas
*/
class MapMarketComponents extends StatelessWidget {
  final PermissionLocationProvider provider;
  const MapMarketComponents({super.key, required this.provider});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FlutterMap(
      options: MapOptions(
        initialCenter:
            LatLng(provider.latitude ?? 0.0, provider.longitude ?? 0.0),
        initialZoom: 18.0,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        ),
        DragMarkers(
          markers: [
            DragMarker(
              offset: const Offset(0.0, -8.0),
              point:
                  LatLng(provider.latitude ?? 0.0, provider.longitude ?? 0.0),
              onDragUpdate: (details, latLng) {},
              size: size,
              builder: (BuildContext context, pos, isDragging) =>
                  const Icon(Icons.location_on, size: 50),
            ),
          ],
        ),
      ],
    );
  }
}
