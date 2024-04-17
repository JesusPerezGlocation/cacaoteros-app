import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
  TextEditingController proyect = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(actions: const [SaveIconDraftComponents()]),
      body: FadeIn(
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
              onChanged: (val) {
                setState(() => proyect.text = val.toString());
              },
            ),
            if (proyect.text.isNotEmpty && proyect.text == 'Si')
              SizedBox(height: size.height * .04),
            if (proyect.text.isNotEmpty && proyect.text == 'Si')
              // #2
              Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: InputsComponent(
                  title: 'Nombre del proyecto',
                  hintext: ' Ingresar nombre',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (val) => ValidationInputs.inputEmpty(val),
                  onChanged: (val) {},
                ),
              ),

            if (proyect.text.isNotEmpty && proyect.text == 'Si')
              SizedBox(height: size.height * .04),
            if (proyect.text.isNotEmpty && proyect.text == 'Si')
              // #3
              Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: InputsComponent(
                  title: 'Año del proyecto',
                  hintext: ' Ingresar año',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (val) => ValidationInputs.inputEmpty(val),
                  onChanged: (val) {},
                ),
              ),

            if (proyect.text.isNotEmpty && proyect.text == 'Si')
              SizedBox(height: size.height * .04),
            if (proyect.text.isNotEmpty && proyect.text == 'Si')
              // #4
              Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: InputsComponent(
                  title: 'Tipo de apoyo recibido',
                  hintext: ' Ingresar tipo de apoyo',
                  textInputAction: TextInputAction.done,
                  maxLine: 4,
                  keyboardType: TextInputType.text,
                  validator: (val) => ValidationInputs.inputEmpty(val),
                  onChanged: (val) {},
                ),
              ),
            SizedBox(height: size.height * .06),

            /*boton para continuar*/
            ButtonComponents(
              title: 'Continuar',
              onPressed: () {
                //Todo: debe validar
                Navigator.pushNamed(context, MainRoutes.nineSurveysRoute);
              },
            ),
            SizedBox(height: size.height * .06),
          ],
        ),
      ),
    );
  }
}
