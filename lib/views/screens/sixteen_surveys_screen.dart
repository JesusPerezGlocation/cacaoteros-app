import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #16 INFORMACIÓN DE SISTEMA DE RIEGO
*/
class SixteenSurveysScreen extends StatefulWidget {
  const SixteenSurveysScreen({super.key});

  @override
  State<SixteenSurveysScreen> createState() => _SixteenSurveysScreenState();
}

class _SixteenSurveysScreenState extends State<SixteenSurveysScreen> {
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
                    'PRÁCTICAS DE MANEJO DEL CULTIVO > INFORMACIÓN DE SISTEMA DE RIEGO'),
            SizedBox(height: size.height * .02),
            const LinealPercentComponent(
              percent: (16 - 1) * (100 / 23) / 100,
              questions: '30',
              answers: '16',
            ),
            SizedBox(height: size.height * .04),
            //#01
            DropdownComponents(
              title: ' ¿Posee sistema de riego?',
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
                  title: ' ¿Realiza control sanitario?',
                  initialValue: '-',
                  hintext: ' Seleccionar dato',
                  items: const ['Aspersión', 'Canales', 'Geteo', 'Otro'],
                  validator: (value) => ValidationInputs.inputTypeSelect(value),
                  onChanged: (val) {
                    setState(() => controller.text = val.toString());
                  },
                ),
              ),
            SizedBox(height: size.height * .06),

            /*boton para continuar*/
            ButtonComponents(
              title: 'Continuar',
              onPressed: () {
                //Todo: debe validar
                /*navega a la pantalla #17*/
                Navigator.pushNamed(context, MainRoutes.seveenteenSurveysRoute);
              },
            ),
            SizedBox(height: size.height * .06),
          ],
        ),
      ),
    );
  }
}
