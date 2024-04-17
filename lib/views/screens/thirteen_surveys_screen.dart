import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/models_exports.dart';
import 'package:surveys_app/controllers/routes/main_routes.dart';

/*
pantalla #13 INFORMACIÓN TÉCNICO - PRODUCTIVA > INFORMACIÓN ESPECÍFICA DEL CACAO
*/
class ThirteenSurveysScreen extends StatefulWidget {
  const ThirteenSurveysScreen({super.key});

  @override
  State<ThirteenSurveysScreen> createState() => _ThirteenSurveysScreenState();
}

class _ThirteenSurveysScreenState extends State<ThirteenSurveysScreen> {
  /*lista de municipio */
  List<MunicipalitiesModels> municipalitiesList =
      MunicipalitiesModels.fromJsonList(JsonDataMunicipalities.jsonData);

  TextEditingController cocoaWhere = TextEditingController();
  TextEditingController selfConsumption = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(actions: const [SaveIconDraftComponents()]),
      body: FadeIn(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .03, vertical: size.height * .03),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            const TitleSurveysComponents(
                title:
                    'INFORMACIÓN TÉCNICO - PRODUCTIVA > INFORMACIÓN ESPECÍFICA DEL CACAO'),
            SizedBox(height: size.height * .02),
            const LinealPercentComponent(
              percent: (13 - 1) * (100 / 23) / 100,
              questions: '30',
              answers: '13',
            ),
            SizedBox(height: size.height * .04),
            //#01
            DropdownComponents(
              title: ' ¿Cómo vende el grano de cacao?',
              initialValue: '-',
              hintext: ' Seleccionar dato',
              items: const ['En baba', 'Seco'],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#02
            DropdownComponents(
              title: ' ¿Dónde fermenta?',
              initialValue: '-',
              hintext: ' Seleccionar dato',
              items: const [
                'Barril',
                'Cajón',
                'Costal',
                'No fermenta',
              ],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#03
            DropdownComponents(
              title: ' ¿Cómo seca el cacao?',
              initialValue: '-',
              hintext: ' Seleccionar dato',
              items: const ['Al sol', 'Secador artificial', 'No lo seca'],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#04
            DropdownComponents(
              title: ' ¿Dónde seca el cacao?',
              initialValue: '-',
              hintext: ' Seleccionar dato',
              items: const [
                'Elba',
                'Patio cemento',
                'Tierra - Plástico - Costal',
                'Otro'
              ],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {
                setState(() => cocoaWhere.text = val.toString());
              },
            ),
            if (cocoaWhere.text.isNotEmpty && cocoaWhere.text == 'Otro')
              SizedBox(height: size.height * .04),
            // #05
            if (cocoaWhere.text.isNotEmpty && cocoaWhere.text == 'Otro')
              Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: InputsComponent(
                  title: '¿Cúal?',
                  hintext: ' Ingresar dónde seca el cacao',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (val) => ValidationInputs.inputEmpty(val),
                  onChanged: (val) {},
                ),
              ),
            SizedBox(height: size.height * .04),
            //#06
            DropdownComponents(
              title: ' Destino del grano de cacao',
              initialValue: '-',
              hintext: ' Seleccionar destino',
              items: const [
                'Asociaciones',
                'Cooperativas',
                'Intermediario',
                'Transf. local'
              ],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {
                setState(() => cocoaWhere.text = val.toString());
              },
            ),
            SizedBox(height: size.height * .04),
            //#07
            DropdownComponents(
              title: '¿Realiza autocomsumo?',
              initialValue: '-',
              hintext: ' Seleccionar autocomsumo',
              items: const ['Si', 'No'],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {
                setState(() => selfConsumption.text = val.toString());
              },
            ),

            if (selfConsumption.text.isNotEmpty && selfConsumption.text == 'Si')
              SizedBox(height: size.height * .04),
            // #08
            if (selfConsumption.text.isNotEmpty && selfConsumption.text == 'Si')
              Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: InputsComponent(
                  title: '¿Qué cantidad (KG) destinada para autoconsumo?',
                  hintext: ' Ingresar cantidad',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  validator: (val) => ValidationInputs.inputEmpty(val),
                  onChanged: (val) {},
                ),
              ),

            SizedBox(height: size.height * .04),
            //#09
            InputsComponent(
              title: 'Nombre del chocolate de mesa que consume',
              hintext: ' Ingresar nombre del chocolate',
              textInputAction: TextInputAction.next,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .04),
            //#10
            InputsComponent(
              title: 'Nombre del chocolate de mesa que consume',
              hintext: ' Ingresar nombre del chocolate',
              textInputAction: TextInputAction.next,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .04),
            //#11
            DropdownComponents(
              title: '¿Municipio donde comercializa el grano?',
              initialValue: '-',
              hintext: ' Seleccionar municipio',
              items: FilterPlacesServices.departments,
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#12
            InputsComponent(
              title: 'Distancia en kilómetros',
              hintext: ' Ingresar distancias',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#13
            InputsComponent(
              title: 'Medio de transporte usado',
              hintext: ' Ingresar medio de transporte',
              textInputAction: TextInputAction.next,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#14
            InputsComponent(
              title: 'Número de horas requeridas para ir donde vende el cacao',
              hintext: ' Ingresar horas requeridas',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#15
            InputsComponent(
              title:
                  'Número de árboles de cacao para renovar por injerto en leño grueso',
              hintext: ' Ingresar número de árboles',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#16
            InputsComponent(
              title: 'Número de árboles a rehabilitar mediante poda',
              hintext: ' Ingresar número de árboles',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#17
            InputsComponent(
              title: 'Número de árboles requeridos para resembrar',
              hintext: ' Ingresar número de árboles',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#18
            InputsComponent(
              title: 'Número de hectareas disponibles para sembrar cacao',
              hintext: ' Ingresar número de hectareas',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .06),

            /*boton para continuar*/
            ButtonComponents(
              title: 'Continuar',
              onPressed: () {
                //Todo: debe validar
                /*navega a la pantalla #14*/
                Navigator.pushNamed(context, MainRoutes.fourteenSurveysRoute);
              },
            ),
            SizedBox(height: size.height * .06),
          ],
        ),
      ),
    );
  }
}
