import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #6 para las visitas
*/
class SixSurveysVisitsScreen extends StatefulWidget {
  const SixSurveysVisitsScreen({super.key});

  @override
  State<SixSurveysVisitsScreen> createState() => _SixSurveysVisitsScreenState();
}

class _SixSurveysVisitsScreenState extends State<SixSurveysVisitsScreen> {
  // /*key*/
  final formKey = GlobalKey<FormState>();

  final GlobalKey<SignatureState> signBeneficiary = GlobalKey<SignatureState>();
  final GlobalKey<SignatureState> signatureTecnh = GlobalKey<SignatureState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(actions: [
        SaveIconDraftComponents(
          color: PaletteColorsTheme.principalColor,
          onTap: () {},
        )
      ]),
      body: FadeIn(
        child: Form(
          key: formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .03, vertical: size.height * .03),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              const TitleSurveysComponents(
                  title: 'FIRMAS DE LA VISITA',
                  color: PaletteColorsTheme.principalColor),
              SizedBox(height: size.height * .02),
              const LinealPercentComponent(
                colorOne: PaletteColorsTheme.principalColor,
                colorTwo: PaletteColorsTheme.principalColor,
                percent: (6 - 1) * (100 / 13) / 100,
                questions: '8',
                answers: '6',
              ),
              SizedBox(height: size.height * .04),
              //#1
              SignatureDrawComponents(
                title: 'Firma del beneficiario',
                color: PaletteColorsTheme.principalColor,
                signatureKey: signBeneficiary,
                onSet: (val) {},
              ),
              SizedBox(height: size.height * .04),
              //#2
              SignatureDrawComponents(
                title: 'Firma del técnico',
                color: PaletteColorsTheme.principalColor,
                signatureKey: signatureTecnh,
                onSet: (val) {},
              ),
              SizedBox(height: size.height * .06),
              /*button*/
              ButtonComponents(
                title: 'Continuar',
                colorButton: PaletteColorsTheme.principalColor,
                onPressed: () {
                  //todo: !!!en caso de que el contralador de la firma este vacia no lo debe dejar navegar
                  Navigator.pushNamed(
                    context,
                    MainRoutes.sevenVisitsSurveysRoute,
                  );
                },
              ),
              SizedBox(height: size.height * .06),
            ],
          ),
        ),
      ),
    );
  }
}
