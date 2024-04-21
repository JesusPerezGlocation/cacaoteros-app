import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/routes/main_routes.dart';

/*
pantalla #23 REGISTRO FINAL
*/
class ThirteenurveysScreen extends StatefulWidget {
  const ThirteenurveysScreen({super.key});

  @override
  State<ThirteenurveysScreen> createState() => _ThirteenurveysScreenState();
}

class _ThirteenurveysScreenState extends State<ThirteenurveysScreen> {
  final GlobalKey<SignatureState> signKeyProduct = GlobalKey<SignatureState>();
  final GlobalKey<SignatureState> signatureTecnh = GlobalKey<SignatureState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<BeneficiariesSurveysProvider>(context);
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
              percent: (13 - 1) * (100 / 13) / 100,
              questions: '30',
              answers: '13',
            ),
            SizedBox(height: size.height * .04),
            //#01 firma productor
            SignatureComponentsProdcuts(
              title: 'Ingresar firma productor',
              signatureKey: signKeyProduct,
              provider: surveysPrv,
            ),

            SizedBox(height: size.height * .04),

            SignatureComponentTieldTechnician(
              title: 'Ingresar firma técnico de campo',
              signatureKey: signatureTecnh,
              provider: surveysPrv,
            ),

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
