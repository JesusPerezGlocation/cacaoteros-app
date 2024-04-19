import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #8 INFORMACIÓN DE PROYECTOS
*/
class EightSurveysScreen extends StatefulWidget {
  const EightSurveysScreen({super.key});

  @override
  State<EightSurveysScreen> createState() => _EightSurveysScreenState();
}

class _EightSurveysScreenState extends State<EightSurveysScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<SurveysVisitRegistrationProvider>(context);
    return Scaffold(
      appBar: AppBar(actions: const [SaveIconDraftComponents()]),
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
                  title:
                      'INFORMACIÓN BÁSICA DEL CACAOCULTOR > INFORMACIÓN DE PROYECTOS'),
              SizedBox(height: size.height * .02),

              const LinealPercentComponent(
                percent: (8 - 1) * (100 / 23) / 100,
                questions: '30',
                answers: '8',
              ),

              SizedBox(height: size.height * .04),
              //#1
              DropdownComponents(
                title: '¿Ha sido apoyado por un proyecto de Fomento Cacaotero?',
                initialValue: 'CC',
                hintext: ' Seleccionar dato',
                items: const ['Si', 'No'],
                validator: (value) => ValidationInputs.inputTypeSelect(value),
                onChanged: (val) =>
                    surveysPrv.setSupportedProject(val.toString()),
              ),
              if (surveysPrv.supportedProject.text.isNotEmpty &&
                  surveysPrv.supportedProject.text == 'Si')
                SizedBox(height: size.height * .04),
              if (surveysPrv.supportedProject.text.isNotEmpty &&
                  surveysPrv.supportedProject.text == 'Si')
                // #2
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: 'Nombre del proyecto',
                    hintext: ' Ingresar nombre',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    controller: surveysPrv.nameSupportProject,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) => surveysPrv.setNameSupportProject(val),
                  ),
                ),

              if (surveysPrv.supportedProject.text.isNotEmpty &&
                  surveysPrv.supportedProject.text == 'Si')
                SizedBox(height: size.height * .04),
              if (surveysPrv.supportedProject.text.isNotEmpty &&
                  surveysPrv.supportedProject.text == 'Si')
                // #3
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsDatesComponent(
                    title: 'Año del proyecto',
                    hintext: ' Ingresar año',
                    maxLength: 4,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    controller: surveysPrv.yearSupportProject,
                    validator: (val) => ValidationInputs.validateYear(val),
                    onChanged: (val) => surveysPrv.setYearSupportProject(val),
                  ),
                ),

              if (surveysPrv.supportedProject.text.isNotEmpty &&
                  surveysPrv.supportedProject.text == 'Si')
                SizedBox(height: size.height * .04),
              if (surveysPrv.supportedProject.text.isNotEmpty &&
                  surveysPrv.supportedProject.text == 'Si')
                // #4
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: InputsComponent(
                    title: 'Tipo de apoyo recibido',
                    hintext: ' Ingresar tipo de apoyo',
                    textInputAction: TextInputAction.done,
                    maxLine: 4,
                    keyboardType: TextInputType.text,
                    controller: surveysPrv.typeSupportProject,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) => surveysPrv.setTypeSupportProject(val),
                  ),
                ),
              SizedBox(height: size.height * .06),
              /* boton para continuar */
              ButtonComponents(
                title: 'Continuar',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    /*navega a la pantalla #9 */
                    Navigator.pushNamed(
                      context,
                      MainRoutes.nineSurveysRoute,
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
