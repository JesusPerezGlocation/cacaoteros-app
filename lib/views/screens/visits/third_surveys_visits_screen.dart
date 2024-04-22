import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla 3 para las encuestas de visitas
*/
class ThirdSurveysVisitsScreen extends StatefulWidget {
  const ThirdSurveysVisitsScreen({super.key});

  @override
  State<ThirdSurveysVisitsScreen> createState() =>
      _ThirdSurveysVisitsScreenState();
}

class _ThirdSurveysVisitsScreenState extends State<ThirdSurveysVisitsScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  TextEditingController controllerTwo = TextEditingController();

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
                  title: 'REGISTRO DE VISITAS > INFORMACIÓN DE LA FINCA',
                  color: PaletteColorsTheme.principalColor),
              SizedBox(height: size.height * .02),
              const LinealPercentComponent(
                colorOne: PaletteColorsTheme.principalColor,
                colorTwo: PaletteColorsTheme.principalColor,
                percent: (3 - 1) * (100 / 13) / 100,
                questions: '30',
                answers: '3',
              ),
              SizedBox(height: size.height * .04),
              //#1
              InputsComponent(
                title: 'Ingresar nombre de la finca',
                hintext: ' Ingresar nombre',
                colorInputs: PaletteColorsTheme.principalColor,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) {},
              ),
              SizedBox(height: size.height * .04),
              //#2
              InputsComponent(
                title: 'Ingresar área de la finca',
                hintext: ' Ingresar área',
                keyboardType: TextInputType.number,
                controller: controller,
                colorInputs: PaletteColorsTheme.principalColor,
                validator: (val) => ValidationInputs.validationArea(val,
                    otherValue: controller.text, isCacao: false),
                onChanged: (val) {},
              ),
              SizedBox(height: size.height * .04),
              //#3
              InputsComponent(
                title: 'Ingresar área en cacao',
                hintext: ' Ingresar área',
                keyboardType: TextInputType.number,
                colorInputs: PaletteColorsTheme.principalColor,
                controller: controllerTwo,
                validator: (val) => ValidationInputs.validationArea(val,
                    otherValue: controllerTwo.text, isCacao: true),
                onChanged: (val) {},
              ),

              SizedBox(height: size.height * .06),

              ButtonComponents(
                title: 'Continuar',
                colorButton: PaletteColorsTheme.principalColor,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    MainRoutes.fourVisitsSurveysRoute,
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
