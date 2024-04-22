import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

class ElevenSurveysScreen extends StatefulWidget {
  const ElevenSurveysScreen({super.key});

  @override
  State<ElevenSurveysScreen> createState() => _ElevenSurveysScreenState();
}

class _ElevenSurveysScreenState extends State<ElevenSurveysScreen> {
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
                  title:
                      'MENCIONE ESPECIES DE FAUNA QUE HAYA VISTO O ENCONTRADO EN LA FINCA'),
              SizedBox(height: size.height * .02),
              const LinealPercentComponent(
                colorOne: PaletteColorsTheme.secondaryColor,
                colorTwo: PaletteColorsTheme.colorMagentaTwo,
                percent: (11 - 1) * (100 / 13) / 100,
                questions: '30',
                answers: '11',
              ),
              SizedBox(height: size.height * .04),
              //#1
              InputsComponent(
                title: 'Aves - ¿Cúales?',
                hintext: ' Ingresar aves',
                colorInputs: PaletteColorsTheme.secondaryColor,
                maxLine: 4,
                textInputAction: TextInputAction.next,
                controller: surveysPrv.birdController,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setBirdController(val),
              ),
              SizedBox(height: size.height * .04),
              //#2
              InputsComponent(
                title: 'Mamíferos - ¿Cúales?',
                hintext: ' Ingresar mamíferos',
                colorInputs: PaletteColorsTheme.secondaryColor,
                maxLine: 4,
                textInputAction: TextInputAction.next,
                controller: surveysPrv.mammalsController,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setMammalsController(val),
              ),
              SizedBox(height: size.height * .04),
              //#3
              InputsComponent(
                title: 'Reptíles - ¿Cúales?',
                hintext: ' Ingresar reptíles',
                colorInputs: PaletteColorsTheme.secondaryColor,
                maxLine: 4,
                textInputAction: TextInputAction.next,
                controller: surveysPrv.reptilesController,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setReptilesController(val),
              ),

              SizedBox(height: size.height * .06),
              ButtonComponents(
                colorButton: PaletteColorsTheme.secondaryColor,
                title: 'Continuar',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    MainRoutes.twelveSurveysRoute,
                  );
                  if (formKey.currentState!.validate()) {}
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
