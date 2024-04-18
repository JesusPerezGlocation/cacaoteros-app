import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #6 INFORMACIÓN SOCIAL
*/
class SixSurveysScreen extends StatefulWidget {
  const SixSurveysScreen({super.key});

  @override
  State<SixSurveysScreen> createState() => _SixSurveysScreenState();
}

class _SixSurveysScreenState extends State<SixSurveysScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<SurveysVisitRegistrationProvider>(context);
    return Scaffold(
      appBar: AppBar(),
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
                  title:
                      'INFORMACIÓN BÁSICA DEL CACAOCULTOR > INFORMACIÓN SOCIAL'),
              SizedBox(height: size.height * .02),

              const LinealPercentComponent(
                percent: (6 - 1) * (100 / 23) / 100,
                questions: '30',
                answers: '6',
              ),
              SizedBox(height: size.height * .04),
              //#1
              DropdownComponents(
                title: '¿Vive en la finca?',
                initialValue: 'CC',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) => surveysPrv.setLiveFarm(val.toString()),
              ),
              SizedBox(height: size.height * .03),
              //#2
              DropdownComponents(
                title: 'Tipo de población vulnerable',
                initialValue: 'CC',
                hintext: ' Seleccionar población',
                items: const [
                  'MUJER CABEZA DE FAMILIA',
                  'ADULTO MAYOR',
                  'VÍCTIMA DE VIOLENCIA',
                  'PERSONA EN SITUACIÓN DE DISCAPACIDAD',
                  'NINGUNA'
                ],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) =>
                    surveysPrv.setTypePeopleVulnerable(val.toString()),
              ),
              SizedBox(height: size.height * .03),
              //#3
              DropdownComponents(
                title: 'Grupos étnicos',
                initialValue: 'CC',
                hintext: ' Seleccionar grupo',
                items: const [
                  'AFRODESCENDIENTE',
                  'GITANO',
                  'RAIZAL',
                  'INDÍGENA',
                  'NINGUNA'
                ],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) => surveysPrv.setEthhicGroup(val.toString()),
              ),

              SizedBox(height: size.height * .06),

              /*boton para continuar*/
              ButtonComponents(
                title: 'Continuar',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamed(
                      context,
                      MainRoutes.sevenSurveysRoute,
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
