import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:flutter_map_mbtiles/flutter_map_mbtiles.dart';
import 'package:iconly/iconly.dart';
import 'package:latlong2/latlong.dart';
import 'package:mbtiles/mbtiles.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/services/maps/utils.dart';

/*
mapa para la pantalla #4 de encuestas de visitas
*/
class MapMarketComponents extends StatefulWidget {
  final PermissionLocationProvider provider;
  final VisitsSurveysProvider visitsPrv;
  const MapMarketComponents({
    super.key,
    required this.provider,
    required this.visitsPrv,
  });

  @override
  State<MapMarketComponents> createState() => _MapMarketComponentsState();
}

class _MapMarketComponentsState extends State<MapMarketComponents> {
  final Future<MbTiles> _futureMbtiles = _initMbtiles();
  MbTiles? _mbtiles;

  static Future<MbTiles> _initMbtiles() async {
    final file = await copyAssetToFile(
      TileMapAssets.exampleThree,
    );
    return MbTiles(mbtilesPath: file.path);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (widget.provider.isLoadingMap) {
      return const Center(child: LoadingMapsComponents());
    } else {
      return FutureBuilder<MbTiles>(
        future: _futureMbtiles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _mbtiles = snapshot.data;
            return Stack(
              children: [
                FlutterMap(
                  mapController: widget.provider.mapController,
                  options: MapOptions(
                    onTap: (tapPosition, point) async {
                      /*dibuja y añade los puntos al marcador */
                      widget.provider.addMarkerPolygon(tapPosition, point);
                      /*añade las coordenadas a la función */
                      widget.provider.addSelectedCoordinate(point);
                      /*añade los puntos al provider para enviar a firebase */
                      widget.visitsPrv.setCoordenates(point);
                      /*efecto de vibración */
                      await VibrationServices().vibrate();
                    },
                    initialCenter: LatLng(widget.provider.latitude ?? 0.0,
                        widget.provider.longitude ?? 0.0),
                    // initialZoom: 18,
                    // minZoom: 14,
                    // maxZoom: 100,
                  ),
                  children: [
                    TileLayer(
                      errorImage: AssetImage(ImagesPaths.errorMaps),
                      urlTemplate:
                          "https://mt1.google.com/vt/lyrs=r&x={x}&y={y}&z={z}",
                      userAgentPackageName: 'com.example.surveys_app',
                    ),
                    TileLayer(
                      tileProvider: MbTilesTileProvider(
                        mbtiles: _mbtiles!,
                        silenceTileNotFound: true,
                      ),
                    ),
                    PolygonLayer(
                      drawLabelsLast: true,
                      polygons: [
                        Polygon(
                            borderColor: PaletteColorsTheme.principalColor,
                            isFilled: true,
                            points: widget.provider.markers,
                            color: PaletteColorsTheme.principalColor
                                .withOpacity(0.3),
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
                              const _DotMapLocationComponent(),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  left: size.width * .03,
                  top: size.height * .4,
                  right: size.width * .05,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (widget.provider.selectedCoordinates.isNotEmpty)
                        CircleAvatar(
                          backgroundColor: PaletteColorsTheme.principalColor,
                          radius: 25,
                          child: IconButton(
                            onPressed: () async {
                              /*abre la lista de coordenadas */
                              ShowCoordinatesMapWidget.showShowCoordinates(
                                  context);
                              VibrationServices().vibrate();
                            },
                            icon: const Icon(
                              Icons.visibility_outlined,
                              color: PaletteColorsTheme.whiteColor,
                            ),
                          ),
                        ).animate().fade().scale(),
                      if (widget.provider.selectedCoordinates.isNotEmpty)
                        SizedBox(height: size.height * .02),

                      /*boton para posicionar al usuario*/
                      CircleAvatar(
                        backgroundColor: PaletteColorsTheme.principalColor,
                        radius: 25,
                        child: IconButton(
                          onPressed: () async {
                            widget.provider.centerMapToCurrentPosition();
                            VibrationServices().vibrate();
                          },
                          icon: const Icon(
                            IconlyLight.location,
                            color: PaletteColorsTheme.whiteColor,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * .02),
                      /*boton para borrar los poligonos*/
                      CircleAvatar(
                        backgroundColor: PaletteColorsTheme.principalColor,
                        radius: 25,
                        child: IconButton(
                          onPressed: () async {
                            /*limpia las listas y lo seleccionado */
                            widget.provider.clearMarkersAndPolygon();

                            widget.visitsPrv.listSendCoordinates.clear();
                            VibrationServices().vibrate();
                          },
                          icon: const Icon(
                            IconlyLight.delete,
                            color: PaletteColorsTheme.whiteColor,
                          ),
                        ),
                      ),
                      /*boton para actualizar el mapa */
                      SizedBox(height: size.height * .02),
                      CircleAvatar(
                        backgroundColor: PaletteColorsTheme.principalColor,
                        radius: 25,
                        child: IconButton(
                          onPressed: () async {
                            widget.provider.reloadMapUpdate();
                            widget.visitsPrv.listSendCoordinates.clear();

                            VibrationServices().vibrate();
                          },
                          icon: const Icon(
                            Icons.replay_outlined,
                            color: PaletteColorsTheme.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          if (snapshot.hasError) {
            log('snapshot $snapshot');
            return Center(
                child: Text(
              snapshot.error.toString(),
              textAlign: TextAlign.center,
            ));
          }
          return const Center(child: LoadingAppComponent());
        },
      );
    }
  }

  @override
  void dispose() {
    // close mbtiles database
    _mbtiles?.dispose();
    super.dispose();
  }
}

class _DotMapLocationComponent extends StatelessWidget {
  const _DotMapLocationComponent();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: size.height * .1,
          width: size.width * .3,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: PaletteColorsTheme.principalColor.withOpacity(0.3)),
        ),
        Container(
          height: size.height * .08,
          width: size.width * .3,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: PaletteColorsTheme.principalColor.withOpacity(0.5)),
        ),
        Container(
          height: size.height * .06,
          width: size.width * .3,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: PaletteColorsTheme.principalColor),
          child: const Center(
              child: Icon(IconlyBold.location,
                  color: PaletteColorsTheme.whiteColor, size: 25)),
        ),
      ],
    );
  }
}
