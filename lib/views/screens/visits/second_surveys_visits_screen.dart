import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
segunda pantalla para las encuestas de visitas
*/
class SecondSurveysVisitsScreen extends StatefulWidget {
  const SecondSurveysVisitsScreen({super.key});

  @override
  State<SecondSurveysVisitsScreen> createState() =>
      _SecondSurveysVisitsScreenState();
}

class _SecondSurveysVisitsScreenState extends State<SecondSurveysVisitsScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();
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
                  title: 'REGISTRO DE VISITAS > UBICACIÓN DE LA FINCA',
                  color: PaletteColorsTheme.principalColor),
              SizedBox(height: size.height * .02),
              const LinealPercentComponent(
                colorOne: PaletteColorsTheme.principalColor,
                colorTwo: PaletteColorsTheme.principalColor,
                percent: (2 - 1) * (100 / 13) / 100,
                questions: '8',
                answers: '2',
              ),
              SizedBox(height: size.height * .04),
              //#
              InputDesabledComponents(
                title: 'Seleccionar departamento',
                hintext: ' Seleccionar',
                colorInputs: PaletteColorsTheme.principalColor,
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {},
              ),
              SizedBox(height: size.height * .04),
              //#
              InputDesabledComponents(
                title: 'Seleccionar municipio',
                hintext: ' Seleccionar',
                colorInputs: PaletteColorsTheme.principalColor,
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {},
              ),
              SizedBox(height: size.height * .04),
              //#
              InputDesabledComponents(
                title: 'Seleccionar vereda',
                hintext: ' Seleccionar',
                colorInputs: PaletteColorsTheme.principalColor,
                validator: (val) => ValidationInputs.inputTypeSelect(val),
                onChanged: (val) {},
              ),
              SizedBox(height: size.height * .06),
              ButtonComponents(
                title: 'Continuar',
                colorButton: PaletteColorsTheme.principalColor,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    MainRoutes.thirdVisitsSurveysRoute,
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
