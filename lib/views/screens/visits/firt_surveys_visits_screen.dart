import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';
import 'package:uuid/uuid.dart';

/*
primera pantalla para la encuesta de visitas
*/
class FirtSurveysVisitsScreen extends StatefulWidget {
  final String dateTime;

  const FirtSurveysVisitsScreen({
    super.key,
    required this.dateTime,
  });

  @override
  State<FirtSurveysVisitsScreen> createState() =>
      _FirtSurveysVisitsScreenState();
}

class _FirtSurveysVisitsScreenState extends State<FirtSurveysVisitsScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();

  /*genera un uuid random*/
  final uuid = const Uuid();
  String generatedIdRandom() {
    return uuid.v4();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final visitsPrv = Provider.of<VisitsSurveysProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          SaveIconDraftComponents(
            color: PaletteColorsTheme.principalColor,
            onTap: () {
              SnackBarGlobalWidget.showSnackBar(
                  context,
                  'En proceso de construcción',
                  Icons.error_outlined,
                  PaletteColorsTheme.yellowColor);
            },
          )
        ],
      ),
      body: FadeIn(
        child: FadeIn(
          child: Form(
            key: formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .03, vertical: size.height * .03),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                const TitleSurveysComponents(
                    title: 'REGISTRO DE VISITAS > INFORMACIÓN DEL BENEFICIARIO',
                    color: PaletteColorsTheme.principalColor),
                SizedBox(height: size.height * .02),
                const LinealPercentComponent(
                  colorOne: PaletteColorsTheme.principalColor,
                  colorTwo: PaletteColorsTheme.principalColor,
                  percent: (1 - 1) * (100 / 8) / 100,
                  questions: '8',
                  answers: '1',
                ),
                SizedBox(height: size.height * .04),
                Text(
                  widget.dateTime,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: size.height * .02),
                //#1
                InputsComponent(
                  title: 'Ingresar nombre del beneficiario',
                  hintext: ' Ingresar nombre',
                  textInputAction: TextInputAction.next,
                  controller: visitsPrv.beneficiaryName,
                  colorInputs: PaletteColorsTheme.principalColor,
                  validator: (val) => ValidationInputs.inputEmpty(val),
                  onChanged: (val) => visitsPrv.setBeneficiaryName(val),
                ),
                SizedBox(height: size.height * .04),
                //#2
                InputsComponent(
                  title: 'Ingresar número de documento del beneficiario',
                  hintext: ' Ingresar número de documento',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  colorInputs: PaletteColorsTheme.principalColor,
                  controller: visitsPrv.beneficiaryNumDoc,
                  validator: (val) => ValidationInputs.inputEmpty(val),
                  onChanged: (val) => visitsPrv.setbeneficiaryNumDoc(val),
                ),
                SizedBox(height: size.height * .06),
                //#
                ButtonComponents(
                  title: 'Continuar',
                  colorButton: PaletteColorsTheme.principalColor,
                  onPressed: () {
                    /*setea la fecha */
                    visitsPrv.setdateTimeSurveys(widget.dateTime);
                    /*genera un id uuid */
                    String idRandom = generatedIdRandom();
                    /*le pasa el dato del uuid id */
                    visitsPrv.setmetaInstanceUIID(idRandom);

                    /*setea el porcentaje almacenado*/
                    visitsPrv.setPercentSurvey((1 - 1) * (100 / 8) / 100);
                    /*navega a la segunda pantalla  */
                    Navigator.pushNamed(
                      context,
                      MainRoutes.secondVisitsSurveysRoute,
                    );
                    if (formKey.currentState!.validate()) {}
                  },
                ),
                SizedBox(height: size.height * .06),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
