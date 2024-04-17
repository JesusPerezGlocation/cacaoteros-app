import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #23 REGISTRO FINAL
*/
class TwentyThreeSurveysScreen extends StatefulWidget {
  const TwentyThreeSurveysScreen({super.key});

  @override
  State<TwentyThreeSurveysScreen> createState() =>
      _TwentyThreeSurveysScreenState();
}

class _TwentyThreeSurveysScreenState extends State<TwentyThreeSurveysScreen> {
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
            const TitleSurveysComponents(title: 'REGISTRO FINAL'),
            SizedBox(height: size.height * .02),
            const LinealPercentComponent(
              percent: (23 - 1) * (100 / 23) / 100,
              questions: '30',
              answers: '23',
            ),
            SizedBox(height: size.height * .04),
            //#01
            InputsComponent(
              title: 'Nombre del encuestado(a)',
              hintext: ' Ingresar nombre',
              textInputAction: TextInputAction.next,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .04),
            //#02
            DropdownComponents(
              title: ' Relación con el cacaocultor',
              initialValue: '-',
              hintext: ' Seleccionar relación',
              items: const [
                'Administración',
                'Familiar',
                'Propietario',
              ],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {
                setState(() => controller.text = val.toString());
              },
            ),
            if (controller.text.isNotEmpty && controller.text == 'Familiar')
              SizedBox(height: size.height * .04),
            if (controller.text.isNotEmpty && controller.text == 'Familiar')
              // #3
              Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: DropdownComponents(
                  title: ' En caso de ser familiar cuál es el parentesco',
                  initialValue: '-',
                  hintext: ' Seleccionar dato',
                  items: const [
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                  ],
                  validator: (value) => ValidationInputs.inputTypeSelect(value),
                  onChanged: (val) {},
                ),
              ),

            SizedBox(height: size.height * .04),
            //04 firma
            const SignatureComponents(),
            SizedBox(height: size.height * .06),
            /*check */
            CheckbuttonComponent(
              title: 'Autorización de información',
              check: false,
              onPressed: () =>
                  TermAndConditionsShowModal.showModalAuthorization(context),
            ),
            /*boton para continuar*/
            ButtonComponents(
              title: 'Continuar',
              onPressed: () {
                //Todo: debe validar
                /*navega a la pantalla #24*/
                Navigator.pushNamed(context, MainRoutes.twentyFourSurveysRoute);
              },
            ),
            SizedBox(height: size.height * .06),
          ],
        ),
      ),
    );
  }
}
