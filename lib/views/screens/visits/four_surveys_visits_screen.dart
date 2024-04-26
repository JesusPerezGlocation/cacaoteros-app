import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla número 4 para encuestas las visitas
*/
class FourSurveysVisitsScreen extends StatefulWidget {
  final PermissionLocationProvider locationProvider;
  const FourSurveysVisitsScreen({
    super.key,
    required this.locationProvider,
  });

  @override
  State<FourSurveysVisitsScreen> createState() =>
      _FourSurveysVisitsScreenState();
}

class _FourSurveysVisitsScreenState extends State<FourSurveysVisitsScreen> {
  @override
  void initState() {
    super.initState();
    getLocationUser();
    isViewMap = false;
  }

  Future getLocationUser() async {
    try {
      await widget.locationProvider.getPermissionLocation(context);
      await widget.locationProvider.getLocationUser();
      widget.locationProvider.reloadMapUpdate();
      setState(() {});
    } catch (e) {
      log('error location $e');
    }
  }

  bool isViewMap = false;

  @override
  Widget build(BuildContext context) {
    final visitsPrv = Provider.of<VisitsSurveysProvider>(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: isViewMap
          ? _BottonNavigatorMapComponents(
              visitsPrv: visitsPrv,
              lat: '${widget.locationProvider.latitude}',
              long: '${widget.locationProvider.latitude}',
              accuracy: '${widget.locationProvider.accuracy}',
              altitude: '${widget.locationProvider.altitude}',
            )
          : const SizedBox(),
      appBar: AppBar(
          //
          actions: [
            CircleAvatarSaveIconDraftComponent(
              color: PaletteColorsTheme.principalColor,
              colorCircle: PaletteColorsTheme.whiteColor,
              onTap: () {},
            )
          ]),
      body: !isViewMap
          ? IsEmptyImageWithOnTap(
              title: 'Marque el perímetro de la finca',
              description:
                  'Le solicitamos que marque el perímetro de la propiedad utilizando la herramienta de marcar sobre el mapa.',
              image: ImagesPaths.mapMenImage,
              titleButton: 'Generar mapa',
              buttonColor: PaletteColorsTheme.principalColor,
              onTap: () {
                setState(() => isViewMap = true);
              },
            )
          : Consumer<PermissionLocationProvider>(
              builder: (context, provider, _) {
                if (provider.latitude == null || provider.longitude == null) {
                  return const Center(child: LoadingMapsComponents());
                } else {
                  if (provider.latitude != null && provider.longitude != null) {
                    return MapMarketComponents(
                      provider: provider,
                      visitsPrv: visitsPrv,
                    );
                  } else {
                    return const Center(
                      child: Text(
                        'Error al obtener la ubicación',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }
                }
              },
            ),
    );
  }
}

/*
componente para el boton del mapa y que navegue a la sig pantalla 
*/
class _BottonNavigatorMapComponents extends StatelessWidget {
  final String lat;
  final String long;
  final String accuracy;
  final String altitude;
  final VisitsSurveysProvider visitsPrv;
  const _BottonNavigatorMapComponents({
    required this.lat,
    required this.long,
    required this.accuracy,
    required this.altitude,
    required this.visitsPrv,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .22,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: size.width * .03),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: PaletteColorsTheme.blackColor.withOpacity(0.1),
                offset: const Offset(0, -10),
                blurRadius: 20)
          ],
          color: PaletteColorsTheme.whiteColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            height: size.height * .06,
            width: size.width * .15,
            decoration: BoxDecoration(
                color: PaletteColorsTheme.principalColor,
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
                child: Icon(
              IconlyLight.location,
              color: PaletteColorsTheme.whiteColor,
              size: 30,
            )),
          ),
          title: Text(
            'Tu ubicación',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          subtitle: Text(
            '$lat, $long',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(height: size.height * .02),
        ButtonComponents(
          title: 'Continuar',
          colorButton: PaletteColorsTheme.principalColor,
          onPressed: () {
            if (visitsPrv.listSendCoordinates.isNotEmpty) {
              /*setea la lat y long*/
              visitsPrv.setLatAndLong(lat, long, accuracy, altitude);

              /*setea el porcentaje almacenado*/
              visitsPrv.setPercentSurvey((4 - 1) * (100 / 8) / 100);

              /*navega a la pantalla #5 */
              Navigator.pushNamed(
                context,
                MainRoutes.fiveVisitsSurveysRoute,
              );
            } else {
              return SnackBarGlobalWidget.showSnackBar(
                context,
                'Por favor, selecciona un área',
                Icons.error_outlined,
                PaletteColorsTheme.redErrorColor,
              );
            }
          },
        )
      ]),
    );
  }
}
