import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    final visitsPrv = Provider.of<VisitsSurveysProvider>(context);
    final domianPrv = Provider.of<SendImageApi>(context);
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
                percent: (6 - 1) * (100 / 8) / 100,
                questions: '8',
                answers: '6',
              ),
              SizedBox(height: size.height * .04),
              //#1
              SignatureDrawComponents(
                title: 'Firma del beneficiario',
                color: PaletteColorsTheme.principalColor,
                signatureKey: signBeneficiary,
                isViewButton:
                    visitsPrv.signatureBeneficiary.isEmpty ? true : false,
                onSet: (val) async {
                  domianPrv.setSignature(val);

                  await domianPrv.sendSignatureImageApi();

                  visitsPrv.setSignatureBeneficiary(domianPrv.image);
                },
                onDelete: () => visitsPrv.deleteSignatureBeneficiary(),
              ),
              SizedBox(height: size.height * .04),
              //#2
              SignatureDrawComponents(
                title: 'Firma del técnico',
                color: PaletteColorsTheme.principalColor,
                signatureKey: signatureTecnh,
                isViewButton: visitsPrv.signatureTecns.isEmpty ? true : false,
                // onSet: (val) => visitsPrv.setSignatureTecns(val),
                onSet: (val) async {
                  domianPrv.setSignature(val);

                  await domianPrv.sendSignatureImageApi();

                  visitsPrv.setSignatureTecns(domianPrv.image);
                },
                onDelete: () => visitsPrv.deleteSignatureTecns(),
              ),
              SizedBox(height: size.height * .06),
              /*button*/
              ButtonComponents(
                title: 'Continuar',
                colorButton: PaletteColorsTheme.principalColor,
                onPressed: () {
                  if (visitsPrv.signatureBeneficiary.isNotEmpty &&
                      visitsPrv.signatureTecns.isNotEmpty) {
                    /*setea el porcentaje almacenado*/
                    visitsPrv.setPercentSurvey((6 - 1) * (100 / 8) / 100);

                    /*navega a la siguiente pantalla*/
                    Navigator.pushNamed(
                      context,
                      MainRoutes.sevenVisitsSurveysRoute,
                    );
                  } else {
                    return SnackBarGlobalWidget.showSnackBar(
                      context,
                      'Por favor ingrese la firma',
                      Icons.error_rounded,
                      PaletteColorsTheme.redErrorColor,
                    );
                  }
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
