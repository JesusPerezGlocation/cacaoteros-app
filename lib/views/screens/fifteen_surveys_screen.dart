import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/routes/main_routes.dart';

/*
pantalla #15 INFORMACIÓN DE CONTROL SANITARIO
*/
class FifteenSurveysScreen extends StatefulWidget {
  const FifteenSurveysScreen({super.key});

  @override
  State<FifteenSurveysScreen> createState() => _FifteenSurveysScreenState();
}

class _FifteenSurveysScreenState extends State<FifteenSurveysScreen> {
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
                    'PRÁCTICAS DE MANEJO DEL CULTIVO > INFORMACIÓN DE CONTROL SANITARIO'),
            SizedBox(height: size.height * .02),
            const LinealPercentComponent(
              percent: (15 - 1) * (100 / 23) / 100,
              questions: '30',
              answers: '15',
            ),
            SizedBox(height: size.height * .04),
            //#01
            DropdownComponents(
              title: ' ¿Realiza control sanitario?',
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
              // #2
              Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: InputsComponent(
                  title: 'Problemas sanitarios que controla',
                  hintext: ' Ingresar nombre',
                  maxLine: 4,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (val) => ValidationInputs.inputEmpty(val),
                  onChanged: (val) {},
                ),
              ),

            if (controller.text.isNotEmpty && controller.text == 'Si')
              SizedBox(height: size.height * .04),
            if (controller.text.isNotEmpty && controller.text == 'Si')
              //#04
              Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: DropdownComponents(
                  title: ' ¿Realiza control sanitario?',
                  initialValue: '-',
                  hintext: ' Seleccionar dato',
                  items: const ['Semanal', 'Quincenal', 'Mensual', 'Otro'],
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
                /*navega a la pantalla #16*/
                Navigator.pushNamed(context, MainRoutes.sixteenSurveysRoute);
              },
            ),
            SizedBox(height: size.height * .06),
          ],
        ),
      ),
    );
  }
}
