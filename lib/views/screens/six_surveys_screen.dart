import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #6 INFORMACIÓN SOCIAL
*/
class SixSurveysScreen extends StatefulWidget {
  const SixSurveysScreen({super.key});

  @override
  State<SixSurveysScreen> createState() => _SixSurveysScreenState();
}

class _SixSurveysScreenState extends State<SixSurveysScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<SurveysVisitRegistrationProvider>(context);
    return Scaffold(
      appBar: AppBar(),
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
                  title: 'INFORMACIÓN SOCIODEMOGRÁFICA DEL PRODUCTOR'),
              SizedBox(height: size.height * .02),
              const LinealPercentComponent(
                percent: (6 - 1) * (100 / 23) / 100,
                questions: '30',
                answers: '6',
              ),
              SizedBox(height: size.height * .04),
              //#1 estado civil
              DropdownComponents(
                title: 'Estado civil',
                hintext: ' Seleccionar estado civil',
                items: const [
                  'Soltero/A',
                  'Casado/A',
                  'Divoriciado/A',
                  'Unión libre',
                  'Otro',
                ],
                validator: (val) =>
                    ValidationInputs.inputTypeSelect(val.toString()),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Soltero/A':
                      surveysPrv.setStatusCivil('1');
                      break;
                    case 'Casado/A':
                      surveysPrv.setStatusCivil('2');
                      break;
                    case 'Divoriciado/A':
                      surveysPrv.setStatusCivil('3');
                      break;
                    case 'Unión libre':
                      surveysPrv.setStatusCivil('4');
                      break;
                    case 'Otro':
                      surveysPrv.setStatusCivil('5');
                      break;
                    default:
                  }
                },
              ),
              if (surveysPrv.statusCivil.text.isNotEmpty &&
                  surveysPrv.statusCivil.text == '5')
                SizedBox(height: size.height * .04),
              if (surveysPrv.statusCivil.text.isNotEmpty &&
                  surveysPrv.statusCivil.text == '5')
                //#2 OTRO estado civil
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cuál?',
                    hintext: ' Ingresar estado civil',
                    textInputAction: TextInputAction.next,
                    controller: surveysPrv.statusCivilOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) => surveysPrv.setStatusCivilOther(val),
                  ),
                ),
              SizedBox(height: size.height * .04),
              //#3 seleccionar etnia
              DropdownComponents(
                title: 'Etnia o comunidad',
                hintext: ' Seleccionar etnia o comunidad',
                items: const [
                  'Afrodecendiente',
                  'Gitano',
                  'Indígena',
                  'Raizal',
                  'Ninguno',
                  'Otro',
                ],
                validator: (val) =>
                    ValidationInputs.inputTypeSelect(val.toString()),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Afrodecendiente':
                      surveysPrv.setEthhicGroup('1');
                      break;
                    case 'Gitano':
                      surveysPrv.setEthhicGroup('2');
                      break;
                    case 'Indígena':
                      surveysPrv.setEthhicGroup('3');
                      break;
                    case 'Ninguno':
                      surveysPrv.setEthhicGroup('4');
                      break;
                    case 'Otro':
                      surveysPrv.setEthhicGroup('5');
                      break;

                    default:
                  }
                },
              ),
              if (surveysPrv.ethhicGroup.text.isNotEmpty &&
                  surveysPrv.ethhicGroup.text == '5')
                SizedBox(height: size.height * .04),
              if (surveysPrv.ethhicGroup.text.isNotEmpty &&
                  surveysPrv.ethhicGroup.text == '5')
                //#4 OTRO etnia
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cuál?',
                    hintext: ' Ingresar etnia o comunidad',
                    textInputAction: TextInputAction.next,
                    controller: surveysPrv.ethhicGroupOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) => surveysPrv.setEthhicGroupOther(val),
                  ),
                ),
              SizedBox(height: size.height * .04),
              DropdownComponents(
                title: '¿ Cúal es el nivel educativo alcanzado?',
                hintext: ' Seleccionar nivel educativo',
                items: const [
                  'Primario',
                  'Secundario',
                  'Técnico',
                  'Profesional',
                  'Otro'
                ],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Primario':
                      surveysPrv.setEducationalLevel('1');
                      break;
                    case 'Secundario':
                      surveysPrv.setEducationalLevel('2');
                      break;
                    case 'Técnico':
                      surveysPrv.setEducationalLevel('3');
                      break;
                    case 'Profesional':
                      surveysPrv.setEducationalLevel('4');
                      break;
                    case 'Otro':
                      surveysPrv.setEducationalLevel('5');
                      break;
                    default:
                  }
                },
              ),
              if (surveysPrv.educationalLevel.text.isNotEmpty &&
                  surveysPrv.educationalLevel.text == '5')
                SizedBox(height: size.height * .04),
              if (surveysPrv.educationalLevel.text.isNotEmpty &&
                  surveysPrv.educationalLevel.text == '5')
                //#4 OTRO etnia
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cuál?',
                    hintext: ' Ingresar nivel educativo',
                    textInputAction: TextInputAction.next,
                    controller: surveysPrv.educationalLevelOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setEducationalLevelOther(val),
                  ),
                ),
              SizedBox(height: size.height * .04),
              //# 5 titulo obtenido
              InputsComponent(
                title: 'Titulo obtenido',
                hintext: ' Ingresar titulo obtenido',
                controller: surveysPrv.obtainerTitle,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setObtainerTitle(val),
              ),

              SizedBox(height: size.height * .04),
              //#14
              DropdownComponents(
                title: '¿Pertenece a la federación nacional de Cacaoteros?',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (val) =>
                    ValidationInputs.inputTypeSelect(val.toString()),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPrv.setNationalFederation('1');
                      break;
                    case 'No':
                      surveysPrv.setNationalFederation('2');
                      break;
                    default:
                  }
                },
              ),
              if (surveysPrv.nationalFederation.text.isNotEmpty &&
                  surveysPrv.nationalFederation.text == '1')
                SizedBox(height: size.height * .04),
              if (surveysPrv.nationalFederation.text.isNotEmpty &&
                  surveysPrv.nationalFederation.text == '1')
                //#15
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: DropdownComponents(
                    title:
                        '¿Cuenta o está en proceso de abtención de algún sello de certificación?',
                    hintext: ' Seleccionar dato',
                    items: const ['Si', 'No'],
                    validator: (val) =>
                        ValidationInputs.inputTypeSelect(val.toString()),
                    onChanged: (val) {
                      switch (val.toString()) {
                        case 'Si':
                          surveysPrv.setNationalFederationOther('1');
                          break;
                        case 'No':
                          surveysPrv.setNationalFederationOther('2');
                          break;
                        default:
                      }
                    },
                  ),
                ),
              if (surveysPrv.nationalFederationOther.text == '1' &&
                  surveysPrv.nationalFederationOther.text.isNotEmpty)
                SizedBox(height: size.height * .04),
              if (surveysPrv.nationalFederationOther.text == '1' &&
                  surveysPrv.nationalFederationOther.text.isNotEmpty)
                //#15
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cuál?',
                    hintext: ' Ingresar dato',
                    textInputAction: TextInputAction.next,
                    controller: surveysPrv.nationalFederationOtherYes,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setNationalFederationOtherYes(val),
                  ),
                ),
              SizedBox(height: size.height * .04),
              //#16
              DropdownComponents(
                title: '¿Están afiliados al sistema de seguridad social?',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (val) =>
                    ValidationInputs.inputTypeSelect(val.toString()),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPrv.setSocialSecurity('1');
                      break;
                    case 'No':
                      surveysPrv.setSocialSecurity('2');
                      break;
                    default:
                  }
                },
              ),
              if (surveysPrv.socialSecurity.text == '1' &&
                  surveysPrv.socialSecurity.text.isNotEmpty)
                SizedBox(height: size.height * .04),
              //#17
              if (surveysPrv.socialSecurity.text == '1' &&
                  surveysPrv.socialSecurity.text.isNotEmpty)
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: DropdownComponents(
                    title: 'Tipo de afiliación',
                    hintext: ' Seleccionar dato',
                    items: const ['Contributivo', 'Subsidiado'],
                    validator: (val) =>
                        ValidationInputs.inputTypeSelect(val.toString()),
                    onChanged: (val) =>
                        surveysPrv.setSocialSecurityOther(val.toString()),
                  ),
                ),

              SizedBox(height: size.height * .04),
              //#18
              DropdownComponents(
                title: 'Tipo de mano de obra para el cultivo de cacao',
                hintext: ' Seleccionar dato',
                items: const ['Administrativo', 'Familiar', 'Propietario'],
                validator: (val) =>
                    ValidationInputs.inputTypeSelect(val.toString()),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Administrativo':
                      surveysPrv.setTypeLabour('1');
                      break;
                    case 'Familiar':
                      surveysPrv.setTypeLabour('2');
                      break;
                    case 'Propietario':
                      surveysPrv.setTypeLabour('3');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .04),
              //#19
              InputsDatesComponent(
                title:
                    'Número de días al mes que labora en el cultivo de cacao',
                hintext: 'Ingresar número de días',
                maxLength: 2,
                controller: surveysPrv.numberDayFarm,
                validator: (val) => ValidationInputs.validateDayOfMonth(val),
                onChanged: (val) => surveysPrv.setNumberDayFarm(val),
              ),
              SizedBox(height: size.height * .04),
              InputsDatesComponent(
                title:
                    'Número de días al mes que fuera labora en el cultivo de cacao',
                hintext: 'Ingresar número de días',
                maxLength: 2,
                controller: surveysPrv.numberDaysMonthFarm,
                validator: (val) => ValidationInputs.validateDayOfMonth(val),
                onChanged: (val) => surveysPrv.setNumberDaysMonthFarm(val),
              ),

              SizedBox(height: size.height * .06),
              /*boton para continuar*/
              ButtonComponents(
                title: 'Continuar',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamed(
                      context,
                      MainRoutes.sevenSurveysRoute,
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
