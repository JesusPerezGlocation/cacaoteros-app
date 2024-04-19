import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #5 UBICACIÓN DEL PREDIO
*/
class FiveSurveysScreen extends StatefulWidget {
  const FiveSurveysScreen({super.key});

  @override
  State<FiveSurveysScreen> createState() => _FiveSurveysScreenState();
}

class _FiveSurveysScreenState extends State<FiveSurveysScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPRV = Provider.of<BeneficiariesSurveysProvider>(context);
    final locationPRV = Provider.of<PermissionLocationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: const [SaveIconDraftComponents()],
      ),
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
                  title: 'INFORMACIÓN DE LA UNIDAD PRODUCTIVA'),

              SizedBox(height: size.height * .02),

              const LinealPercentComponent(
                percent: (5 - 1) * (100 / 23) / 100,
                questions: '30',
                answers: '5',
              ),
              SizedBox(height: size.height * .04),
              //#1 buscar municipio
              InkWell(
                onTap: () {
                  /*si presionan limpia el dato seleccionado */
                  surveysPRV.cleanDepartaments();
                  ShowModalMunicipality.showSelectDepartament(context);
                },
                child: InputDesabledComponents(
                  title: 'Seleccionar departamento',
                  hintext: ' Seleccionar departamento',
                  enabled: false,
                  controller: surveysPRV.department,
                  validator: (value) => ValidationInputs.inputTypeSelect(value),
                  onChanged: (val) => surveysPRV.setDepartement(val),
                ),
              ),

              if (surveysPRV.department.text.isNotEmpty)
                SizedBox(height: size.height * .03),
              //# 2
              if (surveysPRV.department.text.isNotEmpty)
                InkWell(
                  onTap: () {
                    surveysPRV.cleanMunicipality();
                    ShowModalMunicipality.showSelectMunicipality(context);
                  },
                  child: InputDesabledComponents(
                    title: 'Seleccionar municipio',
                    hintext: ' Seleccionar municipio',
                    enabled: false,
                    controller: surveysPRV.municipality,
                    validator: (value) =>
                        ValidationInputs.inputTypeSelect(value),
                    onChanged: (val) => surveysPRV.setMunicipality(val),
                  ),
                ),

              if (surveysPRV.municipality.text.isNotEmpty)
                SizedBox(height: size.height * .03),
              //#3
              if (surveysPRV.municipality.text.isNotEmpty)
                InkWell(
                  onTap: () {
                    surveysPRV.cleanPlace();
                    ShowModalMunicipality.showModalPlaces(context);
                  },
                  child: InputDesabledComponents(
                    title: 'Seleccionar vereda',
                    hintext: ' Seleccionar vereda',
                    enabled: false,
                    controller: surveysPRV.place,
                    validator: (value) =>
                        ValidationInputs.inputTypeSelect(value),
                    onChanged: (val) => surveysPRV.setPlace(val),
                  ),
                ),

              SizedBox(height: size.height * .03),
              //#4
              InputsComponent(
                title: 'Nombre del predio',
                hintext: ' Ingresar nombre del predio',
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPRV.setNameProperty(val),
              ),
              SizedBox(height: size.height * .03),
              DropdownComponents(
                title: '¿Posee un mapa de la unidad productiva?',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPRV.setMapUnitDomestic('1');
                      break;
                    case 'No':
                      surveysPRV.setMapUnitDomestic('2');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .03),
              //#
              InputsComponent(
                title: 'Número total de hectáreas del predio',
                hintext: ' Ingresar numero de hectáreas',
                controller: surveysPRV.hectareNumbers,
                keyboardType: TextInputType.number,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPRV.setHectareNumber(val),
              ),
              SizedBox(height: size.height * .03),
              DropdownComponents(
                title: '¿Cómo es la pendiente del terreno?',
                hintext: ' Seleccionar dato',
                items: const [
                  'Llano (0-2%)',
                  'Suavemente inclinado (2-6%)',
                  'Inclinado (6-13%)',
                  'Suavemente escarpado (13-25%)',
                  'Escarpado (25-55%)',
                  'Muy escarpado (>55%)'
                ],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Llano (0-2%)':
                      surveysPRV.setPropertyHeight('1');
                      break;
                    case 'Suavemente inclinado (2-6%)':
                      surveysPRV.setPropertyHeight('2');
                      break;
                    case 'Inclinado (6-13%)':
                      surveysPRV.setPropertyHeight('3');
                      break;
                    case 'Suavemente escarpado (13-25%)':
                      surveysPRV.setPropertyHeight('4');
                      break;
                    case 'Escarpado (25-55%)':
                      surveysPRV.setPropertyHeight('5');
                      break;
                    case 'Muy escarpado (>55%)':
                      surveysPRV.setPropertyHeight('6');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .03),
              DropdownComponents(
                title: '¿Quienes laboran en la unidad productiva?',
                hintext: ' Seleccionar dato',
                items: const [
                  'Familiares',
                  'Trabajadores externos',
                  'Particulares'
                ],
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Familiares':
                      surveysPRV.setWhoWorkUnitDomectic('1');
                      break;
                    case 'Trabajadores externos':
                      surveysPRV.setWhoWorkUnitDomectic('2');
                      break;
                    case 'Particulares':
                      surveysPRV.setWhoWorkUnitDomectic('3');
                      break;
                    default:
                  }
                },
              ),
              if (surveysPRV.whoWorkUnitDomectic.text == '3' &&
                  surveysPRV.whoWorkUnitDomectic.text.isNotEmpty)
                SizedBox(height: size.height * .03),
              //#
              if (surveysPRV.whoWorkUnitDomectic.text == '3' &&
                  surveysPRV.whoWorkUnitDomectic.text.isNotEmpty)
                DropdownComponents(
                  title: '¿Personal externo cuenta con seguridad social?',
                  hintext: ' Seleccionar dato',
                  items: const ['Si', 'No'],
                  validator: (val) => ValidationInputs.inputTypeSelect(val),
                  onChanged: (val) {
                    switch (val.toString()) {
                      case 'Si':
                        surveysPRV.setExternalPeopleWithSeguritySocial('1');
                        break;
                      case 'No':
                        surveysPRV.setExternalPeopleWithSeguritySocial('2');
                        break;
                      default:
                    }
                  },
                ),
              SizedBox(height: size.height * .03),
              //#
              InputsComponent(
                title: 'Área total en el cacao',
                hintext: 'Ingresar área total',
                keyboardType: TextInputType.number,
                controller: surveysPRV.totalAreaCacao,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPRV.setTotalAreaCacao(val),
              ),
              SizedBox(height: size.height * .03),
              //#
              InputsComponent(
                title: 'Edad del cultivo de cacao',
                hintext: 'Ingresar edad',
                keyboardType: TextInputType.number,
                controller: surveysPRV.ageCacao,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPRV.setAgeCacao(val),
              ),
              SizedBox(height: size.height * .03),
              //#
              InputsComponent(
                title: '¿Qué variedades del cacao tiene establecido?',
                hintext: 'Ingresar variedad',
                maxLine: 3,
                controller: surveysPRV.cacaoVariety,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPRV.setCacaoVariety(val),
              ),
              SizedBox(height: size.height * .03),
              //#
              InputsComponent(
                title: 'Área total en bosque',
                hintext: 'Ingresar área',
                keyboardType: TextInputType.number,
                controller: surveysPRV.forestAreaTotal,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPRV.setForestAreaTotal(val),
              ),
              SizedBox(height: size.height * .03),
              //#
              InputsComponent(
                title: 'Área total en rastrojo',
                hintext: 'Ingresar área',
                keyboardType: TextInputType.number,
                controller: surveysPRV.rastrojoAreaTotal,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPRV.setRastrojoAreaTotal(val),
              ),
              SizedBox(height: size.height * .03),
              //#
              InputsComponent(
                title: 'Área total en pastos',
                hintext: 'Ingresar área',
                keyboardType: TextInputType.number,
                controller: surveysPRV.glassAreaTotal,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPRV.setGlassAreaTotal(val),
              ),
              SizedBox(height: size.height * .03),
              //#
              InputsComponent(
                title: 'Área total en otros cultivos',
                hintext: 'Ingresar área',
                keyboardType: TextInputType.number,
                controller: surveysPRV.cultivesAreaTotal,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPRV.setCultivesAreaTotal(val),
              ),

              SizedBox(height: size.height * .06),

              /*boton para continuar*/
              ButtonComponents(
                title: 'Continuar',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SixSurveysScreen(locationPRV: locationPRV),
                      ));
                  if (formKey.currentState!.validate()) {
                    /*navega a la siguiente pantalla*/
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
