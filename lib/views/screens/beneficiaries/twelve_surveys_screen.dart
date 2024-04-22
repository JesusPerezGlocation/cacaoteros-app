import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/routes/main_routes.dart';

/*
pantalla #12 INFORMACIÓN GENERAL
*/
class TwelveSurveysScreen extends StatefulWidget {
  const TwelveSurveysScreen({super.key});

  @override
  State<TwelveSurveysScreen> createState() => _TwelveSurveysScreenState();
}

class _TwelveSurveysScreenState extends State<TwelveSurveysScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<BeneficiariesSurveysProvider>(context);
    return Scaffold(
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
                      'LISTA DE CHEQUEO PARA CRITERIOS DE SELECCIÓN DE BENEFICIOS PRODUCTORES DEL PROYECTO DE TRAZABILIDAD CONCACAO'),
              SizedBox(height: size.height * .02),
              const LinealPercentComponent(
                colorOne: PaletteColorsTheme.secondaryColor,
                colorTwo: PaletteColorsTheme.colorMagentaTwo,
                percent: (12 - 1) * (100 / 13) / 100,
                questions: '30',
                answers: '12',
              ),
              SizedBox(height: size.height * .04),
              //#1
              DropdownComponents(
                title: '¿Es propietario o poseedor de predio rural?',
                initialValue: '-',
                items: const ['Cumple', 'No cumple'],
                colorInputs: PaletteColorsTheme.secondaryColor,
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Cumple':
                      surveysPrv.setRuralPossessorOwner('1');
                      break;
                    case 'No cumple':
                      surveysPrv.setRuralPossessorOwner('2');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .02),
              //#2
              InputsComponent(
                title: 'Observaciones',
                hintext: ' Ingresar observación',
                maxLine: 4,
                colorInputs: PaletteColorsTheme.secondaryColor,
                controller: surveysPrv.obsevationRuralPossestion,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) =>
                    surveysPrv.setObsevationRuralPossestion(val),
              ),

              SizedBox(height: size.height * .04),
              //#5
              DropdownComponents(
                title:
                    '¿Cuenta con un número mínimo de 500 árboles de cacao por unidad productiva?',
                initialValue: '-',
                items: const ['Cumple', 'No cumple'],
                colorInputs: PaletteColorsTheme.secondaryColor,
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Cumple':
                      surveysPrv.setFiveHundredTrees('1');
                      break;
                    case 'No cumple':
                      surveysPrv.setFiveHundredTrees('2');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .02),
              //#6
              InputsComponent(
                title: 'Observaciones',
                hintext: ' Ingresar observación',
                maxLine: 4,
                colorInputs: PaletteColorsTheme.secondaryColor,
                controller: surveysPrv.observationfiveHundredTrees,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) =>
                    surveysPrv.setObservationfiveHundredTrees(val),
              ),
              SizedBox(height: size.height * .04),
              //#7
              DropdownComponents(
                title: '¿Vive con su núcleo familiar?',
                initialValue: '-',
                items: const ['Cumple', 'No cumple'],
                colorInputs: PaletteColorsTheme.secondaryColor,
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Cumple':
                      surveysPrv.setFamilyNucleo('1');
                      break;
                    case 'No cumple':
                      surveysPrv.setFamilyNucleo('2');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .02),
              //#8
              InputsComponent(
                title: 'Observaciones',
                hintext: ' Ingresar observación',
                maxLine: 4,
                colorInputs: PaletteColorsTheme.secondaryColor,
                controller: surveysPrv.observationfamilyNucleo,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setObservationFamilyNucleo(val),
              ),
              SizedBox(height: size.height * .04),
              //#9
              DropdownComponents(
                title: '¿Posee equipo celular y conocimientos tecnólogicos?',
                initialValue: '-',
                items: const ['Cumple', 'No cumple'],
                colorInputs: PaletteColorsTheme.secondaryColor,
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Cumple':
                      surveysPrv.setphoneAndTecnology('1');
                      break;
                    case 'No cumple':
                      surveysPrv.setphoneAndTecnology('2');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .02),
              //#10
              InputsComponent(
                title: 'Observaciones',
                hintext: ' Ingresar observación',
                maxLine: 4,
                colorInputs: PaletteColorsTheme.secondaryColor,
                controller: surveysPrv.observationphoneAndTecnology,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) =>
                    surveysPrv.setObservationphoneAndTecnology(val),
              ),
              SizedBox(height: size.height * .04),
              //#11
              DropdownComponents(
                title: '¿Cuenta con el servicio de conectividad a internet?',
                initialValue: '-',
                items: const ['Cumple', 'No cumple'],
                colorInputs: PaletteColorsTheme.secondaryColor,
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Cumple':
                      surveysPrv.setEthernetServices('1');
                      break;
                    case 'No cumple':
                      surveysPrv.setEthernetServices('2');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .02),
              //#12
              InputsComponent(
                title: 'Observaciones',
                hintext: ' Ingresar observación',
                maxLine: 4,
                colorInputs: PaletteColorsTheme.secondaryColor,
                controller: surveysPrv.observationethernetServices,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) =>
                    surveysPrv.setObservationEthernetServices(val),
              ),
              SizedBox(height: size.height * .06),
              /*boton para continuar*/
              ButtonComponents(
                colorButton: PaletteColorsTheme.secondaryColor,
                title: 'Continuar',
                onPressed: () {
                  //Todo: debe validar
                  /*navega a la pantalla #13*/
                  Navigator.pushNamed(
                    context,
                    MainRoutes.thirteenThreeSurveysRoute,
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
