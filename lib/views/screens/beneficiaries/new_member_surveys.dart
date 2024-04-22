import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
pantalla para añadir a un nuevo miembro a la familia 
*/
class NewMemberSurveysScreen extends StatefulWidget {
  const NewMemberSurveysScreen({super.key});

  @override
  State<NewMemberSurveysScreen> createState() => _NewMemberSurveysScreenState();
}

class _NewMemberSurveysScreenState extends State<NewMemberSurveysScreen> {
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
                  color: PaletteColorsTheme.secondaryColor,
                  title: 'AÑADIR MIEMBRO DE FAMILIA'),
              SizedBox(height: size.height * .04),
              //#1
              InputsComponent(
                title: 'Nombres y apellidos',
                hintext: ' Ingresar nombres y apellidos',
                colorInputs: PaletteColorsTheme.secondaryColor,
                textInputAction: TextInputAction.next,
                controller: surveysPrv.nameAndLastNameMember,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setNameAndLastNameMember(val),
              ),
              SizedBox(height: size.height * .03),
              //#2
              DropdownComponents(
                title: ' Seleccionar parentesco',
                initialValue: '-',
                hintext: ' Seleccionar parentesco',
                colorInputs: PaletteColorsTheme.secondaryColor,
                items: const [
                  'Hijos',
                  'Yerno',
                  'Nuera',
                  'Sobrino',
                  'Tios',
                  'Demas',
                ],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Hijos':
                      surveysPrv.setSelectRelationShipMember('1');
                      break;
                    case 'Yerno':
                      surveysPrv.setSelectRelationShipMember('2');
                      break;
                    case 'Nuera':
                      surveysPrv.setSelectRelationShipMember('3');
                      break;
                    case 'Sobrino':
                      surveysPrv.setSelectRelationShipMember('4');
                      break;
                    case 'Tios':
                      surveysPrv.setSelectRelationShipMember('5');
                      break;
                    case 'Demas':
                      surveysPrv.setSelectRelationShipMember('6');
                      break;
                    default:
                  }
                },
              ),

              SizedBox(height: size.height * .03),
              //#3
              DropdownComponents(
                  title: ' Seleccionar género',
                  initialValue: '-',
                  hintext: ' Seleccionar género',
                  items: const ['Masculino', 'Femenino', 'Otro'],
                  colorInputs: PaletteColorsTheme.secondaryColor,
                  validator: (value) => ValidationInputs.inputTypeSelect(value),
                  onChanged: (val) {
                    switch (val.toString()) {
                      case 'Masculino':
                        surveysPrv.setSelectGenderRelationShipMember('1');
                        break;
                      case 'Femenino':
                        surveysPrv.setSelectGenderRelationShipMember('2');
                        break;
                      case 'Otro':
                        surveysPrv.setSelectGenderRelationShipMember('3');
                        break;
                      default:
                    }
                  }),
              SizedBox(height: size.height * .03),
              // #4
              Row(
                children: [
                  //01
                  Flexible(
                    flex: 1,
                    child: InputsComponent(
                      title: 'Mes de nacimiento',
                      hintext: ' 03',
                      colorInputs: PaletteColorsTheme.secondaryColor,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: surveysPrv.birthdayMonthRelationShipMember,
                      validator: (val) => ValidationInputs.validateMonth(val),
                      onChanged: (val) =>
                          surveysPrv.setBirthdayMonthRelationShipMember(val),
                    ),
                  ),
                  SizedBox(width: size.width * .02),
                  //02
                  Flexible(
                    flex: 1,
                    child: InputsComponent(
                      title: 'Día de nacimiento',
                      hintext: ' 07',
                      colorInputs: PaletteColorsTheme.secondaryColor,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: surveysPrv.birthdayDayRelationShipMember,
                      validator: (val) =>
                          ValidationInputs.validateDayOfMonth(val),
                      onChanged: (val) =>
                          surveysPrv.setBirthdayDayRelationShipMember(val),
                    ),
                  ),
                  SizedBox(width: size.width * .02),
                  //03
                  Flexible(
                    flex: 1,
                    child: InputsComponent(
                      title: 'Año de nacimiento',
                      hintext: ' 1999',
                      colorInputs: PaletteColorsTheme.secondaryColor,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: surveysPrv.birthdayYearRelationShipMember,
                      validator: (val) => ValidationInputs.validateYear(val),
                      onChanged: (val) =>
                          surveysPrv.setBirthdayYearRelationShipMember(val),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * .03),
              //#5
              DropdownComponents(
                title: 'Nivel de escolaridad',
                hintext: ' Seleccionar nivel de escolaridad',
                colorInputs: PaletteColorsTheme.secondaryColor,
                items: const [
                  'Primaria',
                  'Secundaria',
                  'Técnico',
                  'Profesional',
                ],
                validator: (val) =>
                    ValidationInputs.inputTypeSelect(val.toString()),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Primaria':
                      surveysPrv.setLevelShoolRelationShipMember('1');
                      break;
                    case 'Secundaria':
                      surveysPrv.setLevelShoolRelationShipMember('2');
                      break;
                    case 'Técnico':
                      surveysPrv.setLevelShoolRelationShipMember('3');
                      break;
                    case 'Profesional':
                      surveysPrv.setLevelShoolRelationShipMember('4');
                      break;
                    default:
                  }
                },
              ),

              SizedBox(height: size.height * .03),
              InputsComponent(
                title: 'Institución de escolaridad',
                hintext: ' Ingresar institución',
                colorInputs: PaletteColorsTheme.secondaryColor,
                controller: surveysPrv.schoolRelationShipMember,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setSchoolRelationShipMember(val),
              ),

              SizedBox(height: size.height * .03),
              //#7
              InputsComponent(
                title: 'Número de documento',
                hintext: ' Ingresar número',
                colorInputs: PaletteColorsTheme.secondaryColor,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                controller: surveysPrv.numberRelationShipMember,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setnumberRelationShipMember(val),
              ),

              SizedBox(height: size.height * .06),

              /*boton para continuar*/
              ButtonComponents(
                colorButton: PaletteColorsTheme.secondaryColor,
                title: 'Continuar',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    /*añade los miembros al provider*/
                    FamilyMember newMember = FamilyMember(
                      id: '', // el ID será asignado por el Provider
                      name: surveysPrv.nameAndLastNameMember.text,
                      relationship: surveysPrv.selectRelationShipMember.text,
                      gender: surveysPrv.selectGenderRelationShipMember.text,
                      birthdayMonth:
                          surveysPrv.birthdayMonthRelationShipMember.text,
                      birthdayDay:
                          surveysPrv.birthdayDayRelationShipMember.text,
                      birthdayYear:
                          surveysPrv.birthdayYearRelationShipMember.text,
                      educationLevel:
                          surveysPrv.levelShoolRelationShipMember.text,
                      school: surveysPrv.schoolRelationShipMember.text,
                      documentNumber: surveysPrv.numberRelationShipMember.text,
                    );
                    //agrega el nuevo miembro a la lista
                    surveysPrv.addFamilyMember(newMember);
                    // limpia los campos después de agregar el miembro
                    surveysPrv.cleanInputsMembers();

                    // verificar si se añadió el miembro a la lista
                    bool memberAdded =
                        surveysPrv.familyMembers.contains(newMember);
                    if (memberAdded) {
                      /*hace un pop up */
                      Navigator.pop(context);
                      SnackBarGlobalWidget.showSnackBar(
                          context,
                          'Familiar añadido con éxito',
                          Icons.check_circle_rounded,
                          PaletteColorsTheme.principalColor);
                    } else {
                      SnackBarGlobalWidget.showSnackBar(
                          context,
                          'Lo sentimos, el familiar no pudo ser añadido',
                          Icons.error_sharp,
                          PaletteColorsTheme.secondaryColor);
                    }
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
