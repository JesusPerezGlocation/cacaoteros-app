import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #10 INFORMACIÓN DE BUENAS PRACTICAS AGRÍCOLAS (BPA) Y AMBIENTAL
*/
class TenSurveysScreen extends StatefulWidget {
  const TenSurveysScreen({super.key});

  @override
  State<TenSurveysScreen> createState() => _TenSurveysScreenState();
}

class _TenSurveysScreenState extends State<TenSurveysScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<BeneficiariesSurveysProvider>(context);

    return Scaffold(
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
                      'INFORMACIÓN DE BUENAS PRACTICAS AGRÍCOLAS (BPA) Y AMBIENTAL'),
              SizedBox(height: size.height * .02),

              const LinealPercentComponent(
                percent: (10 - 1) * (100 / 13) / 100,
                questions: '30',
                answers: '10',
              ),

              SizedBox(height: size.height * .04),
              //#1
              DropdownComponents(
                title: '¿Implementa BPM en su finca?',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPrv.setBpmInTheFarm('1');
                      break;
                    case 'No':
                      surveysPrv.setBpmInTheFarm('2');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .04),
              //#2
              DropdownComponents(
                title: '¿Cómo planea las labores que realiza en el cultivo?',
                items: const [
                  'Planeador',
                  'No las planea',
                  'Costumbre',
                  'Depende del clima',
                  'Otro'
                ],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Planeador':
                      surveysPrv.setWorkInCultivation('1');
                      break;
                    case 'No las planea':
                      surveysPrv.setWorkInCultivation('2');
                      break;
                    case 'Costumbre':
                      surveysPrv.setWorkInCultivation('3');
                      break;
                    case 'Depende del clima':
                      surveysPrv.setWorkInCultivation('4');
                      break;
                    case 'Otro':
                      surveysPrv.setWorkInCultivation('5');
                      break;
                    default:
                  }
                },
              ),

              if (surveysPrv.workInCultivation.text.isNotEmpty &&
                  surveysPrv.workInCultivation.text == '5')
                SizedBox(height: size.height * .04),
              if (surveysPrv.workInCultivation.text.isNotEmpty &&
                  surveysPrv.workInCultivation.text == '5')
                //#3
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cuál?',
                    hintext: ' Ingresar dato',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    controller: surveysPrv.workInCultivationOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setWorkInCultivationOther(val),
                  ),
                ),
              SizedBox(height: size.height * .04),
              //#4
              DropdownComponents(
                title: '¿Qué tipos de registros lleva en su finca?',
                hintext: ' Seleccionar tipo de registro',
                items: const [
                  'Jornales',
                  'Uso de insumos',
                  'Ventas',
                  'Cosecha',
                  'Labores realizadas'
                ],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Jornales':
                      surveysPrv.setTypeRegisterInFarm('1');
                      break;
                    case 'Uso de insumos':
                      surveysPrv.setTypeRegisterInFarm('2');
                      break;
                    case 'Ventas':
                      surveysPrv.setTypeRegisterInFarm('3');
                      break;
                    case 'Cosecha':
                      surveysPrv.setTypeRegisterInFarm('4');
                      break;
                    case 'Labores realizadas':
                      surveysPrv.setTypeRegisterInFarm('5');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .04),
              //#5
              DropdownComponents(
                title: '¿Cuenta con áreas de almecenamiento para?',
                items: const [
                  'Herramientas',
                  'Agroinsumos',
                  'Fertilizantes',
                  'Acopio',
                  'Otro'
                ],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Herramientas':
                      surveysPrv.setStorageAreas('1');
                      break;
                    case 'Agroinsumos':
                      surveysPrv.setStorageAreas('2');
                      break;
                    case 'Fertilizantes':
                      surveysPrv.setStorageAreas('3');
                      break;
                    case 'Acopio':
                      surveysPrv.setStorageAreas('4');
                      break;
                    case 'Otro':
                      surveysPrv.setStorageAreas('5');
                      break;
                    default:
                  }
                },
              ),
              if (surveysPrv.storageAreas.text.isNotEmpty &&
                  surveysPrv.storageAreas.text == '5')
                SizedBox(height: size.height * .04),
              if (surveysPrv.storageAreas.text.isNotEmpty &&
                  surveysPrv.storageAreas.text == '5')
                //#7
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cuál?',
                    hintext: ' Ingresar dato',
                    textInputAction: TextInputAction.next,
                    controller: surveysPrv.storageAreasOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) => surveysPrv.setStorageAreasOther(val),
                  ),
                ),
              SizedBox(height: size.height * .04),
              //#8
              DropdownComponents(
                title: '¿Cuenta con una fuente hídrica cercana?',
                items: const ['Si', 'No'],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPrv.setHidricWaterSource('1');
                      break;
                    case 'No':
                      surveysPrv.setHidricWaterSource('2');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .04),
              //#9
              DropdownComponents(
                title: '¿Están protegidos sus márgenes?',
                items: const ['Si', 'No'],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPrv.setProtectedMargins('1');
                      break;
                    case 'No':
                      surveysPrv.setProtectedMargins('2');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .04),
              //#10
              DropdownComponents(
                title: 'Uso del agua',
                items: const ['Riego', 'Consumo'],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Riego':
                      surveysPrv.setWaterUse('1');
                      break;
                    case 'Consumo':
                      surveysPrv.setWaterUse('2');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .04),
              //#11
              DropdownComponents(
                title: '¿Tiene concesión de agua?',
                items: const ['Si', 'No'],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPrv.setWaterConcession('1');
                      break;
                    case 'No':
                      surveysPrv.setWaterConcession('2');
                      break;
                    default:
                  }
                },
              ),
              if (surveysPrv.waterConcession.text.isNotEmpty &&
                  surveysPrv.waterConcession.text == '1')
                SizedBox(height: size.height * .04),
              if (surveysPrv.waterConcession.text.isNotEmpty &&
                  surveysPrv.waterConcession.text == '1')
                //#12
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cuantos litros tiene autorizados?',
                    hintext: ' Ingresar litros autorizados',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    controller: surveysPrv.authorizedLitersOfWater,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setAuthorizedLitersOfWater(val),
                  ),
                ),
              SizedBox(height: size.height * .04),
              //13
              DropdownComponents(
                title: '¿Qúe prácticas de conservación de suelos realiza?',
                items: const [
                  'Coberturas',
                  'Manejo con microorganismos',
                  'Abono orgánico',
                  'Manejo de hierbas buenas',
                  'Otro'
                ],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Coberturas':
                      surveysPrv.setFloorConservation('1');
                      break;
                    case 'Manejo con microorganismos':
                      surveysPrv.setFloorConservation('2');
                      break;
                    case 'Abono orgánico':
                      surveysPrv.setFloorConservation('3');
                      break;
                    case 'Manejo de hierbas buenas':
                      surveysPrv.setFloorConservation('4');
                      break;
                    case 'Otro':
                      surveysPrv.setFloorConservation('5');
                      break;
                    default:
                  }
                },
              ),
              if (surveysPrv.floorConservation.text.isNotEmpty &&
                  surveysPrv.floorConservation.text == '5')
                SizedBox(height: size.height * .04),
              if (surveysPrv.floorConservation.text.isNotEmpty &&
                  surveysPrv.floorConservation.text == '5')
                //14
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cúal?',
                    hintext: ' Ingresar dato',
                    textInputAction: TextInputAction.next,
                    controller: surveysPrv.floorConservationOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setFloorConservationOther(val),
                  ),
                ),

              SizedBox(height: size.height * .04),
              //#15
              DropdownComponents(
                title:
                    '¿La familia cuenta con un sistema de registro de información para la administración de su finca?',
                items: const ['Si', 'No'],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPrv.setSystemRegistrationInFarm('1');
                      break;
                    case 'No':
                      surveysPrv.setSystemRegistrationInFarm('2');
                      break;
                    default:
                  }
                },
              ),

              SizedBox(height: size.height * .04),
              //#16
              DropdownComponents(
                title:
                    '¿Sabe que el ICA certifica a las fincas que implementan BPA?',
                items: const ['Si', 'No'],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPrv.setICACertifiesTheFarms('1');
                      break;
                    case 'No':
                      surveysPrv.setICACertifiesTheFarms('2');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .04),
              //#17
              DropdownComponents(
                title:
                    '¿Tiene planeado deforestar áreas de bosques o rastrojo para cultivar o establecer áreas de pasto?',
                items: const ['Si', 'No'],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPrv.setPlannedToDeforest('1');
                      break;
                    case 'No':
                      surveysPrv.setPlannedToDeforest('2');
                      break;
                    default:
                  }
                },
              ),

              SizedBox(height: size.height * .06),

              /*boton para continuar*/
              ButtonComponents(
                title: 'Continuar',
                onPressed: () {
                  //Todo: debe validar
                  /*navega a la pantalla #11*/
                  Navigator.pushNamed(
                    context,
                    MainRoutes.elevenSurveysRoute,
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
