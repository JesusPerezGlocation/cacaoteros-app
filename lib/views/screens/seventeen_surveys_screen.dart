import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #17 INFORMACIÓN DE FERTILIZACIÓN
*/
class SeventeenSurveysScreen extends StatefulWidget {
  const SeventeenSurveysScreen({super.key});

  @override
  State<SeventeenSurveysScreen> createState() => _SeventeenSurveysScreenState();
}

class _SeventeenSurveysScreenState extends State<SeventeenSurveysScreen> {
  TextEditingController controller = TextEditingController();

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
                  'PRÁCTICAS DE MANEJO DEL CULTIVO > INFORMACIÓN DE FERTILIZACIÓN'),
          SizedBox(height: size.height * .02),
          const LinealPercentComponent(
            percent: (17 - 1) * (100 / 23) / 100,
            questions: '30',
            answers: '17',
          ),
          SizedBox(height: size.height * .04),
          //#01
          DropdownComponents(
            title: ' ¿Realiza fertilización?',
            initialValue: '-',
            hintext: ' Seleccionar dato',
            items: const ['Si', 'No'],
            validator: (value) => ValidationInputs.inputTypeSelect(value),
            onChanged: (val) {
              setState(() => controller.text = val.toString());
            },
          ),
          if (controller.text.isNotEmpty && controller.text == 'Si')
            SizedBox(height: size.height * .04),
          if (controller.text.isNotEmpty && controller.text == 'Si')
            //#02
            Animate(
              effects: const [FadeEffect(), ScaleEffect()],
              child: DropdownComponents(
                title: ' ¿Tipo de fertilización que realiza?',
                initialValue: '-',
                hintext: ' Seleccionar dato',
                items: const [
                  'Al suelo',
                  'Foliar',
                  'Orgánica (Compost)',
                  'Otro'
                ],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {},
              ),
            ),
          if (controller.text.isNotEmpty && controller.text == 'Si')
            SizedBox(height: size.height * .04),
          if (controller.text.isNotEmpty && controller.text == 'Si')
            //#03
            Animate(
              effects: const [FadeEffect(), ScaleEffect()],
              child: DropdownComponents(
                title: ' ¿Número de fertilizaciones al año?',
                initialValue: '-',
                hintext: ' Seleccionar dato',
                items: const ['1', '2', '3', '4'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {},
              ),
            ),
          if (controller.text.isNotEmpty && controller.text == 'Si')
            SizedBox(height: size.height * .04),
          if (controller.text.isNotEmpty && controller.text == 'Si')
            //#03
            Animate(
              effects: const [FadeEffect(), ScaleEffect()],
              child: DropdownComponents(
                title: ' Indique los meses en que realiza la fertilización',
                initialValue: '-',
                hintext: ' Seleccionar dato',
                items: const [
                  'Enero',
                  'Febrero',
                  'Marzo',
                  'Abril',
                  'Mayo',
                  'Junio',
                  'Julio',
                  'Agosto',
                  'Septiembre',
                  'Octubre',
                  'Noviembre',
                  'Diciembre'
                ],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {},
              ),
            ),
          SizedBox(height: size.height * .06),

          /*boton para continuar*/
          ButtonComponents(
            title: 'Continuar',
            onPressed: () {
              //Todo: debe validar
              /*navega a la pantalla #18*/
              Navigator.pushNamed(context, MainRoutes.eighteenSurveysRoute);
            },
          ),
          SizedBox(height: size.height * .06),
        ],
      )),
    );
  }
}
