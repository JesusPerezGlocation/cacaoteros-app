import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #9 CARACTERISTICAS DE LA VIVIENDA
*/
class NineSurveysScreen extends StatefulWidget {
  const NineSurveysScreen({super.key});

  @override
  State<NineSurveysScreen> createState() => _NineSurveysScreenState();
}

class _NineSurveysScreenState extends State<NineSurveysScreen> {
  TextEditingController typeHouse = TextEditingController();
  TextEditingController typeCeiling = TextEditingController();
  TextEditingController wallsCeiling = TextEditingController();

/*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<SurveysVisitRegistrationProvider>(context);
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
                  title: 'CARACTERISTICAS DE LA VIVIENDA'),
              SizedBox(height: size.height * .02),

              const LinealPercentComponent(
                percent: (9 - 1) * (100 / 23) / 100,
                questions: '30',
                answers: '9',
              ),

              SizedBox(height: size.height * .04),
              //#1
              DropdownComponents(
                title: 'Tipo de casa',
                initialValue: 'CC',
                hintext: ' Seleccionar tipo de casa',
                items: const ['Casa', 'Carpa', 'Cuarto', 'Otro'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) => surveysPrv.setTypeHouse(val.toString()),
              ),
              if (surveysPrv.typeHouse.text.isNotEmpty &&
                  surveysPrv.typeHouse.text == 'Otro')
                SizedBox(height: size.height * .04),
              if (surveysPrv.typeHouse.text.isNotEmpty &&
                  surveysPrv.typeHouse.text == 'Otro')
                // #2
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cuál?',
                    hintext: ' Ingresar dato',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    controller: surveysPrv.typeHouseOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) => surveysPrv.setTypeHouseOther(val),
                  ),
                ),
              SizedBox(height: size.height * .04),
              //#3
              DropdownComponents(
                title: 'Tipo de techo',
                initialValue: 'CC',
                hintext: ' Seleccionar tipo de techo',
                items: const ['Eternit', 'Plástico', 'Zinc', 'Otro'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) => surveysPrv.setTypeCeiling(val.toString()),
              ),
              if (surveysPrv.typeCeiling.text.isNotEmpty &&
                  surveysPrv.typeCeiling.text == 'Otro')
                SizedBox(height: size.height * .04),
              if (surveysPrv.typeCeiling.text.isNotEmpty &&
                  surveysPrv.typeCeiling.text == 'Otro')
                // #4
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cuál?',
                    hintext: ' Ingresar dato',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    controller: surveysPrv.typeCeilingOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) => surveysPrv.setTypeCeilingOther(val),
                  ),
                ),

              SizedBox(height: size.height * .04),
              //#5
              DropdownComponents(
                title: 'Tipo de paredes',
                initialValue: 'CC',
                hintext: ' Seleccionar tipo de paredes',
                items: const [
                  'Bloque',
                  'Madera',
                  'Madera',
                  'Placa prefabiricada',
                  'Otro'
                ],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) => surveysPrv.setTypeOfWalls(val.toString()),
              ),
              if (surveysPrv.typeOfWalls.text.isNotEmpty &&
                  surveysPrv.typeOfWalls.text == 'Otro')
                SizedBox(height: size.height * .04),
              if (surveysPrv.typeOfWalls.text.isNotEmpty &&
                  surveysPrv.typeOfWalls.text == 'Otro')
                // #6
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cuál?',
                    hintext: ' Ingresar dato',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    controller: surveysPrv.typeOfWallsOthers,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) => surveysPrv.setTypeOfWallsOthers(val),
                  ),
                ),

              SizedBox(height: size.height * .04),
              //#7
              DropdownComponents(
                title: 'Tipo de piso',
                initialValue: 'CC',
                hintext: ' Seleccionar tipo de piso',
                items: const ['Baldosa', 'Cemento', 'Tierra', 'Madera'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) => surveysPrv.setTypeFloors(val.toString()),
              ),

              SizedBox(height: size.height * .04),
              //#8
              DropdownComponents(
                title: 'Tipo de red eléctrica pública',
                initialValue: 'CC',
                hintext: ' Seleccionar tipo de red',
                items: const ['Si', 'No'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) =>
                    surveysPrv.setTypeElectricalRed(val.toString()),
              ),

              SizedBox(height: size.height * .04),
              //#9
              DropdownComponents(
                title: 'Tipo de alcantarillado',
                initialValue: 'CC',
                hintext: ' Seleccionar tipo de alcantarillado',
                items: const ['Si', 'No'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) => surveysPrv.setTypeSewer(val.toString()),
              ),
              SizedBox(height: size.height * .04),
              //#10
              DropdownComponents(
                title: 'Tipo de sanitario',
                initialValue: 'CC',
                hintext: ' Seleccionar tipo de sanitario',
                items: const [
                  'Convencional',
                  'Letrina',
                  'Pozo séptico',
                  'No tiene'
                ],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) => surveysPrv.setTypeToilet(val.toString()),
              ),
              SizedBox(height: size.height * .04),
              //#11
              DropdownComponents(
                title: 'Acceso a telefonía',
                initialValue: 'CC',
                hintext: ' Seleccionar acceso a telefonía',
                items: const ['Si', 'No'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) =>
                    surveysPrv.setTelephoneAccess(val.toString()),
              ),

              SizedBox(height: size.height * .04),
              //#12
              DropdownComponents(
                title: 'Recolección de basura',
                initialValue: 'CC',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) =>
                    surveysPrv.setgGarbageCollection(val.toString()),
              ),
              SizedBox(height: size.height * .04),
              //#13
              DropdownComponents(
                title: 'Acueducto',
                initialValue: 'CC',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) => surveysPrv.setTypeAqueduct(val.toString()),
              ),

              SizedBox(height: size.height * .04),
              //#14
              DropdownComponents(
                title: 'Eliminación de basura',
                initialValue: 'CC',
                hintext: ' Seleccionar dato',
                items: const [
                  'Bota al patio',
                  'Entierra',
                  'Quema',
                  'Recolección'
                ],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) => surveysPrv.setDeleteTrash(val.toString()),
              ),
              SizedBox(height: size.height * .04),
              //#15
              DropdownComponents(
                title: '¿Dónde obtiene el agua para consumo?',
                initialValue: 'CC',
                hintext: ' Seleccionar dato',
                items: const ['Lluvia', 'Pozo séptico', 'Quebrada', 'Red'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) =>
                    surveysPrv.setWaterForConsumption(val.toString()),
              ),
              SizedBox(height: size.height * .04),
              //#16
              DropdownComponents(
                title: '¿Dónde obtiene la fuente de energía para cocina?',
                initialValue: 'CC',
                hintext: ' Seleccionar dato',
                items: const [
                  'Electrico',
                  'Gas',
                  'Gasolina',
                  'Leña',
                ],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) =>
                    surveysPrv.setCookingForEnery(val.toString()),
              ),

              SizedBox(height: size.height * .04),
              //#16
              DropdownComponents(
                title: '¿Dónde obtiene la fuente de energía en la finca?',
                initialValue: 'CC',
                hintext: ' Seleccionar dato',
                items: const [
                  'Bionergía',
                  'Gasolina',
                  'Red eléctrica',
                  'Solar',
                ],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) =>
                    surveysPrv.setEnergyOnTheFarm(val.toString()),
              ),

              SizedBox(height: size.height * .06),

              /*boton para continuar*/
              ButtonComponents(
                title: 'Continuar',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    /*navega a la pantalla #9 */
                    Navigator.pushNamed(
                      context,
                      MainRoutes.tenSurveysRoute,
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
