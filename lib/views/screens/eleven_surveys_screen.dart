import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/routes/main_routes.dart';

/*
pantalla #11 MIEMBROS DE LA FAMILIA QUE VIVEN EN LA FINCA Y APOYAN A LA ACTIVIDAD (HIJOS, YERNO, NUERA, SOBRINO, TIOS Y DEMAS)
*/
class ElevenSurveysScreen extends StatefulWidget {
  const ElevenSurveysScreen({super.key});

  @override
  State<ElevenSurveysScreen> createState() => _ElevenSurveysScreenState();
}

class _ElevenSurveysScreenState extends State<ElevenSurveysScreen> {
/*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<SurveysVisitRegistrationProvider>(context);
    return Scaffold(
      floatingActionButton: const IconButtonAddMemberComponents(),
      appBar: AppBar(actions: const [SaveIconDraftComponents()]),
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
                      'CONFORMACIÓN NÚCLEO FAMILIAR > MIEMBROS DE LA FAMILIA QUE VIVEN EN LA FINCA Y APOYAN A LA ACTIVIDAD (HIJOS, YERNO, NUERA, SOBRINO, TIOS Y DEMAS)'),
              SizedBox(height: size.height * .02),
              const LinealPercentComponent(
                percent: (11 - 1) * (100 / 23) / 100,
                questions: '30',
                answers: '11',
              ),
              SizedBox(height: size.height * .04),
              //#1
              InputsComponent(
                title: 'Nombres y apellidos',
                hintext: ' Ingresar nombres y apellidos',
                textInputAction: TextInputAction.next,
                controller: surveysPrv.nameAndLastNameRelationShip,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) =>
                    surveysPrv.setNameAndLastNameRelationShip(val),
              ),
              SizedBox(height: size.height * .03),
              //#2
              DropdownComponents(
                title: ' Seleccionar parentesco',
                initialValue: '-',
                hintext: ' Seleccionar parentesco',
                items: const [
                  'Hijos',
                  'Yerno',
                  'Nuera',
                  'Sobrino',
                  'Tios',
                  'Demas',
                ],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) => surveysPrv.setRelationShip(val.toString()),
              ),

              SizedBox(height: size.height * .03),
              //#3
              DropdownComponents(
                title: ' Seleccionar género',
                initialValue: '-',
                hintext: ' Seleccionar género',
                items: const ['Masculino', 'Femenino', 'Otro'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) =>
                    surveysPrv.setGenderRelationShip(val.toString()),
              ),
              SizedBox(height: size.height * .03),
              // #4
              Row(
                children: [
                  //01
                  Flexible(
                    flex: 1,
                    child: InputsComponent(
                      title: 'Mes de nacimiento',
                      hintext: ' 03',
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: surveysPrv.monthBrithdayRelationship,
                      validator: (val) => ValidationInputs.validateMonth(val),
                      onChanged: (val) =>
                          surveysPrv.setMonthBrithdayRelationship(val),
                    ),
                  ),
                  SizedBox(width: size.width * .02),
                  //02
                  Flexible(
                    flex: 1,
                    child: InputsComponent(
                      title: 'Día de nacimiento',
                      hintext: ' 07',
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: surveysPrv.dayBrithdayRelationship,
                      validator: (val) =>
                          ValidationInputs.validateDayOfMonth(val),
                      onChanged: (val) =>
                          surveysPrv.setDayBrithdayRelationship(val),
                    ),
                  ),
                  SizedBox(width: size.width * .02),
                  //03
                  Flexible(
                    flex: 1,
                    child: InputsComponent(
                      title: 'Año de nacimiento',
                      hintext: ' 1999',
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: surveysPrv.yearBrithdayRelationship,
                      validator: (val) => ValidationInputs.validateYear(val),
                      onChanged: (val) =>
                          surveysPrv.setYearBrithdayRelationship(val),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * .03),
              //#5
              DropdownComponents(
                title: 'Nivel de escolaridad',
                hintext: ' Seleccionar nivel de escolaridad',
                items: const [
                  'Primaria',
                  'Secundaria',
                  'Técnico',
                  'Profesional',
                  'Otro'
                ],
                validator: (val) =>
                    ValidationInputs.inputTypeSelect(val.toString()),
                onChanged: (val) =>
                    surveysPrv.setEducationLevelRelationship(val.toString()),
              ),

              SizedBox(height: size.height * .03),
              InputsComponent(
                title: 'Institución escolaridad',
                hintext: ' Ingresar institución',
                controller: surveysPrv.numberDocRelationship,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setNumberDocRelationship(val),
              ),

              SizedBox(height: size.height * .03),
              //#7
              InputsComponent(
                title:
                    'Número de días al mes que labora en el cultivo de cacao',
                hintext: ' Ingresar número',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) {},
              ),

              SizedBox(height: size.height * .06),

              /*boton para continuar*/
              ButtonComponents(
                title: 'Continuar',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    /*navega a la pantalla #12*/
                    Navigator.pushNamed(
                      context,
                      MainRoutes.twelveSurveysRoute,
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
