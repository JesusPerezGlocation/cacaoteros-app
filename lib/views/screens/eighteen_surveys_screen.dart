import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantallas 18 INFORMACIÓN DE SOMBRÍOS
*/
class EighteenSurveysScreen extends StatefulWidget {
  const EighteenSurveysScreen({super.key});

  @override
  State<EighteenSurveysScreen> createState() => _EighteenSurveysScreenState();
}

class _EighteenSurveysScreenState extends State<EighteenSurveysScreen> {
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
                    'PRÁCTICAS DE MANEJO DEL CULTIVO > INFORMACIÓN DE SOMBRÍOS'),
            SizedBox(height: size.height * .02),
            const LinealPercentComponent(
              percent: (18 - 1) * (100 / 23) / 100,
              questions: '30',
              answers: '18',
            ),
            SizedBox(height: size.height * .04),
            //#01
            DropdownComponents(
              title: ' ¿Hace manejo de sombríos?',
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
                  title: ' ¿Tipo de manejo de sombríos?',
                  initialValue: '-',
                  hintext: ' Seleccionar dato',
                  items: const [
                    'Fertiliza',
                    'Manejo sanitario',
                    'Poda',
                    'Riega'
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
                /*navega a la pantalla #19*/
                Navigator.pushNamed(context, MainRoutes.nineteenSurveysRoute);
              },
            ),
            SizedBox(height: size.height * .06),
          ],
        ),
      ),
    );
  }
}
