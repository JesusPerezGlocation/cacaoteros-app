import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla número #7 información bancaria
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
                  title:
                      'INFORMACIÓN BÁSICA DEL CACAOCULTOR > INFORMACIÓN BANCARIA'),
              SizedBox(height: size.height * .02),

              const LinealPercentComponent(
                percent: (7 - 1) * (100 / 23) / 100,
                questions: '30',
                answers: '7',
              ),
              SizedBox(height: size.height * .04),
              //#1
              DropdownComponents(
                title: '¿Posee cuenta bancaria?',
                initialValue: 'CC',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPrv.setTypeAccountBank('1');
                      break;
                    case 'No':
                      surveysPrv.setTypeAccountBank('2');
                      break;
                    default:
                  }
                },
              ),

              if (surveysPrv.typeAccountBank.text.isNotEmpty &&
                  surveysPrv.typeAccountBank.text == '1')
                SizedBox(height: size.height * .04),
              if (surveysPrv.typeAccountBank.text.isNotEmpty &&
                  surveysPrv.typeAccountBank.text == '1')
                // #2
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: 'Qué entidad',
                    hintext: ' Ingresar entidad',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    controller: surveysPrv.typeAccountBankOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) => surveysPrv.setTypeAccountBankOther(val),
                  ),
                ),

              SizedBox(height: size.height * .04),
              //#3
              DropdownComponents(
                title: '¿Posee crédito agropecuario?',
                initialValue: 'CC',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPrv.setAgroCulturalCredit('1');
                      break;
                    case 'No':
                      surveysPrv.setAgroCulturalCredit('2');
                      break;
                    default:
                  }
                },
              ),
              if (surveysPrv.agroCulturalCredit.text.isNotEmpty &&
                  surveysPrv.agroCulturalCredit.text == '1')
                SizedBox(height: size.height * .04),
              if (surveysPrv.agroCulturalCredit.text.isNotEmpty &&
                  surveysPrv.agroCulturalCredit.text == '1')
                // #4
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿En cuál entidad tiene crédito agropecuario?',
                    hintext: ' Ingresar entidad',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    controller: surveysPrv.agroCulturalCreditOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setAgroCulturalCreditOther(val),
                  ),
                ),

              SizedBox(height: size.height * .04),
              //#5
              DropdownComponents(
                title: '¿Ha sido favorecido con crédito para Cacao?',
                initialValue: 'CC',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPrv.setFavoredCreditCultural('1');
                      break;
                    case 'No':
                      surveysPrv.setFavoredCreditCultural('2');
                      break;
                    default:
                  }
                },
              ),

              if (surveysPrv.favoredCreditCultural.text.isNotEmpty &&
                  surveysPrv.favoredCreditCultural.text == '1')
                SizedBox(height: size.height * .04),
              //#6
              if (surveysPrv.favoredCreditCultural.text.isNotEmpty &&
                  surveysPrv.favoredCreditCultural.text == '1')
                DropdownComponents(
                  title: '¿Qué actividad financió con el crédito?',
                  initialValue: 'CC',
                  hintext: ' Seleccionar dato',
                  items: const [
                    'Infraestructura',
                    'Renovación',
                    'Siembra nueva',
                    'Sostenimiento'
                  ],
                  validator: (value) => ValidationInputs.inputTypeSelect(value),
                  onChanged: (val) {
                    switch (val.toString()) {
                      case 'Infraestructura':
                        surveysPrv.setActivityFavoredWithCredit('1');
                        break;
                      case 'Renovación':
                        surveysPrv.setActivityFavoredWithCredit('2');
                        break;
                      case 'Siembra nueva':
                        surveysPrv.setActivityFavoredWithCredit('3');
                        break;
                      case 'Sostenimiento':
                        surveysPrv.setActivityFavoredWithCredit('4');
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
                  if (formKey.currentState!.validate()) {
                    /*navega hacia la pantalla #8*/
                    Navigator.pushNamed(
                      context,
                      MainRoutes.eightSurveyRoute,
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
