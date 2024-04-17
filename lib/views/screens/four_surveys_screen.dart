import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #4 UBICACIÓN DEL PREDIO
*/
class FourSurveysScreen extends StatefulWidget {
  const FourSurveysScreen({super.key});

  @override
  State<FourSurveysScreen> createState() => _FourSurveysScreenState();
}

class _FourSurveysScreenState extends State<FourSurveysScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPRV = Provider.of<SurveysVisitRegistrationProvider>(context);
    final locationPRV = Provider.of<PermissionLocationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: const [SaveIconDraftComponents()],
      ),
      body: FadeIn(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .03, vertical: size.height * .03),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            const TitleSurveysComponents(
                title:
                    'INFORMACIÓN BÁSICA DEL CACAOCULTOR > UBICACIÓN DEL PREDIO'),

            SizedBox(height: size.height * .02),

            const LinealPercentComponent(
              percent: (4 - 1) * (100 / 23) / 100,
              questions: '30',
              answers: '4',
            ),
            SizedBox(height: size.height * .04),
            //#1 buscar municipio
            InkWell(
              onTap: () {
                /*si presionan limpia el dato seleccionado */
                surveysPRV.cleanDepartaments();
                ShowModalMunicipality.showSelectDepartament(context);
              },
              child: InputDesabledComponents(
                title: 'Seleccionar departamento',
                hintext: ' Seleccionar departamento',
                enabled: false,
                controller: surveysPRV.department,
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) => surveysPRV.setDepartement(val),
              ),
            ),

            SizedBox(height: size.height * .03),
            //# 2
            if (surveysPRV.department.text.isNotEmpty)
              InkWell(
                onTap: () {
                  surveysPRV.cleanMunicipality();
                  ShowModalMunicipality.showSelectMunicipality(context);
                },
                child: InputDesabledComponents(
                  title: 'Seleccionar municipio',
                  hintext: ' Seleccionar municipio',
                  enabled: false,
                  controller: surveysPRV.municipality,
                  validator: (value) => ValidationInputs.inputTypeSelect(value),
                  onChanged: (val) => surveysPRV.setMunicipality(val),
                ),
              ),

            SizedBox(height: size.height * .03),
            //#3
            if (surveysPRV.municipality.text.isNotEmpty)
              InkWell(
                onTap: () {
                  surveysPRV.cleanPlace();
                  ShowModalMunicipality.showModalPlaces(context);
                },
                child: InputDesabledComponents(
                  title: 'Seleccionar vereda',
                  hintext: ' Seleccionar vereda',
                  enabled: false,
                  controller: surveysPRV.place,
                  validator: (value) => ValidationInputs.inputTypeSelect(value),
                  onChanged: (val) => surveysPRV.setPlace(val),
                ),
              ),

            SizedBox(height: size.height * .06),

            /*boton para continuar*/
            ButtonComponents(
              title: 'Continuar',
              onPressed: () {
                //Todo: debe validar los datos
                /*navega a la siguiente pantalla*/
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FiveSurveysScreen(locationPRV: locationPRV),
                    ));
              },
            ),
            SizedBox(height: size.height * .06),
          ],
        ),
      ),
    );
  }
}
