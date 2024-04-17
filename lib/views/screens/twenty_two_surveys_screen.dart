import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #22 APOYO INSTITUCIONAL
*/
class TwentyTwoSurveysScreen extends StatefulWidget {
  const TwentyTwoSurveysScreen({super.key});

  @override
  State<TwentyTwoSurveysScreen> createState() => _TwentyTwoSurveysScreenState();
}

class _TwentyTwoSurveysScreenState extends State<TwentyTwoSurveysScreen> {
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
            const TitleSurveysComponents(title: 'APOYO INSTITUCIONAL'),
            SizedBox(height: size.height * .02),
            const LinealPercentComponent(
              percent: (22 - 1) * (100 / 23) / 100,
              questions: '30',
              answers: '22',
            ),
            SizedBox(height: size.height * .04),
            //#01
            InputsComponent(
              title:
                  'Nombre organizaciones que lo han apoyado en su cultivo de cacao',
              hintext: ' Ingresar nombre de organizaciones',
              textInputAction: TextInputAction.next,
              maxLine: 4,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .04),
            //#02
            DropdownComponents(
              title:
                  ' Mayor limitante en su finca para para mejorar su cultivo',
              initialValue: '-',
              hintext: ' Seleccionar dato',
              items: const [
                'Agua',
                'Capital de trabajo (\$)',
                'Conocimiento técnico',
                'Inseguridad',
                'Mano de obra',
                'Precio de venta',
                'Vías de acceso',
                'Otro',
              ],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {
                setState(() => controller.text = val.toString());
              },
            ),
            if (controller.text.isNotEmpty && controller.text == 'Otro')
              SizedBox(height: size.height * .04),
            if (controller.text.isNotEmpty && controller.text == 'Otro')
              // #3
              Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: InputsComponent(
                  title: '¿Cuál?',
                  hintext: ' Ingresar dato',
                  textInputAction: TextInputAction.next,
                  validator: (val) => ValidationInputs.inputEmpty(val),
                  onChanged: (val) {},
                ),
              ),

            SizedBox(height: size.height * .06),

            /*boton para continuar*/
            ButtonComponents(
              title: 'Continuar',
              onPressed: () {
                //Todo: debe validar
                /*navega a la pantalla #*/
                Navigator.pushNamed(
                    context, MainRoutes.twentyThreeSurveysRoute);
              },
            ),
            SizedBox(height: size.height * .06),
          ],
        ),
      ),
    );
  }
}
