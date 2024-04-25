// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

class ListSurveysHomeComponents extends StatefulWidget {
  final DateTime dateTime;
  const ListSurveysHomeComponents({super.key, required this.dateTime});

  @override
  State<ListSurveysHomeComponents> createState() =>
      _ListSurveysHomeComponentsState();
}

class _ListSurveysHomeComponentsState extends State<ListSurveysHomeComponents> {
  int randomNumber = 0;
  setIDsurveys() {
    Random random = Random(); //genera un número aleatero de 1 a 10m
    randomNumber = random.nextInt(10000001);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<BeneficiariesSurveysProvider>(context);
    final cemeraPermissionPrv = Provider.of<CameraPermissionProvider>(context);
    final visitsPrv = Provider.of<VisitsSurveysProvider>(context);
    final domianPrv = Provider.of<SendImageApi>(context);

    final isiOS = Platform.isIOS;
    return ListView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.only(
          right: size.width * .03,
          top: size.height * .025,
          bottom: size.height * .0),
      children: [
        /*registro de visita*/
        StartSurveysComponents(
          title: 'Caracterización de potenciales beneficiarios',
          answers: '10/50 respuestas conectar',
          percent: 0.5,
          dateTime: DateFormat('dd/MM/yyyy').format(widget.dateTime),
          color: PaletteColorsTheme.secondaryColor,
          onTap: () {
            /*limpia el provider*/
            surveysPrv.cleanAllProvider();
            /*guarda la categoria*/
            surveysPrv.setCategorieSurveys(
                'Caracterización de potenciales beneficiarios');
            /*navega a la primera pantalla de preguntas */
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FirstSurveysScreens(
                          dateTime:
                              DateFormat('dd/MM/yyyy').format(widget.dateTime),
                        )));
          },
        ),
        SizedBox(width: size.width * .02),
        /*visitas*/
        StartSurveysComponents(
          title: 'Registro de visitas',
          answers: '10/50 respuestas conectar',
          percent: 0.9,
          dateTime: DateFormat('dd/MM/yyyy').format(widget.dateTime),
          color: PaletteColorsTheme.principalColor,
          onTap: () async {
            /*pide el permiso de camara y fotos*/
            if (isiOS) {
              await cemeraPermissionPrv.requestCameraPermission(context);
            } else {
              await Permission.camera.request();
            }
            // await cemeraPermissionPrv.requestGalleryPermission();
            /*limpia el provider*/
            visitsPrv.cleanProvider();
            /*limpia el provider de las firmas e imagenes enviadas*/
            domianPrv.clearProvider();

            /*guarda la categoria*/
            visitsPrv.setCategorieSurveys('Registro de visitas');

            /*genera el id la encuesta */
            setIDsurveys();
            /*setea el dato con  el id generado */
            visitsPrv.generateIDsurveys(randomNumber);
            /*genera la fecha de creación*/
            visitsPrv.setdateCreateSurvey(widget.dateTime.toString());
            /*navega a visitas*/
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FirtSurveysVisitsScreen(
                        dateTime:
                            DateFormat('dd/MM/yyyy').format(widget.dateTime))));
          },
        ),
        SizedBox(width: size.width * .02),
        /*tareas administrativas */
        StartSurveysComponents(
          title: 'Tareas administrativas',
          answers: '10/50 respuestas conectar',
          percent: 0.2,
          dateTime: DateFormat('dd/MM/yyyy').format(widget.dateTime),
          color: PaletteColorsTheme.principalColor,
          onTap: () {},
        ),
        SizedBox(width: size.width * .02),
        /*caracterización de Cacaocultores */
        StartSurveysComponents(
          title: 'Caracterización de Cacaocultores',
          answers: '10/50 respuestas conectar',
          percent: 0.2,
          dateTime: DateFormat('dd/MM/yyyy').format(widget.dateTime),
          color: PaletteColorsTheme.secondaryColor,
          onTap: () {},
        ),
        SizedBox(width: size.width * .02),
        /*caracterización de Cacaocultores */
        StartSurveysComponents(
          title: 'Caracterización de Centro de Acopio',
          answers: '10/50 respuestas conectar',
          percent: 0.1,
          dateTime: DateFormat('dd/MM/yyyy').format(widget.dateTime),
          color: PaletteColorsTheme.secondaryColor,
          onTap: () {},
        ),
        SizedBox(width: size.width * .02),
        /*kardex */
        StartSurveysComponents(
          title: 'Kardex',
          answers: '10/50 respuestas conectar',
          percent: 0.9,
          dateTime: DateFormat('dd/MM/yyyy').format(widget.dateTime),
          color: PaletteColorsTheme.secondaryColor,
          onTap: () {},
        ),
        SizedBox(width: size.width * .02),
        /*registro calidad del grano */
        StartSurveysComponents(
          title: 'Registro Calidad del Grano',
          answers: '10/50 respuestas conectar',
          percent: 0.4,
          dateTime: DateFormat('dd/MM/yyyy').format(widget.dateTime),
          color: PaletteColorsTheme.secondaryColor,
          onTap: () {},
        ),
      ],
    )
        .animate(delay: const Duration(milliseconds: 500))
        .fadeIn(delay: const Duration(milliseconds: 100))
        .slide(
            begin: const Offset(0.5, 0),
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            delay: const Duration(milliseconds: 100))
        // .animate(onPlay: (controller) => controller.reverse())
        .shimmer(duration: 2400.ms);
  }
}
