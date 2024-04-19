import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #10 
*/
class TenSurveysScreen extends StatelessWidget {
  const TenSurveysScreen({super.key});
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
                title: 'CONFORMACIÓN NÚCLEO FAMILIAR > FAMILIAR PRIMARIO'),
            SizedBox(height: size.height * .02),

            const LinealPercentComponent(
              percent: (10 - 1) * (100 / 23) / 100,
              questions: '30',
              answers: '10',
            ),

            SizedBox(height: size.height * .04),
            //#1
            InputsComponent(
              title: ' Nombre compañer(a)',
              hintext: ' Ingresar nombre',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#2
            DropdownComponents(
              title: ' Seleccionar género',
              initialValue: '-',
              hintext: 'Seleccionar género',
              items: const ['Masculino', 'Femenino'],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#3
            DropdownComponents(
              title: 'Tipo de documento',
              initialValue: 'CC',
              hintext: 'Seleccionar tipo de persona',
              items: const [
                'Cédula de ciudadanía',
                'Tarjeta de identidad',
                'Cédula de extranjería'
              ],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .03),
            //#4
            InputsComponent(
              title: 'Número de documento',
              hintext: ' Ingresar número de documento',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .04),
            // #5
            Row(
              children: [
                //01
                Flexible(
                  flex: 1,
                  child: InputsComponent(
                    title: 'Mes de nacimiento',
                    hintext: ' 03',
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (val) => ValidationInputs.inputDateEmpty(val),
                    onChanged: (val) {},
                  ),
                ),
                SizedBox(width: size.width * .02),
                //02
                Flexible(
                  flex: 1,
                  child: InputsComponent(
                    title: 'Día de nacimiento',
                    hintext: ' 07',
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (val) => ValidationInputs.inputDateEmpty(val),
                    onChanged: (val) {},
                  ),
                ),
                SizedBox(width: size.width * .02),
                //03
                Flexible(
                  flex: 1,
                  child: InputsComponent(
                    title: 'Año de nacimiento',
                    hintext: ' 1999',
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (val) => ValidationInputs.inputDateEmpty(val),
                    onChanged: (val) {},
                  ),
                ),
              ],
            ),

            SizedBox(height: size.height * .04),
            // #6
            InputsComponent(
              title: 'Nivel de escolaridad',
              hintext: ' Ingresar nivel de escolaridad',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .04),
            // #7
            InputsComponent(
              title: 'Número de años cursados',
              hintext: ' Ingresar número de años cursados',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            // #8
            InputsComponent(
              title: 'Título obtenido',
              hintext: ' Ingresar título obtenido',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .04),
            // #9
            InputsComponent(
              title: 'Número de celular',
              hintext: ' Ingresar número de celular',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .04),
            //#10
            InputsComponent(
              title: 'Número de días al mes que labora en el cultivo de cacao',
              hintext: ' Ingresar número',
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
                /*navega a la pantalla #11*/
                Navigator.pushNamed(context, MainRoutes.foursSurveysRoute);
              },
            ),
            SizedBox(height: size.height * .06),
          ],
        ),
      ),
    );
  }
}
