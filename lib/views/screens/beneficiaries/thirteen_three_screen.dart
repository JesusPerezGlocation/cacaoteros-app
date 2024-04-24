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
  /*key*/
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<BeneficiariesSurveysProvider>(context);
    return Scaffold(
      appBar: AppBar(actions: [
        SaveIconDraftComponents(
          color: PaletteColorsTheme.secondaryColor,
          onTap: () {
            SnackBarGlobalWidget.showSnackBar(
                context,
                'En proceso de construcción',
                Icons.error_outlined,
                PaletteColorsTheme.yellowColor);
          },
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
                  color: PaletteColorsTheme.secondaryColor,
                  title: 'REGISTRO FINAL'),
              SizedBox(height: size.height * .02),
              const LinealPercentComponent(
                colorOne: PaletteColorsTheme.secondaryColor,
                colorTwo: PaletteColorsTheme.colorMagentaTwo,
                percent: (13 - 1) * (100 / 13) / 100,
                questions: '13',
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
                colorButton: PaletteColorsTheme.secondaryColor,
                title: 'Autorización de información',
                check: surveysPrv.isAcceptTerm,
                onPressed: () =>
                    TermAndConditionsShowModal.showModalAuthorization(context),
              ),
              /*boton para continuar*/
              ButtonComponents(
                colorButton: PaletteColorsTheme.secondaryColor,
                title: 'Continuar',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    /*si no hay firmas no navega*/
                    if (surveysPrv.signatureTecns.isNotEmpty &&
                        surveysPrv.signatureProducts.isNotEmpty) {
                      if (surveysPrv.isAcceptTerm) {
                        /*navega a la pantalla #de enviar datos*/
                        Navigator.pushNamed(
                          context,
                          MainRoutes.endSurveysScreenRoute,
                        );
                      } else {
                        return SnackBarGlobalWidget.showSnackBar(
                          context,
                          'Por favor, acepte los términos y condiciones',
                          Icons.error_rounded,
                          PaletteColorsTheme.redErrorColor,
                        );
                      }
                    } else {
                      return SnackBarGlobalWidget.showSnackBar(
                        context,
                        'Por favor ingrese la firma',
                        Icons.error_rounded,
                        PaletteColorsTheme.redErrorColor,
                      );
                    }
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
