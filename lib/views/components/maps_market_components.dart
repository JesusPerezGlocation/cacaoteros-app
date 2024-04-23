import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:iconly/iconly.dart';
import 'package:latlong2/latlong.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
mapa para la pantalla #4 de encuestas de visitas
*/
class MapMarketComponents extends StatefulWidget {
  final PermissionLocationProvider provider;
  const MapMarketComponents({super.key, required this.provider});

  @override
  State<MapMarketComponents> createState() => _MapMarketComponentsState();
}

class _MapMarketComponentsState extends State<MapMarketComponents> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return widget.provider.isLoadingMap
        ? const Center(child: LoadingMapsComponents())
        : Stack(
            children: [
              FlutterMap(
                mapController: widget.provider.mapController,
                options: MapOptions(
                  onTap: (tapPosition, point) async {
                    widget.provider.addMarkerPolygon(tapPosition, point);
                    await VibrationServices().vibrate();
                  },
                  initialCenter: LatLng(widget.provider.latitude ?? 0.0,
                      widget.provider.longitude ?? 0.0),
                  initialZoom: 18.0,
                  minZoom: 14,
                  maxZoom: 20,
                ),
                children: [
                  TileLayer(
                    errorImage: AssetImage(ImagesPaths.errorMaps),
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}",
                    additionalOptions: {
                      'accessToken': MapKeysPaths.mapBoxToken,
                      'id': MapKeysPaths.mapStyle,
                    },
                  ),
                  PolygonLayer(
                    drawLabelsLast: true,
                    polygons: [
                      Polygon(
                          borderColor: PaletteColorsTheme.whiteColor,
                          isFilled: true,
                          points: widget.provider.markers,
                          color: PaletteColorsTheme.whiteColor.withOpacity(0.3),
                          borderStrokeWidth: 7.0)
                    ],
                  ),
                  DragMarkers(
                    markers: [
                      DragMarker(
                        offset: const Offset(0.0, -8.0),
                        point: LatLng(widget.provider.latitude ?? 0.0,
                            widget.provider.longitude ?? 0.0),
                        onDragUpdate: (details, latLng) {},
                        size: size,
                        builder: (BuildContext context, pos, isDragging) =>
                            const Icon(IconlyBold.location,
                                size: 50,
                                color: PaletteColorsTheme.principalColor),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                left: size.width * .03,
                top: size.height * .5,
                right: size.width * .05,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    /*boton para posicionar al usuario*/
                    CircleAvatar(
                      backgroundColor: PaletteColorsTheme.whiteColor,
                      radius: 25,
                      child: IconButton(
                        onPressed: () async {
                          widget.provider.centerMapToCurrentPosition();
                          VibrationServices().vibrate();
                        },
                        icon: const Icon(IconlyLight.location),
                      ),
                    ),
                    SizedBox(height: size.height * .02),
                    /*boton para borrar los poligonos*/
                    CircleAvatar(
                      backgroundColor: PaletteColorsTheme.whiteColor,
                      radius: 25,
                      child: IconButton(
                        onPressed: () async {
                          widget.provider.clearMarkersAndPolygon();
                          VibrationServices().vibrate();
                        },
                        icon: const Icon(IconlyLight.delete),
                      ),
                    ),
                    /*boton para actualizar el mapa */
                    SizedBox(height: size.height * .02),
                    CircleAvatar(
                      backgroundColor: PaletteColorsTheme.whiteColor,
                      radius: 25,
                      child: IconButton(
                        onPressed: () async {
                          widget.provider.updateMap();
                          VibrationServices().vibrate();
                        },
                        icon: const Icon(Icons.replay_outlined),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
  }
}
