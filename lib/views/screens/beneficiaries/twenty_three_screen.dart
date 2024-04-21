import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/routes/main_routes.dart';

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
              percent: (13 - 1) * (100 / 23) / 100,
              questions: '30',
              answers: '13',
            ),
            SizedBox(height: size.height * .04),
            //#01 firma productor
            const SignatureComponents(title: 'Ingresar firma productor'),

            SizedBox(height: size.height * .04),

            const SignatureComponents(title: 'Ingresar firma técnico de campo'),

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
                /*navega a la pantalla #24*/
                Navigator.pushNamed(
                  context,
                  MainRoutes.endSurveysScreenRoute,
                );
              },
            ),
            SizedBox(height: size.height * .06),
          ],
        ),
      ),
    );
  }
}
