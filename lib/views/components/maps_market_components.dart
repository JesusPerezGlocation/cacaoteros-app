import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:iconly/iconly.dart';
import 'package:latlong2/latlong.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/views/widgets/show_coordinates_map_widget.dart';

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
                        backgroundColor: PaletteColorsTheme.whiteColor,
                        radius: 25,
                        child: IconButton(
                          onPressed: () async {
                            /*abre la lista de coordenadas */
                            ShowCoordinatesMapWidget.showShowCoordinates(
                                context);
                            VibrationServices().vibrate();
                          },
                          icon: const Icon(Icons.visibility_outlined),
                        ),
                      ).animate().fade().scale(),
                    if (widget.provider.selectedCoordinates.isNotEmpty)
                      SizedBox(height: size.height * .02),

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
                          /*limpia las listas y lo seleccionado */
                          widget.provider.clearMarkersAndPolygon();

                          widget.visitsPrv.listSendCoordinates.clear();
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
                          widget.provider.reloadMapUpdate();
                          widget.visitsPrv.listSendCoordinates.clear();

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
