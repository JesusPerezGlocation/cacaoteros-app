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
                  title: 'INFORMACIÓN DE COMERCIALIZACIÓN'),
              SizedBox(height: size.height * .02),

              const LinealPercentComponent(
                percent: (9 - 1) * (100 / 13) / 100,
                questions: '30',
                answers: '9',
              ),

              SizedBox(height: size.height * .04),
              //#1
              DropdownComponents(
                title: 'Destino del grano de cacao',
                initialValue: 'CC',
                hintext: ' Seleccionar destino',
                items: const [
                  'Asociación',
                  'Cooperativa',
                  'Intermediario',
                  'Empresa',
                  'Transformadora',
                  'Otro'
                ],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Asociación':
                      surveysPrv.setDestinationOfTheCocoa('1');
                      break;
                    case 'Cooperativa':
                      surveysPrv.setDestinationOfTheCocoa('2');
                      break;
                    case 'Intermediario':
                      surveysPrv.setDestinationOfTheCocoa('3');
                      break;
                    case 'Empresa':
                      surveysPrv.setDestinationOfTheCocoa('4');
                      break;
                    case 'Transformadora':
                      surveysPrv.setDestinationOfTheCocoa('5');
                      break;
                    case 'Otro':
                      surveysPrv.setDestinationOfTheCocoa('6');
                      break;
                    default:
                  }
                },
              ),
              if (surveysPrv.destinationOfTheCocoa.text.isNotEmpty &&
                  surveysPrv.destinationOfTheCocoa.text == '6')
                SizedBox(height: size.height * .04),
              if (surveysPrv.destinationOfTheCocoa.text.isNotEmpty &&
                  surveysPrv.destinationOfTheCocoa.text == '6')
                // #2
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cuál?',
                    hintext: ' Ingresar destino',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    controller: surveysPrv.destinationOfTheCocoaOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setDestinationOfTheCocoaOther(val),
                  ),
                ),
              SizedBox(height: size.height * .04),
              //#3
              InputsComponent(
                title: 'Nombre de a quien le comecializa el grano de cacao',
                hintext: ' Ingresar nombre',
                textInputAction: TextInputAction.next,
                controller: surveysPrv.nameComercializationCocoa,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) =>
                    surveysPrv.setNameComercializationCocoa(val),
              ),
              SizedBox(height: size.height * .04),
              //4
              InputsComponent(
                title: 'Municipio donde comercializa el grano',
                hintext: ' Ingresar municipio',
                textInputAction: TextInputAction.next,
                controller: surveysPrv.comercializationMunicipalityCocoa,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) =>
                    surveysPrv.setComercializationMunicipalityCocoa(val),
              ),

              SizedBox(height: size.height * .06),

              /*boton para continuar*/
              ButtonComponents(
                title: 'Continuar',
                onPressed: () {
                  /*navega a la pantalla #9 */
                  Navigator.pushNamed(
                    context,
                    MainRoutes.tenSurveysRoute,
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
