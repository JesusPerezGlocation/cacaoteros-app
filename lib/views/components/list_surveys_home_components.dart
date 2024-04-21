import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

class ListSurveysHomeComponents extends StatelessWidget {
  final DateTime dateTime;
  const ListSurveysHomeComponents({super.key, required this.dateTime});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<BeneficiariesSurveysProvider>(context);

    return ListView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.only(
          right: size.width * .03,
          top: size.height * .025,
          bottom: size.height * .025),
      children: [
        /*registro de visita*/
        StartSurveysComponents(
          title: 'Registro de visitas',
          answers: '10/50 respuestas conectar',
          percent: 0.5,
          dateTime: DateFormat('dd/MM/yyyy').format(dateTime),
          image: ImagesPaths.surveyImg,
          color: PaletteColorsTheme.principalColor,
          onTap: () {
            /*limpia el provider*/
            surveysPrv.cleanAllProvider();
            /*navega a la primera pantalla de preguntas */
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FirstSurveysScreens(
                          dateTime: DateFormat('dd/MM/yyyy').format(dateTime),
                        )));
          },
        ),
        SizedBox(width: size.width * .02),
        /*capacitaciones*/
        StartSurveysComponents(
          title: 'Capacitaciones',
          answers: '10/50 respuestas conectar',
          percent: 0.9,
          dateTime: DateFormat('dd/MM/yyyy').format(dateTime),
          image: ImagesPaths.surveyImg,
          color: PaletteColorsTheme.principalColor,
          onTap: () {},
        ),
        SizedBox(width: size.width * .02),
        /*tareas administrativas */
        StartSurveysComponents(
          title: 'Tareas administrativas',
          answers: '10/50 respuestas conectar',
          percent: 0.2,
          dateTime: DateFormat('dd/MM/yyyy').format(dateTime),
          image: ImagesPaths.surveyImg,
          color: PaletteColorsTheme.principalColor,
          onTap: () {},
        ),
        SizedBox(width: size.width * .02),
        /*caracterización de Cacaocultores */
        StartSurveysComponents(
          title: 'Caracterización de Cacaocultores',
          answers: '10/50 respuestas conectar',
          percent: 0.2,
          dateTime: DateFormat('dd/MM/yyyy').format(dateTime),
          image: ImagesPaths.surveyImg,
          color: PaletteColorsTheme.secondaryColor,
          onTap: () {},
        ),
        SizedBox(width: size.width * .02),
        /*caracterización de Cacaocultores */
        StartSurveysComponents(
          title: 'Caracterización de Centro de Acopio',
          answers: '10/50 respuestas conectar',
          percent: 0.1,
          dateTime: DateFormat('dd/MM/yyyy').format(dateTime),
          image: ImagesPaths.surveyImg,
          color: PaletteColorsTheme.secondaryColor,
          onTap: () {},
        ),
        SizedBox(width: size.width * .02),
        /*kardex */
        StartSurveysComponents(
          title: 'Kardex',
          answers: '10/50 respuestas conectar',
          percent: 0.9,
          dateTime: DateFormat('dd/MM/yyyy').format(dateTime),
          image: ImagesPaths.surveyImg,
          color: PaletteColorsTheme.secondaryColor,
          onTap: () {},
        ),
        SizedBox(width: size.width * .02),
        /*registro calidad del grano */
        StartSurveysComponents(
          title: 'Registro Calidad del Grano',
          answers: '10/50 respuestas conectar',
          percent: 0.4,
          dateTime: DateFormat('dd/MM/yyyy').format(dateTime),
          image: ImagesPaths.surveyImg,
          color: PaletteColorsTheme.secondaryColor,
          onTap: () {},
        ),
      ],
    );
  }
}
