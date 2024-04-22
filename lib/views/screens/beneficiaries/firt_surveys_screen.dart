// ignore_for_file: use_build_context_synchronously
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';
import 'package:uuid/uuid.dart';

/*
pantalla #1 ENCUESTA DE CARACTERIZACIÓN A CACAOCULTORES
*/
class FirstSurveysScreens extends StatefulWidget {
  final String dateTime;
  const FirstSurveysScreens({super.key, required this.dateTime});

  @override
  State<FirstSurveysScreens> createState() => _FirstSurveysScreensState();
}

class _FirstSurveysScreensState extends State<FirstSurveysScreens> {
  /*key*/
  final formKey = GlobalKey<FormState>();
  /*genera un uuid random*/
  final uuid = const Uuid();
  String generatedIdRandom() {
    return uuid.v4();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<BeneficiariesSurveysProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          SaveIconDraftComponents(
            color: PaletteColorsTheme.secondaryColor,
            onTap: () {
              SnackBarGlobalWidget.showSnackBar(
                  context,
                  'En proceso de construcción',
                  Icons.error_outlined,
                  PaletteColorsTheme.yellowColor);
            },
          )
        ],
      ),
      body: FadeIn(
        child: Form(
          key: formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .03, vertical: size.height * .03),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              const TitleSurveysComponents(
                  color: PaletteColorsTheme.secondaryColor,
                  title: 'ENCUESTA DE CARACTERIZACIÓN A CACAOCULTORES'),
              SizedBox(height: size.height * .02),
              const LinealPercentComponent(
                percent: (1 - 1) * (100 / 13) / 100,
                questions: '13',
                answers: '1',
                colorOne: PaletteColorsTheme.secondaryColor,
                colorTwo: PaletteColorsTheme.colorMagentaTwo,
              ),
              SizedBox(height: size.height * .02),

              /*fecha de hoy*/
              Text(
                widget.dateTime,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              SizedBox(height: size.height * .03),
              //#2 NOMBRE DE LA UNIDAD TÉCNICA
              InputsComponent(
                title: 'Nombre del técnico del campo',
                colorInputs: PaletteColorsTheme.secondaryColor,
                hintext: ' Ingresar nombre',
                textInputAction: TextInputAction.done,
                controller: surveysPrv.nameUnit,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setNameUnit(val),
              ),

              SizedBox(height: size.height * .06),

              ButtonComponents(
                colorButton: PaletteColorsTheme.secondaryColor,
                title: 'Continuar',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    /*genera un id ramdon  */
                    String idRandom = generatedIdRandom();
                    surveysPrv.setUuidiDSurveys(idRandom);
                    /*fecha */
                    surveysPrv.setSubmittionDate(widget.dateTime);
                    //!!sacar el id del dispositvo
                    surveysPrv.setDeviceID('-');
                    /*navega a la siguiente pantalla*/
                    Navigator.pushNamed(
                      context,
                      MainRoutes.secondSurveysdRoute,
                    );
                  }
                },
              ),

              SizedBox(height: size.height * .06),
            ],
          ),
        ),
      ),
    );
  }
}
