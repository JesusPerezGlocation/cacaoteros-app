import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #21 INFORMACIÓN AMBIENTAL
*/
class TwentyOneSurveysScreen extends StatefulWidget {
  const TwentyOneSurveysScreen({super.key});

  @override
  State<TwentyOneSurveysScreen> createState() => _TwentyOneSurveysScreenState();
}

class _TwentyOneSurveysScreenState extends State<TwentyOneSurveysScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(actions: const [SaveIconDraftComponents()]),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .03, vertical: size.height * .03),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          const TitleSurveysComponents(title: 'INFORMACIÓN AMBIENTAL'),
          SizedBox(height: size.height * .02),
          const LinealPercentComponent(
            percent: (21 - 1) * (100 / 23) / 100,
            questions: '30',
            answers: '21',
          ),
          SizedBox(height: size.height * .04),
          //#01
          DropdownComponents(
            title: ' ¿Posee cauce de agua cercana?',
            initialValue: '-',
            hintext: ' Seleccionar dato',
            items: const ['Si', 'No'],
            validator: (value) => ValidationInputs.inputTypeSelect(value),
            onChanged: (val) {
              setState(() => controller.text = val.toString());
            },
          ),
          if (controller.text.isNotEmpty && controller.text == 'Si')
            SizedBox(height: size.height * .04),
          if (controller.text.isNotEmpty && controller.text == 'Si')
            // #2
            Animate(
              effects: const [FadeEffect(), ScaleEffect()],
              child: InputsComponent(
                title: 'Porcentaje de cobertura boscosa de la finca',
                hintext: ' Ingresar porcentaje',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) {},
              ),
            ),
          SizedBox(height: size.height * .04),
          //#03
          InputsComponent(
            title: 'Nombre del cause de agua cercano',
            hintext: ' Ingresar nombre',
            textInputAction: TextInputAction.next,
            validator: (val) => ValidationInputs.inputEmpty(val),
            onChanged: (val) {},
          ),
          SizedBox(height: size.height * .04),
          //#04
          InputsComponent(
            title: 'Porcentaje de cobertura boscosa de la finca',
            hintext: ' Ingresar porcentaje',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            validator: (val) => ValidationInputs.inputEmpty(val),
            onChanged: (val) {},
          ),
          SizedBox(height: size.height * .04),
          //#05
          DropdownComponents(
            title: ' ¿Tipo de cobertura boscosa dentro de la finca?',
            initialValue: '-',
            hintext: ' Seleccionar dato',
            items: const [
              'Bosque primario',
              'Bosque secundario',
              'Galería',
              'Ninguno'
            ],
            validator: (value) => ValidationInputs.inputTypeSelect(value),
            onChanged: (val) {},
          ),
          SizedBox(height: size.height * .04),
          //#06
          DropdownComponents(
            title: ' ¿Tipo de cobertura del terreno anterior al cacao?',
            initialValue: '-',
            hintext: ' Seleccionar dato',
            items: const ['Bosque', 'Cultivo', 'Pasto', 'Rastrojo'],
            validator: (value) => ValidationInputs.inputTypeSelect(value),
            onChanged: (val) {},
          ),
          SizedBox(height: size.height * .04),
          //#07
          DropdownComponents(
            title: ' ¿Tipo de sistema implementado en la finca?',
            initialValue: '-',
            hintext: ' Seleccionar dato',
            items: const [
              'Agroforestal',
              'Agroforestal con especie nativa',
              'Agriturístico',
              'Observación fauna y flora'
            ],
            validator: (value) => ValidationInputs.inputTypeSelect(value),
            onChanged: (val) {},
          ),
          SizedBox(height: size.height * .04),
          //#08
          InputsComponent(
            title: 'Mencione especies de flora nativa en la finca',
            hintext: ' Ingresar especies',
            textInputAction: TextInputAction.next,
            maxLine: 4,
            validator: (val) => ValidationInputs.inputEmpty(val),
            onChanged: (val) {},
          ),
          SizedBox(height: size.height * .04),
          //#09
          InputsComponent(
            title: 'Mencione especies de fauna nativa en la finca',
            hintext: ' Ingresar especies de fauna',
            textInputAction: TextInputAction.next,
            maxLine: 4,
            validator: (val) => ValidationInputs.inputEmpty(val),
            onChanged: (val) {},
          ),
          SizedBox(height: size.height * .06),

          /*boton para continuar*/
          ButtonComponents(
            title: 'Continuar',
            onPressed: () {
              //Todo: debe validar
              /*navega a la pantalla #22*/
              Navigator.pushNamed(context, MainRoutes.twentyTwoSurveysRoute);
            },
          ),
          SizedBox(height: size.height * .06),
        ],
      ),
    );
  }
}
