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
                onChanged: (val) => surveysPrv.setStatusCivil(val.toString()),
              ),
              if (surveysPrv.statusCivil.text.isNotEmpty &&
                  surveysPrv.statusCivil.text == 'Otro')
                SizedBox(height: size.height * .04),
              if (surveysPrv.statusCivil.text.isNotEmpty &&
                  surveysPrv.statusCivil.text == 'Otro')
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
                onChanged: (val) => surveysPrv.setEthhicGroup(val.toString()),
              ),
              if (surveysPrv.ethhicGroup.text.isNotEmpty &&
                  surveysPrv.ethhicGroup.text == 'Otro')
                SizedBox(height: size.height * .04),
              if (surveysPrv.ethhicGroup.text.isNotEmpty &&
                  surveysPrv.ethhicGroup.text == 'Otro')
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
                onChanged: (val) =>
                    surveysPrv.setEducationalLevel(val.toString()),
              ),
              if (surveysPrv.educationalLevel.text.isNotEmpty &&
                  surveysPrv.educationalLevel.text == 'Otro')
                SizedBox(height: size.height * .04),
              if (surveysPrv.educationalLevel.text.isNotEmpty &&
                  surveysPrv.educationalLevel.text == 'Otro')
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
              //# 6 tipo de tenencia de la tierra
              DropdownComponents(
                title: 'Tipo de tenencia de la tierra',
                hintext: ' Seleccionar tipo de tenencia',
                items: const [
                  'Escritura',
                  'Consejo comunitario',
                  'Sana posesión',
                  'Carta venta',
                  'Resguardo indigena',
                  'Otro'
                ],
                validator: (val) =>
                    ValidationInputs.inputTypeSelect(val.toString()),
                onChanged: (val) => surveysPrv.setTypeOfTenure(val.toString()),
              ),
              if (surveysPrv.typeOfTenure.text.isNotEmpty &&
                  surveysPrv.typeOfTenure.text == 'Otro')
                SizedBox(height: size.height * .04),
              if (surveysPrv.typeOfTenure.text.isNotEmpty &&
                  surveysPrv.typeOfTenure.text == 'Otro')
                //#7
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cuál?',
                    hintext: ' Ingresar tipo de tenencia',
                    textInputAction: TextInputAction.next,
                    controller: surveysPrv.typeOfTenureOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) => surveysPrv.setTypeOfTenureOther(val),
                  ),
                ),

              SizedBox(height: size.height * .04),
              //#8
              DropdownComponents(
                title: 'Origen de la tenencia de la tierra',
                hintext: ' Seleccionar origen',
                items: const ['Compra', 'Herencia', 'Otro'],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) =>
                    surveysPrv.setOriginProperty(val.toString()),
              ),
              if (surveysPrv.originProperty.text.isNotEmpty &&
                  surveysPrv.originProperty.text == 'Otro')
                SizedBox(height: size.height * .04),
              if (surveysPrv.originProperty.text.isNotEmpty &&
                  surveysPrv.originProperty.text == 'Otro')
                //#9
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cuál?',
                    hintext: ' Ingresar origen',
                    textInputAction: TextInputAction.next,
                    controller: surveysPrv.originPropertyOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) => surveysPrv.setOriginPropertyOther(val),
                  ),
                ),
              SizedBox(height: size.height * .04),
              //#10 tipo de poseción sobre el cultivo
              DropdownComponents(
                title: 'Tipo de posesión sobre el cultivo',
                hintext: ' Seleccionar tipo posesión',
                items: const ['Arrendatario', 'Propietario', 'Otro'],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) => surveysPrv.setTypePossesion(val.toString()),
              ),
              if (surveysPrv.typePossesion.text.isNotEmpty &&
                  surveysPrv.typePossesion.text == 'Otro')
                SizedBox(height: size.height * .04),
              if (surveysPrv.typePossesion.text.isNotEmpty &&
                  surveysPrv.typePossesion.text == 'Otro')
                //#11
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cuál?',
                    hintext: ' Ingresar tipo de posesión',
                    textInputAction: TextInputAction.next,
                    controller: surveysPrv.typePossesionOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) => surveysPrv.setTypePossesionOther(val),
                  ),
                ),
              SizedBox(height: size.height * .04),
              //#12
              DropdownComponents(
                title: '¿Pertenece a alguna asociación',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) =>
                    surveysPrv.setBelongAssociation(val.toString()),
              ),
              if (surveysPrv.belongAssociation.text.isNotEmpty &&
                  surveysPrv.belongAssociation.text == 'Si')
                SizedBox(height: size.height * .04),
              if (surveysPrv.belongAssociation.text.isNotEmpty &&
                  surveysPrv.belongAssociation.text == 'Si')
                //#13
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cuál?',
                    hintext: ' Ingresar nombre de la asociación',
                    textInputAction: TextInputAction.next,
                    controller: surveysPrv.belongAssociationOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setBelongAssociationOther(val),
                  ),
                ),

              SizedBox(height: size.height * .04),
              //#14
              DropdownComponents(
                title: '¿Pertenece a la federación nacional de Cacaoteros?',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (val) =>
                    ValidationInputs.inputTypeSelect(val.toString()),
                onChanged: (val) =>
                    surveysPrv.setNationalFederation(val.toString()),
              ),
              if (surveysPrv.nationalFederation.text.isNotEmpty &&
                  surveysPrv.nationalFederation.text == 'Si')
                SizedBox(height: size.height * .04),
              if (surveysPrv.nationalFederation.text.isNotEmpty &&
                  surveysPrv.nationalFederation.text == 'Si')
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
                    onChanged: (val) =>
                        surveysPrv.setNationalFederationOther(val.toString()),
                  ),
                ),
              if (surveysPrv.nationalFederationOther.text == 'Si' &&
                  surveysPrv.nationalFederationOther.text.isNotEmpty)
                SizedBox(height: size.height * .04),
              if (surveysPrv.nationalFederationOther.text == 'Si' &&
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
                onChanged: (val) =>
                    surveysPrv.setSocialSecurity(val.toString()),
              ),
              if (surveysPrv.socialSecurity.text == 'Si' &&
                  surveysPrv.socialSecurity.text.isNotEmpty)
                SizedBox(height: size.height * .04),
              //#17
              if (surveysPrv.socialSecurity.text == 'Si' &&
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
                onChanged: (val) => surveysPrv.setTypeLabour(val.toString()),
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
