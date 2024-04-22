import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #4 MIEMBROS DE LA FAMILIA QUE VIVEN EN LA FINCA Y APOYAN A LA ACTIVIDAD (HIJOS, YERNO, NUERA, SOBRINO, TIOS Y DEMAS)
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
      floatingActionButton:
          const IconButtonAddMemberComponents(isViewListMembers: true),
      appBar: AppBar(actions: const [
        SaveIconDraftComponents(color: PaletteColorsTheme.secondaryColor)
      ]),
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
                  title:
                      'INFORMACIÓN DE FAMILIARES (SOLO FAMILIARES QUE VIVEN O TRABAJEN EN EL CULTIVO)'),
              SizedBox(height: size.height * .02),
              const LinealPercentComponent(
                colorOne: PaletteColorsTheme.secondaryColor,
                colorTwo: PaletteColorsTheme.colorMagentaTwo,
                percent: (4 - 1) * (100 / 13) / 100,
                questions: '30',
                answers: '4',
              ),
              SizedBox(height: size.height * .04),
              //#1
              InputsComponent(
                title: 'Nombres y apellidos',
                hintext: ' Ingresar nombres y apellidos',
                colorInputs: PaletteColorsTheme.secondaryColor,
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
                colorInputs: PaletteColorsTheme.secondaryColor,
                items: const [
                  'Hijos',
                  'Yerno',
                  'Nuera',
                  'Sobrino',
                  'Tios',
                  'Demas',
                ],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Hijos':
                      surveysPrv.setRelationShip('1');
                      break;
                    case 'Yerno':
                      surveysPrv.setRelationShip('2');
                      break;
                    case 'Nuera':
                      surveysPrv.setRelationShip('3');
                      break;
                    case 'Sobrino':
                      surveysPrv.setRelationShip('4');
                      break;
                    case 'Tios':
                      surveysPrv.setRelationShip('5');
                      break;
                    case 'Demas':
                      surveysPrv.setRelationShip('6');
                      break;
                    default:
                  }
                },
              ),

              SizedBox(height: size.height * .03),
              //#3
              DropdownComponents(
                title: ' Seleccionar género',
                initialValue: '-',
                hintext: ' Seleccionar género',
                items: const ['Masculino', 'Femenino', 'Otro'],
                colorInputs: PaletteColorsTheme.secondaryColor,
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Masculino':
                      surveysPrv.setGenderRelationShip('1');
                      break;
                    case 'Femenino':
                      surveysPrv.setGenderRelationShip('2');
                      break;
                    case 'Otro':
                      surveysPrv.setGenderRelationShip('3');
                      break;
                    default:
                  }
                },
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
                      colorInputs: PaletteColorsTheme.secondaryColor,
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
                      colorInputs: PaletteColorsTheme.secondaryColor,
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
                      colorInputs: PaletteColorsTheme.secondaryColor,
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
                colorInputs: PaletteColorsTheme.secondaryColor,
                items: const [
                  'Primaria',
                  'Secundaria',
                  'Técnico',
                  'Profesional',
                ],
                validator: (val) =>
                    ValidationInputs.inputTypeSelect(val.toString()),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Primaria':
                      surveysPrv.setEducationLevelRelationship('1');
                      break;
                    case 'Secundaria':
                      surveysPrv.setEducationLevelRelationship('2');
                      break;
                    case 'Técnico':
                      surveysPrv.setEducationLevelRelationship('3');
                      break;
                    case 'Profesional':
                      surveysPrv.setEducationLevelRelationship('4');
                      break;
                    default:
                  }
                },
              ),

              SizedBox(height: size.height * .03),
              InputsComponent(
                title: 'Institución de escolaridad',
                hintext: ' Ingresar institución',
                colorInputs: PaletteColorsTheme.secondaryColor,
                controller: surveysPrv.schoolRelationship,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setSchoolRelationship(val),
              ),

              SizedBox(height: size.height * .03),
              //#7
              InputsComponent(
                title: 'Número de documento',
                hintext: ' Ingresar número',
                colorInputs: PaletteColorsTheme.secondaryColor,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                controller: surveysPrv.numberDocRelationship,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setNumberDocRelationship(val),
              ),

              SizedBox(height: size.height * .06),

              /*boton para continuar*/
              ButtonComponents(
                colorButton: PaletteColorsTheme.secondaryColor,
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
