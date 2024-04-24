import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla 5 para las encuestas de visitas
*/
class FiveSurveysVisitsScreen extends StatefulWidget {
  const FiveSurveysVisitsScreen({super.key});

  @override
  State<FiveSurveysVisitsScreen> createState() =>
      _FiveSurveysVisitsScreenState();
}

class _FiveSurveysVisitsScreenState extends State<FiveSurveysVisitsScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final visitsPrv = Provider.of<VisitsSurveysProvider>(context);
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
                  title: 'SITUACIÓN ACTUAL DEL PROYECTO > VISITA',
                  color: PaletteColorsTheme.principalColor),
              SizedBox(height: size.height * .02),
              const LinealPercentComponent(
                colorOne: PaletteColorsTheme.principalColor,
                colorTwo: PaletteColorsTheme.principalColor,
                percent: (5 - 1) * (100 / 13) / 100,
                questions: '8',
                answers: '5',
              ),
              SizedBox(height: size.height * .04),
              //#1
              InputsComponent(
                title: 'Ingresar objetivo de la visita',
                hintext: ' Ingresar objetivo',
                maxLine: 4,
                colorInputs: PaletteColorsTheme.principalColor,
                controller: visitsPrv.objectiveVisit,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => visitsPrv.setobjectiveVisit(val),
              ),
              SizedBox(height: size.height * .04),
              //#2
              InputsComponent(
                title: 'Ingresar situación encontrada',
                hintext: ' Ingresar situación',
                maxLine: 4,
                controller: visitsPrv.situationFound,
                colorInputs: PaletteColorsTheme.principalColor,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => visitsPrv.setsituationFound(val),
              ),
              SizedBox(height: size.height * .04),
              //#3
              InputsComponent(
                title: 'Ingresar recomendaciones',
                hintext: ' Ingresar recomendaciones',
                maxLine: 4,
                controller: visitsPrv.recomendations,
                colorInputs: PaletteColorsTheme.principalColor,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => visitsPrv.setrecomendations(val),
              ),
              SizedBox(height: size.height * .04),
              //#4
              InputsComponent(
                title: 'Ingresar compromisos del beneficio',
                hintext: ' Ingresar compromisos',
                maxLine: 4,
                controller: visitsPrv.beneficiaryCommitment,
                colorInputs: PaletteColorsTheme.principalColor,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => visitsPrv.setbeneficiaryCommitment(val),
              ),
              SizedBox(height: size.height * .06),

              ButtonComponents(
                title: 'Continuar',
                colorButton: PaletteColorsTheme.principalColor,
                onPressed: () {
                  /*navega a la pantalla #6 */
                  Navigator.pushNamed(
                    context,
                    MainRoutes.sixVisitsSurveysRoute,
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
