import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #9 CARACTERISTICAS DE LA VIVIENDA
*/
class NineSurveysScreen extends StatefulWidget {
  const NineSurveysScreen({super.key});

  @override
  State<NineSurveysScreen> createState() => _NineSurveysScreenState();
}

class _NineSurveysScreenState extends State<NineSurveysScreen> {
  TextEditingController typeHouse = TextEditingController();
  TextEditingController typeCeiling = TextEditingController();
  TextEditingController wallsCeiling = TextEditingController();

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
                title: 'CARACTERISTICAS DE LA VIVIENDA'),
            SizedBox(height: size.height * .02),

            const LinealPercentComponent(
              percent: (9 - 1) * (100 / 23) / 100,
              questions: '30',
              answers: '9',
            ),

            SizedBox(height: size.height * .04),
            //#1
            DropdownComponents(
              title: 'Tipo de casa',
              initialValue: 'CC',
              hintext: ' Seleccionar tipo de casa',
              items: const ['Casa', 'Carpa', 'Cuarto', 'Otro'],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {
                setState(() => typeHouse.text = val.toString());
              },
            ),
            if (typeHouse.text.isNotEmpty && typeHouse.text == 'Otro')
              SizedBox(height: size.height * .04),
            if (typeHouse.text.isNotEmpty && typeHouse.text == 'Otro')
              // #2
              Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: InputsComponent(
                  title: '¿Cuál?',
                  hintext: ' Ingresar dato',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (val) => ValidationInputs.inputEmpty(val),
                  onChanged: (val) {},
                ),
              ),
            SizedBox(height: size.height * .04),
            //#3
            DropdownComponents(
              title: 'Tipo de techo',
              initialValue: 'CC',
              hintext: ' Seleccionar tipo de techo',
              items: const ['Eternit', 'Plástico', 'Zinc', 'Otro'],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {
                setState(() => typeCeiling.text = val.toString());
              },
            ),
            if (typeCeiling.text.isNotEmpty && typeCeiling.text == 'Otro')
              SizedBox(height: size.height * .04),
            if (typeCeiling.text.isNotEmpty && typeCeiling.text == 'Otro')
              // #4
              Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: InputsComponent(
                  title: '¿Cuál?',
                  hintext: ' Ingresar dato',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (val) => ValidationInputs.inputEmpty(val),
                  onChanged: (val) {},
                ),
              ),

            SizedBox(height: size.height * .04),
            //#5
            DropdownComponents(
              title: 'Tipo de paredes',
              initialValue: 'CC',
              hintext: ' Seleccionar tipo de paredes',
              items: const [
                'Bloque',
                'Madera',
                'Madera',
                'Placa prefabiricada',
                'Otro'
              ],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {
                setState(() => wallsCeiling.text = val.toString());
              },
            ),
            if (wallsCeiling.text.isNotEmpty && wallsCeiling.text == 'Otro')
              SizedBox(height: size.height * .04),
            if (wallsCeiling.text.isNotEmpty && wallsCeiling.text == 'Otro')
              // #6
              Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: InputsComponent(
                  title: '¿Cuál?',
                  hintext: ' Ingresar dato',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (val) => ValidationInputs.inputEmpty(val),
                  onChanged: (val) {},
                ),
              ),

            SizedBox(height: size.height * .04),
            //#7
            DropdownComponents(
              title: 'Tipo de piso',
              initialValue: 'CC',
              hintext: ' Seleccionar tipo de piso',
              items: const ['Baldosa', 'Cemento', 'Tierra', 'Madera'],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .04),
            //#8
            DropdownComponents(
              title: 'Tipo de red eléctrica pública',
              initialValue: 'CC',
              hintext: ' Seleccionar tipo de red',
              items: const ['Si', 'No'],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .04),
            //#9
            DropdownComponents(
              title: 'Tipo de alcantarillado',
              initialValue: 'CC',
              hintext: ' Seleccionar tipo de alcantarillado',
              items: const ['Si', 'No'],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#10
            DropdownComponents(
              title: 'Tipo de sanitario',
              initialValue: 'CC',
              hintext: ' Seleccionar tipo de sanitario',
              items: const [
                'Convencional',
                'Letrina',
                'Pozo séptico',
                'No tiene'
              ],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#11
            DropdownComponents(
              title: 'Acceso a telefonía',
              initialValue: 'CC',
              hintext: ' Seleccionar acceso a telefonía',
              items: const ['Si', 'No'],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .04),
            //#12
            DropdownComponents(
              title: 'Recolección de basura',
              initialValue: 'CC',
              hintext: ' Seleccionar dato',
              items: const ['Si', 'No'],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#13
            DropdownComponents(
              title: 'Acueducto',
              initialValue: 'CC',
              hintext: ' Seleccionar dato',
              items: const ['Si', 'No'],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .04),
            //#14
            DropdownComponents(
              title: 'Eliminación de basura',
              initialValue: 'CC',
              hintext: ' Seleccionar dato',
              items: const [
                'Bota al patio',
                'Entierra',
                'Quema',
                'Recolección'
              ],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#15
            DropdownComponents(
              title: '¿Dónde obtiene el agua para consumo?',
              initialValue: 'CC',
              hintext: ' Seleccionar dato',
              items: const ['Lluvia', 'Pozo séptico', 'Quebrada', 'Red'],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#16
            DropdownComponents(
              title: '¿Dónde obtiene la fuente de energía para cocina?',
              initialValue: 'CC',
              hintext: ' Seleccionar dato',
              items: const [
                'Electrico',
                'Gas',
                'Gasolina',
                'Leña',
              ],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .04),
            //#16
            DropdownComponents(
              title: '¿Dónde obtiene la fuente de energía en la finca?',
              initialValue: 'CC',
              hintext: ' Seleccionar dato',
              items: const [
                'Bionergía',
                'Gasolina',
                'Red eléctrica',
                'Solar',
              ],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .06),

            /*boton para continuar*/
            ButtonComponents(
              title: 'Continuar',
              onPressed: () {
                //Todo: debe validar
                /*navega a la pantalla #9 */
                Navigator.pushNamed(context, MainRoutes.tenSurveysRoute);
              },
            ),
            SizedBox(height: size.height * .06),
          ],
        ),
      ),
    );
  }
}
