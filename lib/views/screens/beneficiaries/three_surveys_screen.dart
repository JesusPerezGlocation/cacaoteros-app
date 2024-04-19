import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #3 INFORMACIÓN SOCIODEMOGRÁFICA DEL PRODUCTOR
*/
class ThreeSurveysScreen extends StatefulWidget {
  const ThreeSurveysScreen({super.key});

  @override
  State<ThreeSurveysScreen> createState() => _ThreeSurveysScreenState();
}

class _ThreeSurveysScreenState extends State<ThreeSurveysScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<BeneficiariesSurveysProvider>(context);
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
                percent: (3 - 1) * (100 / 23) / 100,
                questions: '30',
                answers: '3',
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
              //#5
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
              DropdownComponents(
                title: ' Seleccionar tipo de tenencia de la tierra',
                initialValue: '-',
                hintext: ' Seleccionar tipo de tenencia',
                items: const [
                  'Carta venta',
                  'Escritura',
                  'Resguardo indígena',
                  'Consejo comunitario',
                  'Sana posesión'
                ],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Carta venta':
                      surveysPrv.setPosessionLandTypee('1');
                      break;
                    case 'Escritura':
                      surveysPrv.setPosessionLandTypee('2');
                      break;
                    case 'Resguardo indígena':
                      surveysPrv.setPosessionLandTypee('3');
                      break;
                    case 'Consejo comunitario':
                      surveysPrv.setPosessionLandTypee('4');
                      break;
                    case 'Sana posesión':
                      surveysPrv.setPosessionLandTypee('5');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .04),
              //#
              DropdownComponents(
                title: ' Seleccionar origen de la tenencia de la tierra',
                initialValue: '-',
                hintext: ' Seleccionar tipo de tenencia',
                items: const ['Compra', 'Herencia', 'Subsidio estatal'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Compra':
                      surveysPrv.setOriginPosessionLand('1');
                      break;
                    case 'Herencia':
                      surveysPrv.setOriginPosessionLand('2');
                      break;
                    case 'Subsidio estatal':
                      surveysPrv.setOriginPosessionLand('3');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .04),
              //#
              DropdownComponents(
                title: ' Seleccionar posesión sobre el cultivo',
                initialValue: '-',
                hintext: ' Seleccionar tipo de posesión',
                items: const ['Arrendatario', 'Sociedad', 'Propietario'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Arrendatario':
                      surveysPrv.setPossesionOverCultivation('1');
                      break;
                    case 'Sociedad':
                      surveysPrv.setPossesionOverCultivation('2');
                      break;
                    case 'Propietario':
                      surveysPrv.setPossesionOverCultivation('3');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .04),

              //#
              DropdownComponents(
                title: '¿Pertenece a alguna asociación?',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (val) =>
                    ValidationInputs.inputTypeSelect(val.toString()),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPrv.setHasOrganization('1');
                      break;
                    case 'No':
                      surveysPrv.setHasOrganization('2');
                      break;
                    default:
                  }
                },
              ),

              if (surveysPrv.hasOrganization.text == '1' &&
                  surveysPrv.hasOrganization.text.isNotEmpty)
                SizedBox(height: size.height * .04),
              if (surveysPrv.hasOrganization.text == '1' &&
                  surveysPrv.hasOrganization.text.isNotEmpty)
                //#15
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cuál?',
                    hintext: ' Ingresar dato',
                    textInputAction: TextInputAction.next,
                    controller: surveysPrv.hasOrganizationOtherYes,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setHasOrganizationOtherYes(val),
                  ),
                ),
              SizedBox(height: size.height * .04),
              DropdownComponents(
                title: '¿Pertenece a la federación nacional de cacaoteros?',
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
                  surveysPrv.nationalFederation.text == '2')
                SizedBox(height: size.height * .04),
              if (surveysPrv.nationalFederation.text.isNotEmpty &&
                  surveysPrv.nationalFederation.text == '2')
                //#
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: DropdownComponents(
                    title:
                        '¿Esta interesado en iniciar el proceso de cedulación con Fedecacao?',
                    hintext: ' Seleccionar dato',
                    items: const ['Si', 'No'],
                    validator: (val) =>
                        ValidationInputs.inputTypeSelect(val.toString()),
                    onChanged: (val) {
                      switch (val.toString()) {
                        case 'Si':
                          surveysPrv.setInterestedFederationYesOrNot('1');
                          break;
                        case 'No':
                          surveysPrv.setInterestedFederationYesOrNot('2');
                          break;
                        default:
                      }
                    },
                  ),
                ),

              if (surveysPrv.nationalFederation.text.isNotEmpty &&
                  surveysPrv.nationalFederation.text == '2')
                SizedBox(height: size.height * .04),
              if (surveysPrv.nationalFederation.text.isNotEmpty &&
                  surveysPrv.nationalFederation.text == '2')
                //#
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: DropdownComponents(
                    title:
                        'Observaciones: se procede a digilenciar el formato de afiliación de Fedecacao',
                    hintext: ' Seleccionar dato',
                    items: const ['Si', 'No'],
                    validator: (val) =>
                        ValidationInputs.inputTypeSelect(val.toString()),
                    onChanged: (val) {
                      switch (val.toString()) {
                        case 'Si':
                          surveysPrv.setObservationFederationYesOrNot('1');
                          break;
                        case 'No':
                          surveysPrv.setObservationFederationYesOrNot('2');
                          break;
                        default:
                      }
                    },
                  ),
                ),
              SizedBox(height: size.height * .04),
              //#
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
              //#
              DropdownComponents(
                title:
                    '¿Cuenta o está en proceso de obtención del algún sello de certificación?',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (val) =>
                    ValidationInputs.inputTypeSelect(val.toString()),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPrv.setGetobtainingCertificate('1');
                      break;

                    case 'No':
                      surveysPrv.setGetobtainingCertificate('2');
                      break;
                    default:
                  }
                },
              ),

              if (surveysPrv.obtainingCertificate.text.isNotEmpty &&
                  surveysPrv.obtainingCertificate.text == '1')
                SizedBox(height: size.height * .04),

              if (surveysPrv.obtainingCertificate.text.isNotEmpty &&
                  surveysPrv.obtainingCertificate.text == '1')
                //#
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cúal?',
                    hintext: 'Ingresar proceso',
                    controller: surveysPrv.obtainingCertificateOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setGetobtainingCertificateOther(val),
                  ),
                ),
              SizedBox(height: size.height * .04),
              //#
              DropdownComponents(
                title: 'Tipo de mano de obra para el cultivo de cacao',
                hintext: ' Seleccionar dato',
                items: const [
                  'Administrativo',
                  'Familiar',
                  'Propietario',
                  'Otro'
                ],
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
                    case 'Otro':
                      surveysPrv.setTypeLabour('4');
                      break;
                    default:
                  }
                },
              ),
              if (surveysPrv.typeLabour.text.isNotEmpty &&
                  surveysPrv.typeLabour.text == '4')
                SizedBox(height: size.height * .04),
              if (surveysPrv.typeLabour.text.isNotEmpty &&
                  surveysPrv.typeLabour.text == '4')
                //#
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cúal?',
                    hintext: 'Ingresar mano de obra',
                    controller: surveysPrv.typeLabourOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) => surveysPrv.setTypeLabourOther(val),
                  ),
                ),
              SizedBox(height: size.height * .04),
              //#19
              InputsDatesComponent(
                title:
                    'Número de días al mes que labora en el cultivo de cacao',
                hintext: 'Ingresar número de días',
                maxLength: 2,
                controller: surveysPrv.numberDayFarm,
                keyboardType: TextInputType.number,
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
                keyboardType: TextInputType.number,
                validator: (val) => ValidationInputs.validateDayOfMonth(val),
                onChanged: (val) => surveysPrv.setNumberDaysMonthFarm(val),
              ),

              SizedBox(height: size.height * .06),
              /*boton para continuar*/
              ButtonComponents(
                title: 'Continuar',
                onPressed: () {
                  //!!aun no esta validando, cuando cambie el tipo de input activar
                  if (formKey.currentState!.validate()) {}
                  Navigator.pushNamed(
                    context,
                    MainRoutes.elevenSurveysRoute,
                  );
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
