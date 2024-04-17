import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/routes/main_routes.dart';

/*
pantalla #12 INFORMACIÓN GENERAL
*/
class TwelveSurveysScreen extends StatelessWidget {
  const TwelveSurveysScreen({super.key});
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
                    'INFORMACIÓN TÉCNICO - PRODUCTIVA > INFORMACIÓN GENERAL'),
            SizedBox(height: size.height * .02),
            const LinealPercentComponent(
              percent: (12 - 1) * (100 / 23) / 100,
              questions: '30',
              answers: '12',
            ),
            SizedBox(height: size.height * .04),
            //#1
            InputsComponent(
              title: 'Área total de la finca (HA)',
              hintext: ' Ingresar área total',
              textInputAction: TextInputAction.next,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#2
            InputsComponent(
              title: 'Área total en caso (HA)',
              hintext: ' Ingresar  área total',
              textInputAction: TextInputAction.next,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#3
            InputsComponent(
              title: 'Número de HA en cacao clonado',
              hintext: ' Ingresar  área total',
              textInputAction: TextInputAction.next,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#4
            DropdownComponents(
              title: ' Los lotes de cacao híbridos y clonados estan separados',
              initialValue: '-',
              hintext: 'Seleccionar dato',
              items: const ['Si', 'No'],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#5
            InputsComponent(
              title: 'Producción total de cacao cosechada último año (KG)',
              hintext: ' Ingresar total',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .04),
            //#6
            InputsComponent(
              title: 'Año de siembra árboles híbridos',
              hintext: ' Ingresar número',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#7
            InputsComponent(
              title: 'Números de árboles híbridos por hectárea',
              hintext: ' Ingresar número',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#8
            InputsComponent(
              title: 'Distancia de siembra en metros híbridos',
              hintext: ' Ingresar número',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .04),
            //#9
            InputsComponent(
              title: 'Año de siembra árboles clonados',
              hintext: ' Ingresar número',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#10
            InputsComponent(
              title: 'Distancia de siembra en metros de árboles clonados',
              hintext: ' Ingresar número',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .04),
            //#11
            InputsComponent(
              title: 'Mencione los clones existentes en la finca',
              hintext: ' Ingresar dato',
              textInputAction: TextInputAction.next,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#12
            InputsComponent(
              title: 'Área total en bosque (HA)',
              hintext: ' Ingresar número',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#13
            InputsComponent(
              title: 'Área total en rastrojo (HA)',
              hintext: ' Ingresar número',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#13
            InputsComponent(
              title: 'Área total en otros cultivos',
              hintext: ' Ingresar número',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .04),
            //#14
            InputsComponent(
              title: 'Mencione qué otros cultivos existen en la finca',
              hintext: ' Ingresar otros cultivos',
              maxLine: 4,
              textInputAction: TextInputAction.next,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .04),
            //#15
            InputsComponent(
              title: 'Mencione que especies maderables dan sombra al cacao',
              hintext: ' Ingresar especies',
              maxLine: 4,
              textInputAction: TextInputAction.next,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .04),
            //#16
            InputsComponent(
              title: 'Distancia de los árboles maderables en el lote',
              hintext: ' Ingresar número',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#17
            InputsComponent(
              title: 'Número total de los árboles maderables en el lote',
              hintext: ' Ingresar número',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .04),
            //#18
            InputsComponent(
              title: 'Cultivos que el productor asoció con el cacao',
              hintext: ' Ingresar cultivos asociados',
              maxLine: 4,
              textInputAction: TextInputAction.next,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#19
            InputsComponent(
              title: 'Tipo de actividad pecuaria realizada',
              hintext: ' Ingresar actividad pecuaria',
              maxLine: 4,
              textInputAction: TextInputAction.next,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#20
            InputsComponent(
              title: 'Área total en explotaciones pecuarias',
              hintext: ' Ingresar número',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#21
            DropdownComponents(
              title: ' Posee infraestructura de beneficio',
              initialValue: '-',
              hintext: ' Seleccionar dato',
              items: const ['Si', 'No'],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .06),

            /*boton para continuar*/
            ButtonComponents(
              title: 'Continuar',
              onPressed: () {
                //Todo: debe validar
                /*navega a la pantalla #13*/
                Navigator.pushNamed(context, MainRoutes.thirteenSurveysRoute);
              },
            ),
            SizedBox(height: size.height * .06),
          ],
        ),
      ),
    );
  }
}
