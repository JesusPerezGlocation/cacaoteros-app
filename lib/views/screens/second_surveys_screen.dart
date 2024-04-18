import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla  #2 IDENTIFICACIÓN
*/
class SecondSurveysScreen extends StatefulWidget {
  const SecondSurveysScreen({super.key});

  @override
  State<SecondSurveysScreen> createState() => _SecondSurveysScreenState();
}

class _SecondSurveysScreenState extends State<SecondSurveysScreen> {
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
                  title: 'INFORMACIÓN BÁSICA DEL CACAOCULTOR > IDENTIFICACIÓN'),
              SizedBox(height: size.height * .02),
              const LinealPercentComponent(
                percent: (2 - 1) * (100 / 23) / 100,
                questions: '30',
                answers: '2',
              ),
              SizedBox(height: size.height * .04),

              //#1 tipo de documento
              DropdownComponents(
                title: 'Tipo de documento',
                initialValue: 'CC',
                hintext: 'Seleccionar tipo de persona',
                items: const [
                  'Cédula de ciudadanía',
                  'Cédula de extranjería',
                  'Otro'
                ],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) =>
                    surveysPrv.setSelectedDocumentType(val.toString()),
              ),
              if (surveysPrv.selectedDocumentType.text.isNotEmpty &&
                  surveysPrv.selectedDocumentType.text == 'Otro')
                SizedBox(height: size.height * .03),
              if (surveysPrv.selectedDocumentType.text.isNotEmpty &&
                  surveysPrv.selectedDocumentType.text == 'Otro')
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Otro, Cuál?',
                    hintext: ' Ingresar tipo de documento',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    controller: surveysPrv.selecDocumentTypeOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setSelectedDocumentTypeOther(val),
                  ),
                ),
              SizedBox(height: size.height * .03),
              // #3 número de documento
              InputsComponent(
                title: 'Número de documento',
                hintext: ' Ingresar número de documento',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                controller: surveysPrv.documentNumber,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setDocumentNumber(val),
              ),
              SizedBox(height: size.height * .03),
              // #4
              Row(
                children: [
                  //01
                  Flexible(
                    flex: 1,
                    child: InputsDatesComponent(
                      title: 'Mes de expedición',
                      hintext: ' 10',
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: surveysPrv.expeditionMonth,
                      validator: (val) => ValidationInputs.validateMonth(val),
                      onChanged: (val) => surveysPrv.setExpeditionMonth(val),
                    ),
                  ),
                  SizedBox(width: size.width * .02),
                  //02
                  Flexible(
                    flex: 1,
                    child: InputsDatesComponent(
                      title: 'Día de expedición',
                      hintext: ' 02',
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: surveysPrv.expeditionDay,
                      validator: (val) =>
                          ValidationInputs.validateDayOfMonth(val),
                      onChanged: (val) => surveysPrv.setExpeditionDay(val),
                    ),
                  ),
                  SizedBox(width: size.width * .02),
                  //03
                  Flexible(
                    flex: 1,
                    child: InputsDatesComponent(
                      title: 'Año de expedición',
                      hintext: ' 1999',
                      maxLength: 4,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: surveysPrv.expeditionYear,
                      validator: (val) => ValidationInputs.validateYear(val),
                      onChanged: (val) => surveysPrv.setExpeditionYear(val),
                    ),
                  ),
                ],
              ),

              SizedBox(height: size.height * .03),
              //#5
              InputsComponent(
                title: 'Lugar de expedición',
                hintext: ' Ingresar lugar',
                textInputAction: TextInputAction.next,
                controller: surveysPrv.placeExpedition,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setPlaceExpedition(val),
              ),

              SizedBox(height: size.height * .03),
              //#6
              InputsComponent(
                title: 'Primer nombre',
                hintext: ' Ingresar nombre',
                textInputAction: TextInputAction.next,
                controller: surveysPrv.firtName,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setFirtName(val),
              ),
              SizedBox(height: size.height * .03),
              //#7
              InputsComponent(
                title: 'Segundo nombre',
                hintext: ' Ingresar segundo nombre',
                textInputAction: TextInputAction.next,
                controller: surveysPrv.secondName,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setSecondName(val),
              ),
              SizedBox(height: size.height * .03),
              //#8
              InputsComponent(
                title: 'Primer apellido',
                hintext: ' Ingresar primero apellido',
                textInputAction: TextInputAction.next,
                controller: surveysPrv.firtLastName,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setFirtLastName(val),
              ),
              SizedBox(height: size.height * .03),
              //#9
              InputsComponent(
                title: 'Segundo apellido',
                hintext: ' Ingresar segundo apellido',
                textInputAction: TextInputAction.next,
                controller: surveysPrv.secondLastName,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setSecondLastName(val),
              ),
              SizedBox(height: size.height * .03),
              // #10 fecha de nacimiento
              Row(
                children: [
                  //01
                  Flexible(
                    flex: 1,
                    child: InputsDatesComponent(
                      title: 'Mes de nacimiento',
                      hintext: ' 03',
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: surveysPrv.birthMonth,
                      validator: (val) => ValidationInputs.validateMonth(val),
                      onChanged: (val) => surveysPrv.setBirthMonth(val),
                    ),
                  ),
                  SizedBox(width: size.width * .02),
                  //02
                  Flexible(
                    flex: 1,
                    child: InputsDatesComponent(
                      title: 'Día de nacimiento',
                      hintext: ' 07',
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: surveysPrv.birthDay,
                      validator: (val) =>
                          ValidationInputs.validateDayOfMonth(val),
                      onChanged: (val) => surveysPrv.setBirthDay(val),
                    ),
                  ),
                  SizedBox(width: size.width * .02),
                  //03
                  Flexible(
                    flex: 1,
                    child: InputsDatesComponent(
                      title: 'Año de nacimiento',
                      hintext: ' 1999',
                      maxLength: 4,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: surveysPrv.birthYear,
                      validator: (val) => ValidationInputs.validateYear(val),
                      onChanged: (val) => surveysPrv.setBirthYear(val),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * .03),
              //#11
              InputsComponent(
                title: 'Edad',
                hintext: ' Ingresar edad',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                controller: surveysPrv.ageUser,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setAgeUser(val),
              ),
              SizedBox(height: size.height * .03),
              //#12 genero
              DropdownComponents(
                title: 'Seleccionar género',
                initialValue: '-',
                hintext: ' Seleccionar género',
                items: const ['Masculino', 'Femenino', 'Otro'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) => surveysPrv.setGender(val.toString()),
              ),
              SizedBox(height: size.height * .03),
              //#13 nacionalidad
              InputsComponent(
                title: 'Lugar de nacimiento',
                hintext: ' Ingresar lugar de nacimiento',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                controller: surveysPrv.placeBorn,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setPlaceBorn(val.toString()),
              ),

              SizedBox(height: size.height * .03),
              // #14 número de celular
              InputsPhoneComponent(
                title: 'Número de celular',
                hintext: ' Ingresar número de celular',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                maxLength: 10,
                controller: surveysPrv.phoneNumber,
                validator: (val) => ValidationInputs.validatePhoneNumber(val),
                onChanged: (val) => surveysPrv.setPhoneNumber(val),
              ),
              SizedBox(height: size.height * .03),

              //#15 tiene whatsapp?
              DropdownComponents(
                title: '¿Tiene WhatsApp en el mismo número de celular?',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) => surveysPrv.setHasWhatsApp(val.toString()),
              ),

              SizedBox(height: size.height * .03),
              //#16 pregunta si tiene correo
              DropdownComponents(
                title: '¿Tiene correo electrónico?',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) =>
                    surveysPrv.setHasEmailAddressOther(val.toString()),
              ),

              if (surveysPrv.hasEmailAddressOther.text.isNotEmpty &&
                  surveysPrv.hasEmailAddressOther.text == 'Si')
                SizedBox(height: size.height * .03),
              // #17 correo electronico
              if (surveysPrv.hasEmailAddressOther.text.isNotEmpty &&
                  surveysPrv.hasEmailAddressOther.text == 'Si')
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: 'Correo electrónico',
                    hintext: ' Ingresar correo electrónico',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    controller: surveysPrv.emailAddress,
                    validator: (val) => ValidationInputs.emailValidations(val),
                    onChanged: (val) => surveysPrv.setEmailAddress(val),
                  ),
                ),
              SizedBox(height: size.height * .03),
              //#18 servicio a internet
              DropdownComponents(
                title: '¿Cuenta con servicio de internet?',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) =>
                    surveysPrv.setServicesEthernet(val.toString()),
              ),
              if (surveysPrv.servicesEthernet.text.isNotEmpty &&
                  surveysPrv.servicesEthernet.text == 'Si')
                SizedBox(height: size.height * .03),
              //#19 tipo de servicio a intenet
              if (surveysPrv.servicesEthernet.text.isNotEmpty &&
                  surveysPrv.servicesEthernet.text == 'Si')
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: DropdownComponents(
                    title: 'Tipo de servicio internet',
                    hintext: ' Seleccionar dato',
                    items: const ['Plan de datos', 'Internet hogar', 'Otro'],
                    validator: (val) => ValidationInputs.inputTypeSelect(val),
                    onChanged: (val) =>
                        surveysPrv.setTypeServicesEthernet(val.toString()),
                  ),
                ),
              if (surveysPrv.typeServicesEthernet.text.isNotEmpty &&
                  surveysPrv.typeServicesEthernet.text == 'Otro')
                SizedBox(height: size.height * .03),
              //#20 tipo de servicio
              if (surveysPrv.typeServicesEthernet.text.isNotEmpty &&
                  surveysPrv.typeServicesEthernet.text == 'Otro')
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cúal?',
                    hintext: ' Ingresar el tipo de servicio',
                    textInputAction: TextInputAction.next,
                    controller: surveysPrv.whatServicesEthernet,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) => surveysPrv.setWhatServicesEthernet(val),
                  ),
                ),

              SizedBox(height: size.height * .03),
              //#21 temas de consulta en internet
              DropdownComponents(
                title: '¿Qué temas de consulta a través de internet?',
                initialValue: '-',
                hintext: ' Seleccionar dato',
                items: const [
                  'Redes sociales',
                  'Noticias',
                  'Deportes',
                  'Compras',
                  'Tecnología',
                  'Otro'
                ],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) =>
                    surveysPrv.setWhatconsultEthernet(val.toString()),
              ),
              if (surveysPrv.whatServicesEthernet.text.isNotEmpty &&
                  surveysPrv.whatServicesEthernet.text == 'Otro')
                SizedBox(height: size.height * .03),
              //# 22 otro tema de consulta
              if (surveysPrv.whatServicesEthernet.text.isNotEmpty &&
                  surveysPrv.whatServicesEthernet.text == 'Otro')
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cúal?',
                    hintext: ' Ingresar el tipo de consulta',
                    textInputAction: TextInputAction.next,
                    controller: surveysPrv.whatconsultEthernetOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setWhatconsultEthernetOther(val),
                  ),
                ),
              SizedBox(height: size.height * .03),
              //23 presenta discapacidades
              DropdownComponents(
                title: '¿Presenta usted alguna condición de discapacidad?',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) => surveysPrv.setHasDisability(val.toString()),
              ),
              if (surveysPrv.hasDisability.text.isNotEmpty &&
                  surveysPrv.hasDisability.text == 'Si')
                SizedBox(height: size.height * .03),
              //# otra discapacidad
              if (surveysPrv.hasDisability.text.isNotEmpty &&
                  surveysPrv.hasDisability.text == 'Si')
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cúal?',
                    hintext: ' Ingresar el tipo de discapacidad',
                    textInputAction: TextInputAction.next,
                    controller: surveysPrv.hasDisabilityOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) => surveysPrv.setHasDisabilityOther(val),
                  ),
                ),
              SizedBox(height: size.height * .06),

              ButtonComponents(
                title: 'Continuar',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    /*navega a la siguiente pantalla*/
                    Navigator.pushNamed(
                      context,
                      MainRoutes.thirdSurveysRoute,
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
