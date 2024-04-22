// ignore_for_file: use_build_context_synchronously

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #5 GEOGRAFÍA DEL PREDIO
*/
class SixSurveysScreen extends StatefulWidget {
  /*prv para obtener long y lat */
  final PermissionLocationProvider locationPRV;

  const SixSurveysScreen({
    super.key,
    required this.locationPRV,
  });

  @override
  State<SixSurveysScreen> createState() => _SixSurveysScreenState();
}

class _SixSurveysScreenState extends State<SixSurveysScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  Future getCurrentPosition() async {
    widget.locationPRV.getLocationUser();
  }

  /*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<BeneficiariesSurveysProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: const [
          SaveIconDraftComponents(color: PaletteColorsTheme.secondaryColor)
        ],
      ),
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
                      'INFORMACIÓN DE LA UNIDAD PRODUCTIVA > GEOGRAFÍA DEL PREDIO'),
              SizedBox(height: size.height * .02),
              const LinealPercentComponent(
                colorOne: PaletteColorsTheme.secondaryColor,
                colorTwo: PaletteColorsTheme.colorMagentaTwo,
                percent: (6 - 1) * (100 / 13) / 100,
                questions: '30',
                answers: '6',
              ),
              SizedBox(height: size.height * .04),
              /*componente para mostrar la longitud y la latitud */
              FutureBuilder<void>(
                future: widget.locationPRV.getPermissionLocation(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                        height: size.height * .26,
                        child: const LoadingAppComponent());
                  } else if (snapshot.hasError) {
                    return LatAndLongComponents(
                      data:
                          '${widget.locationPRV.latitude}, ${widget.locationPRV.longitude}',
                      secondData:
                          '${widget.locationPRV.accuracy}, ${widget.locationPRV.altitude}',
                      onTap: () async {
                        await widget.locationPRV.getPermissionLocation(context);
                      },
                    );
                  } else {
                    return FadeIn(
                      child: LatAndLongComponents(
                        data:
                            '${widget.locationPRV.latitude}, ${widget.locationPRV.longitude}',
                        secondData:
                            '${widget.locationPRV.accuracy}, ${widget.locationPRV.altitude}',
                        onTap: () async {
                          await widget.locationPRV
                              .getPermissionLocation(context);
                        },
                      ),
                    );
                  }
                },
              ),

              SizedBox(height: size.height * .03),
              //#1
              InputsComponent(
                title: '¿Cúales son esos otros cultivos',
                hintext: ' Ingresar dato',
                colorInputs: PaletteColorsTheme.secondaryColor,
                textInputAction: TextInputAction.next,
                maxLine: 4,
                controller: surveysPrv.otherCultives,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setoOtherCultives(val),
              ),

              SizedBox(height: size.height * .03),
              //#2
              DropdownComponents(
                title:
                    '¿Cuenta con especies maderables para el sombrío del cacao?',
                initialValue: 'CC',
                hintext: 'Seleccionar dato',
                colorInputs: PaletteColorsTheme.secondaryColor,
                items: const ['Si', 'No'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPrv.setTimberSpecies('1');
                      break;
                    case 'No':
                      surveysPrv.setTimberSpecies('2');
                      break;
                    default:
                  }
                },
              ),
              if (surveysPrv.timberSpecies.text.isNotEmpty &&
                  surveysPrv.timberSpecies.text == '1')
                SizedBox(height: size.height * .03),
              //#3
              if (surveysPrv.timberSpecies.text.isNotEmpty &&
                  surveysPrv.timberSpecies.text == '1')
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cúales?',
                    hintext: ' Ingresar especies',
                    colorInputs: PaletteColorsTheme.secondaryColor,
                    maxLine: 3,
                    textInputAction: TextInputAction.next,
                    controller: surveysPrv.timberSpeciesOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) => surveysPrv.setTimberSpeciesOther(val),
                  ),
                ),
              SizedBox(height: size.height * .03),
              //#4
              InputsComponent(
                title: 'Número total de árboles maderables en el lote',
                hintext: ' Ingresar total de árboles',
                colorInputs: PaletteColorsTheme.secondaryColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                controller: surveysPrv.timberTrees,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => surveysPrv.setTimberTrees(val),
              ),
              SizedBox(height: size.height * .03),
              //#5
              DropdownComponents(
                title: '¿Cuenta con material vegetal certificado?',
                initialValue: 'CC',
                hintext: 'Seleccionar dato',
                colorInputs: PaletteColorsTheme.secondaryColor,
                items: const ['Si', 'No'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPrv.setMaterialsVegetables('1');
                      break;
                    case 'No':
                      surveysPrv.setMaterialsVegetables('2');
                      break;
                    default:
                  }
                },
              ),
              SizedBox(height: size.height * .03),
              //#6
              DropdownComponents(
                title: '¿Tiene cultivos en asocio con el cacao?',
                initialValue: 'CC',
                hintext: 'Seleccionar dato',
                colorInputs: PaletteColorsTheme.secondaryColor,
                items: const ['Si', 'No'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Si':
                      surveysPrv.setAssociationWithCocoa('1');
                      break;
                    case 'No':
                      surveysPrv.setAssociationWithCocoa('2');
                      break;
                    default:
                  }
                },
              ),
              if (surveysPrv.associationWithCocoa.text.isNotEmpty &&
                  surveysPrv.associationWithCocoa.text == '1')
                SizedBox(height: size.height * .03),
              //#7
              if (surveysPrv.associationWithCocoa.text.isNotEmpty &&
                  surveysPrv.associationWithCocoa.text == '1')
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cúales?',
                    hintext: ' Ingresar cultivos',
                    colorInputs: PaletteColorsTheme.secondaryColor,
                    maxLine: 3,
                    textInputAction: TextInputAction.next,
                    controller: surveysPrv.associationWithCocoaOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setAssociationWithCocoaOther(val),
                  ),
                ),
              SizedBox(height: size.height * .03),
              //#8
              DropdownComponents(
                title:
                    '¿Tipo de sistema productivo de cacao implementado en la finca?',
                initialValue: 'CC',
                hintext: 'Seleccionar dato',
                colorInputs: PaletteColorsTheme.secondaryColor,
                items: const [
                  'Sistema agroforestal',
                  'Libre exposición',
                  'Otro'
                ],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) {
                  switch (val.toString()) {
                    case 'Sistema agroforestal':
                      surveysPrv.setSystemTypeProduct('1');
                      break;
                    case 'Libre exposición':
                      surveysPrv.setSystemTypeProduct('2');
                      break;
                    case 'Otro':
                      surveysPrv.setSystemTypeProduct('3');
                      break;
                    default:
                  }
                },
              ),
              if (surveysPrv.systemTypeProduct.text.isNotEmpty &&
                  surveysPrv.systemTypeProduct.text == '3')
                SizedBox(height: size.height * .03),
              //#9
              if (surveysPrv.systemTypeProduct.text.isNotEmpty &&
                  surveysPrv.systemTypeProduct.text == '3')
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: '¿Cúales?',
                    hintext: ' Ingresar sistema',
                    colorInputs: PaletteColorsTheme.secondaryColor,
                    textInputAction: TextInputAction.next,
                    controller: surveysPrv.systemTypeProductOther,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) =>
                        surveysPrv.setSystemTypeProductOther(val),
                  ),
                ),
              SizedBox(height: size.height * .06),

              /*boton para continuar*/
              ButtonComponents(
                colorButton: PaletteColorsTheme.secondaryColor,
                title: 'Continuar',
                onPressed: () async {
                  /*añade la latitud al provider*/
                  surveysPrv.setUpdateLocation(
                      widget.locationPRV.latitude,
                      widget.locationPRV.longitude,
                      widget.locationPRV.accuracy,
                      widget.locationPRV.altitude);
                  /*navega a la siguente pantalla*/
                  Navigator.pushNamed(
                    context,
                    MainRoutes.sevenSurveysRoute,
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
