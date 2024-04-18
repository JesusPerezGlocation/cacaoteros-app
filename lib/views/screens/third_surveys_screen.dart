import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/routes/main_routes.dart';
/*
pantalla  #3 INFORMACIÓN DE LA TIERRA
*/

class ThirdSurveysScreen extends StatefulWidget {
  const ThirdSurveysScreen({super.key});

  @override
  State<ThirdSurveysScreen> createState() => _ThirdSurveysScreenState();
}

class _ThirdSurveysScreenState extends State<ThirdSurveysScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<SurveysVisitRegistrationProvider>(context);
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
                  title:
                      'INFORMACIÓN BÁSICA DEL CACAOCULTOR > INFORMACIÓN DE LA TIERRA'),
              SizedBox(height: size.height * .02),

              const LinealPercentComponent(
                percent: (3 - 1) * (100 / 23) / 100,
                questions: '30',
                answers: '3',
              ),
              SizedBox(height: size.height * .04),
              //#1
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
                onChanged: (val) =>
                    surveysPrv.setPosessionLandTypee(val.toString()),
              ),
              SizedBox(height: size.height * .03),
              //#2
              DropdownComponents(
                title: ' Seleccionar origen de la tenencia de la tierra',
                initialValue: '-',
                hintext: ' Seleccionar tipo de tenencia',
                items: const ['Compra', 'Herencia', 'Subsidio estatal'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) =>
                    surveysPrv.setOriginPosessionLand(val.toString()),
              ),
              SizedBox(height: size.height * .03),
              //#3
              DropdownComponents(
                title: ' Seleccionar posesión sobre el cultivo',
                initialValue: '-',
                hintext: ' Seleccionar tipo de posesión',
                items: const ['Arrendatario', 'Sociedad', 'Propietario'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) =>
                    surveysPrv.setPossesionOverCultivation(val.toString()),
              ),

              SizedBox(height: size.height * .03),
              //#4
              DropdownComponents(
                title: ' ¿Está afiliado a alguna organización de productores?',
                initialValue: '-',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) =>
                    surveysPrv.setProducesOrganization(val.toString()),
              ),

              SizedBox(height: size.height * .03),
              //#5
              InputsComponent(
                title: 'Nombre de alguna organización a la que pertenece',
                hintext: ' Ingresar organización',
                controller: surveysPrv.nameOrganization,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setNameOrganization(val),
              ),

              SizedBox(height: size.height * .03),
              //#6
              DropdownComponents(
                title: ' Principal actividad económica',
                initialValue: '-',
                hintext: ' Seleccionar actividad',
                items: const ['Agricultor', 'Ganadero', 'Comerciante', 'Otro'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) =>
                    surveysPrv.setMainEconomicActivity(val.toString()),
              ),

              if (surveysPrv.mainEconomicActivity.text.isNotEmpty &&
                  surveysPrv.mainEconomicActivity.text == 'Otro')
                SizedBox(height: size.height * .03),
              //#6 economica
              if (surveysPrv.mainEconomicActivity.text.isNotEmpty &&
                  surveysPrv.mainEconomicActivity.text == 'Otro')
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Otro, Cuál?',
                    hintext: ' Ingresar actividad económica',
                    controller: surveysPrv.mainEconomicActivityOther,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setMainEconomicActivityOther(val),
                  ),
                ),

              SizedBox(height: size.height * .03),
              //#7
              InputsDatesComponent(
                title:
                    'Número de días al mes que labora en el cultivo de cacao',
                hintext: ' Ingresar número',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                maxLength: 2,
                controller: surveysPrv.numberMonthWorkFarm,
                validator: (val) => ValidationInputs.validateDayOfMonth(val),
                onChanged: (val) => surveysPrv.setNumberMonthWorkFarm(val),
              ),

              SizedBox(height: size.height * .03),
              //#8
              InputsDatesComponent(
                title: 'Número de días al mes que labora fuera de la finca',
                hintext: ' Ingresar número',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                maxLength: 2,
                controller: surveysPrv.numberWithoutFarm,
                validator: (val) => ValidationInputs.validateDayOfMonth(val),
                onChanged: (val) => surveysPrv.setNumberWithoutFarm(val),
              ),

              SizedBox(height: size.height * .06),
              /*boton para continuar */
              ButtonComponents(
                title: 'Continuar',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    /*navega a la pantalla #4 */
                    Navigator.pushNamed(
                      context,
                      MainRoutes.fourSurveysRoute,
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
