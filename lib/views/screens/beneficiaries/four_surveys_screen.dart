import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #11 MIEMBROS DE LA FAMILIA QUE VIVEN EN LA FINCA Y APOYAN A LA ACTIVIDAD (HIJOS, YERNO, NUERA, SOBRINO, TIOS Y DEMAS)
*/
class FourSurveysScreen extends StatefulWidget {
  const FourSurveysScreen({super.key});

  @override
  State<FourSurveysScreen> createState() => _FourSurveysScreenState();
}

class _FourSurveysScreenState extends State<FourSurveysScreen> {
/*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<BeneficiariesSurveysProvider>(context);
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
                      'INFORMACIÓN DE FAMILIARES (SOLO FAMILIARES QUE VIVEN O TRABAJEN EN EL CULTIVO)'),
              SizedBox(height: size.height * .02),
              const LinealPercentComponent(
                percent: (4 - 1) * (100 / 23) / 100,
                questions: '30',
                answers: '4',
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
                ],
                validator: (val) =>
                    ValidationInputs.inputTypeSelect(val.toString()),
                onChanged: (val) =>
                    surveysPrv.setEducationLevelRelationship(val.toString()),
              ),

              SizedBox(height: size.height * .03),
              InputsComponent(
                title: 'Institución de escolaridad',
                hintext: ' Ingresar institución',
                controller: surveysPrv.schoolRelationship,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setSchoolRelationship(val),
              ),

              SizedBox(height: size.height * .03),
              //#7
              InputsComponent(
                title: 'Número de documento',
                hintext: ' Ingresar número',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                controller: surveysPrv.numberDocRelationship,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setNumberDocRelationship(val),
              ),

              SizedBox(height: size.height * .06),

              /*boton para continuar*/
              ButtonComponents(
                title: 'Continuar',
                onPressed: () {
                  /*navega a la pantalla #5*/
                  Navigator.pushNamed(
                    context,
                    MainRoutes.fiveSurveysRoute,
                  );

                  if (formKey.currentState!.validate()) {}
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
