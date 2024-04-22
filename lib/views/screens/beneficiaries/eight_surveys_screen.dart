import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #8 INFORMACIÓN DE PROYECTOS
*/
class EightSurveysScreen extends StatefulWidget {
  const EightSurveysScreen({super.key});

  @override
  State<EightSurveysScreen> createState() => _EightSurveysScreenState();
}

class _EightSurveysScreenState extends State<EightSurveysScreen> {
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
                  title: 'INFORMACIÓN DE POSTCOSECHA',
                  color: PaletteColorsTheme.secondaryColor),
              SizedBox(height: size.height * .02),

              const LinealPercentComponent(
                colorOne: PaletteColorsTheme.secondaryColor,
                colorTwo: PaletteColorsTheme.colorMagentaTwo,
                percent: (8 - 1) * (100 / 13) / 100,
                questions: '30',
                answers: '8',
              ),
              SizedBox(height: size.height * .04),
              //#
              InputsComponent(
                title: 'Producción total de cosechada en el último año',
                hintext: ' Ingresar KG',
                colorInputs: PaletteColorsTheme.secondaryColor,
                keyboardType: TextInputType.number,
                controller: surveysPrv.totalCropProduction,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setTotalCropProduction(val),
              ),

              SizedBox(height: size.height * .04),
              //#
              DropdownComponents(
                  title: 'Posee infraestructura de beneficio',
                  hintext: ' Seleccionar tipo infraestructura',
                  items: const ['Si', 'No'],
                  colorInputs: PaletteColorsTheme.secondaryColor,
                  validator: (val) => ValidationInputs.inputTypeSelect(val),
                  onChanged: (val) {
                    switch (val.toString()) {
                      case 'Si':
                        surveysPrv.setBenefitsInfrastructure('1');
                        break;
                      case 'No':
                        surveysPrv.setBenefitsInfrastructure('2');
                        break;
                      default:
                    }
                  }),
              SizedBox(height: size.height * .04),
              //#
              DropdownComponents(
                title: '¿Cómo vende el grano?',
                hintext: ' Seleccionar dato',
                colorInputs: PaletteColorsTheme.secondaryColor,
                items: const ['En seco', 'En baba'],
                validator: (val) =>
                    ValidationInputs.inputTypeSelect(val.toString()),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'En seco':
                      surveysPrv.setSellTheGrain('1');
                      break;
                    case 'En baba':
                      surveysPrv.setSellTheGrain('2');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .04),
              //#
              DropdownComponents(
                title:
                    '¿Que método utiliza para realizar el proceso de fermentación?',
                hintext: ' Seleccionar dato',
                colorInputs: PaletteColorsTheme.secondaryColor,
                items: const [
                  'En cajón',
                  'En barril',
                  'En costal',
                  'No fermenta',
                  'Otro'
                ],
                validator: (val) =>
                    ValidationInputs.inputTypeSelect(val.toString()),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'En cajón':
                      surveysPrv.setFermentationProcess('1');
                      break;
                    case 'En barril':
                      surveysPrv.setFermentationProcess('2');
                      break;
                    case 'En costal':
                      surveysPrv.setFermentationProcess('3');
                      break;
                    case 'No fermenta':
                      surveysPrv.setFermentationProcess('4');
                      break;
                    case 'Otro':
                      surveysPrv.setFermentationProcess('5');
                      break;
                    default:
                  }
                },
              ),
              if (surveysPrv.fermentationProcess.text.isNotEmpty &&
                  surveysPrv.fermentationProcess.text == '5')
                SizedBox(height: size.height * .04),
              //#
              if (surveysPrv.fermentationProcess.text.isNotEmpty &&
                  surveysPrv.fermentationProcess.text == '5')
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cúal?',
                    hintext: ' Ingresar proceso de fermentación',
                    colorInputs: PaletteColorsTheme.secondaryColor,
                    textInputAction: TextInputAction.next,
                    controller: surveysPrv.fermentationProcessOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setFermentationProcessOther(val),
                  ),
                ),
              SizedBox(height: size.height * .04),
              InputsComponent(
                title: '¿Cúal es el tiempo de fermentación?',
                hintext: ' Ingrese el tiempo en días',
                colorInputs: PaletteColorsTheme.secondaryColor,
                keyboardType: TextInputType.number,
                controller: surveysPrv.fermentationTime,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setFermentationTime(val),
              ),
              SizedBox(height: size.height * .04),
              //#
              DropdownComponents(
                title: '¿Cual es el método de secado que utiliza?',
                hintext: ' Seleccionar método',
                colorInputs: PaletteColorsTheme.secondaryColor,
                items: const ['Al sol', 'Secado artificial', 'No lo seca'],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Al sol':
                      surveysPrv.setDryingMethod('1');
                      break;
                    case 'Secado artificial':
                      surveysPrv.setDryingMethod('2');
                      break;
                    case 'No lo seca':
                      surveysPrv.setDryingMethod('3');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .04),
              //#
              DropdownComponents(
                title: '¿Dónde seca el cacao?',
                hintext: ' Seleccionar dato',
                colorInputs: PaletteColorsTheme.secondaryColor,
                items: const [
                  'Costal',
                  'Patio de cemento',
                  'Marquesina',
                  'Plástico en suelo',
                  'Otro'
                ],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Costal':
                      surveysPrv.setWhereCocoaIsDried('1');
                      break;
                    case 'Patio de cemento':
                      surveysPrv.setWhereCocoaIsDried('2');
                      break;
                    case 'Marquesina':
                      surveysPrv.setWhereCocoaIsDried('3');
                      break;
                    case 'Plástico en suelo':
                      surveysPrv.setWhereCocoaIsDried('4');
                      break;
                    case 'Otro':
                      surveysPrv.setWhereCocoaIsDried('5');
                      break;
                    default:
                  }
                },
              ),
              if (surveysPrv.whereCocoaIsDried.text.isNotEmpty &&
                  surveysPrv.whereCocoaIsDried.text == '5')
                SizedBox(height: size.height * .04),
              //#
              if (surveysPrv.whereCocoaIsDried.text.isNotEmpty &&
                  surveysPrv.whereCocoaIsDried.text == '5')
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cúal?',
                    hintext: ' Ingresar dato',
                    colorInputs: PaletteColorsTheme.secondaryColor,
                    textInputAction: TextInputAction.next,
                    controller: surveysPrv.whereCocoaIsDriedOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setWhereCocoaIsDriedOther(val),
                  ),
                ),

              SizedBox(height: size.height * .06),
              /* boton para continuar */
              ButtonComponents(
                colorButton: PaletteColorsTheme.secondaryColor,
                title: 'Continuar',
                onPressed: () {
                  /*navega a la pantalla #9 */
                  Navigator.pushNamed(
                    context,
                    MainRoutes.nineSurveysRoute,
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
