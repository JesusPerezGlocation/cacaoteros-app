import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              InkWell(
                onTap: () => ShowModalSelectWidget.showModalReusableDepartments(
                  context,
                  visitsPrv.selectDepartment,
                  visitsPrv.codeDepartament,
                  (deparment) => visitsPrv.setselectDepartment(deparment),
                  (code) => visitsPrv.setCodeDepartament(code),
                ),
                child: InputDesabledComponents(
                  title: 'Seleccionar departamento',
                  hintext: ' Seleccionar',
                  controller: visitsPrv.selectDepartment,
                  colorInputs: PaletteColorsTheme.principalColor,
                  validator: (val) => ValidationInputs.inputTypeSelect(val),
                  onChanged: (val) => visitsPrv.setselectDepartment(val),
                ),
              ),
              SizedBox(height: size.height * .04),
              //#
              InkWell(
                onTap: () =>
                    ShowModalSelectWidget.showModalReusableMunicipality(
                  context,
                  visitsPrv.selectDepartment,
                  visitsPrv.selectMunicipality,
                  visitsPrv.codeMunicipality,
                  (department) => visitsPrv.setselectMunicipality(department),
                  (code) => visitsPrv.setCodeMunicipality(code),
                ),
                child: InputDesabledComponents(
                  title: 'Seleccionar municipio',
                  hintext: ' Seleccionar',
                  controller: visitsPrv.selectMunicipality,
                  colorInputs: PaletteColorsTheme.principalColor,
                  validator: (val) => ValidationInputs.inputTypeSelect(val),
                  onChanged: (val) => visitsPrv.setselectMunicipality(val),
                ),
              ),
              SizedBox(height: size.height * .04),
              //#
              InkWell(
                onTap: () => ShowModalSelectWidget.showModalReusableVereda(
                  context,
                  visitsPrv.selectMunicipality,
                  visitsPrv.place,
                  visitsPrv.codePlace,
                  (department) => visitsPrv.setPlace(department),
                  (code) => visitsPrv.setCodePlace(code),
                ),
                child: InputDesabledComponents(
                  title: 'Seleccionar vereda',
                  hintext: ' Seleccionar',
                  controller: visitsPrv.place,
                  colorInputs: PaletteColorsTheme.principalColor,
                  validator: (val) => ValidationInputs.inputTypeSelect(val),
                  onChanged: (val) => visitsPrv.setPlace(val),
                ),
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
