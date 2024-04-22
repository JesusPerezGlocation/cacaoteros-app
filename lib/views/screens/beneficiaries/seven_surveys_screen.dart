import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla número #7 
*/
class SevenSurveysScreen extends StatefulWidget {
  const SevenSurveysScreen({super.key});

  @override
  State<SevenSurveysScreen> createState() => _SevenSurveysScreenState();
}

class _SevenSurveysScreenState extends State<SevenSurveysScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<BeneficiariesSurveysProvider>(context);
    return Scaffold(
      appBar: AppBar(actions: [
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
                  title: 'PRÁCTICAS DE MANEJO DEL CULTIVO'),
              SizedBox(height: size.height * .02),

              const LinealPercentComponent(
                colorOne: PaletteColorsTheme.secondaryColor,
                colorTwo: PaletteColorsTheme.colorMagentaTwo,
                percent: (7 - 1) * (100 / 13) / 100,
                questions: '30',
                answers: '7',
              ),
              SizedBox(height: size.height * .04),
              //#1
              DropdownComponents(
                title:
                    '¿Qué labores realiza para la edecuación del suelo y el establecimiento del cultivo?',
                initialValue: 'CC',
                colorInputs: PaletteColorsTheme.secondaryColor,
                hintext: ' Seleccionar dato',
                items: const [
                  'Tala de árboles',
                  'Preparación con tractor',
                  'Quema física',
                  'Quema química',
                  'Análisis de suelos',
                  'Aplicación de correctivos',
                ],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Tala de árboles':
                      surveysPrv.setFloorSuitability('1');
                      break;
                    case 'Preparación con tractor':
                      surveysPrv.setFloorSuitability('2');
                      break;
                    case 'Quema física':
                      surveysPrv.setFloorSuitability('3');
                      break;
                    case 'Quema química':
                      surveysPrv.setFloorSuitability('4');
                      break;
                    case 'Análisis de suelos':
                      surveysPrv.setFloorSuitability('5');
                      break;
                    case 'Aplicación de correctivos':
                      surveysPrv.setFloorSuitability('6');
                      break;

                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .04),
              //#2
              DropdownComponents(
                title:
                    '¿Qué labores realiza para el mantenimiento del cultivo?',
                hintext: ' Seleccionar dato',
                colorInputs: PaletteColorsTheme.secondaryColor,
                items: const [
                  'Poda',
                  'Fertilización',
                  'Riego',
                  'Control sanitario',
                  'Otro'
                ],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Poda':
                      surveysPrv.setMaintenaceCultive('1');
                      break;
                    case 'Fertilización':
                      surveysPrv.setMaintenaceCultive('2');
                      break;
                    case 'Control sanitario':
                      surveysPrv.setMaintenaceCultive('3');
                      break;
                    case 'Otro':
                      surveysPrv.setMaintenaceCultive('4');
                      break;

                    default:
                  }
                },
              ),
              if (surveysPrv.maintenaceCultive.text.isNotEmpty &&
                  surveysPrv.maintenaceCultive.text == '4')
                SizedBox(height: size.height * .04),
              if (surveysPrv.maintenaceCultive.text.isNotEmpty &&
                  surveysPrv.maintenaceCultive.text == '4')
                // #3
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cúal?',
                    hintext: ' Ingresar dato',
                    colorInputs: PaletteColorsTheme.secondaryColor,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    controller: surveysPrv.floorSuitabilityOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setfloorSuitabilityOther(val),
                  ),
                ),

              SizedBox(height: size.height * .04),
              //#4
              DropdownComponents(
                title: '¿Posee sistema de riego?',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                colorInputs: PaletteColorsTheme.secondaryColor,
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPrv.seTIrrigationSystem('1');
                      break;
                    case 'No':
                      surveysPrv.seTIrrigationSystem('2');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .04),
              //#5
              DropdownComponents(
                title: '¿Realiza fertilización?',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                colorInputs: PaletteColorsTheme.secondaryColor,
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPrv.setPerformFertilization('1');
                      break;
                    case 'No':
                      surveysPrv.setPerformFertilization('2');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .04),
              //#6
              DropdownComponents(
                title: '¿Que tipo de fertilización realiza?',
                hintext: ' Seleccionar dato',
                items: const ['Orgánica', 'Química', 'Otro'],
                colorInputs: PaletteColorsTheme.secondaryColor,
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Orgánica':
                      surveysPrv.setTypeFertilization('1');
                      break;
                    case 'Química':
                      surveysPrv.setTypeFertilization('2');
                      break;
                    case 'Otro':
                      surveysPrv.setTypeFertilization('3');
                      break;
                    default:
                  }
                },
              ),
              if (surveysPrv.typeFertilization.text.isNotEmpty &&
                  surveysPrv.typeFertilization.text == '3')
                SizedBox(height: size.height * .04),
              if (surveysPrv.typeFertilization.text.isNotEmpty &&
                  surveysPrv.typeFertilization.text == '3')
                // #7
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cúal?',
                    hintext: ' Ingresar tipo de fertilización',
                    colorInputs: PaletteColorsTheme.secondaryColor,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    controller: surveysPrv.typeFertilizationOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setTypeFertilizationOther(val),
                  ),
                ),
              SizedBox(height: size.height * .04),
              //#8
              InputsComponent(
                title: 'Número de fertilizaciones al año',
                hintext: ' Ingresar número',
                colorInputs: PaletteColorsTheme.secondaryColor,
                keyboardType: TextInputType.number,
                controller: surveysPrv.typeFertilizationOther,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setTypeFertilizationOther(val),
              ),

              SizedBox(height: size.height * .04),
              //#8
              DropdownComponents(
                title: '¿Cada cuanto hace la recolección de cacao?',
                hintext: ' Seleccionar dato',
                items: const ['Quincenal', 'Mensual', 'Otro'],
                colorInputs: PaletteColorsTheme.secondaryColor,
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Quincenal':
                      surveysPrv.setRecolectionCocoa('1');
                      break;
                    case 'Mensual':
                      surveysPrv.setRecolectionCocoa('2');
                      break;
                    case 'Otro':
                      surveysPrv.setRecolectionCocoa('3');
                      break;
                    default:
                  }
                },
              ),
              if (surveysPrv.recolectionCocoa.text.isNotEmpty &&
                  surveysPrv.recolectionCocoa.text == '3')
                SizedBox(height: size.height * .04),
              if (surveysPrv.recolectionCocoa.text.isNotEmpty &&
                  surveysPrv.recolectionCocoa.text == '3')
                // #9
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cúal?',
                    hintext: ' Ingresar dato',
                    colorInputs: PaletteColorsTheme.secondaryColor,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    controller: surveysPrv.recolectionCocoaOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setRecolectionCocoaOther(val),
                  ),
                ),
              SizedBox(height: size.height * .06),

              /*boton para continuar*/
              ButtonComponents(
                colorButton: PaletteColorsTheme.secondaryColor,
                title: 'Continuar',
                onPressed: () {
                  /*navega hacia la pantalla #8*/
                  Navigator.pushNamed(
                    context,
                    MainRoutes.eightSurveyRoute,
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
