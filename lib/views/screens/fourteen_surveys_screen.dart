

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #14 INFORMACIÓN DE PODAS
*/
class FourteenSurveysScreen extends StatefulWidget {

const FourteenSurveysScreen({super.key});

  @override
  State<FourteenSurveysScreen> createState() => _FourteenSurveysScreenState();
}

class _FourteenSurveysScreenState extends State<FourteenSurveysScreen> {

  TextEditingController controller = TextEditingController();

 @override
 Widget build(BuildContext context) {
 final size = MediaQuery.of(context).size;
 return Scaffold(
  appBar: AppBar(
    actions:const [
    SaveIconDraftComponents()
    ]
  ),
  body: ListView(
    physics: const BouncingScrollPhysics(),
    padding: EdgeInsets.symmetric(horizontal: size.width*.03, vertical: size.height*.03),
    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    children: [
        const TitleSurveysComponents(title:'PRÁCTICAS DE MANEJO DEL CULTIVO > INFORMACIÓN DE PODAS' ), 
        SizedBox(height: size.height*.02),
          const LinealPercentComponent(
          percent: (14 - 1) * (100 / 23) / 100,
          questions: '30',
          answers: '14',
          ),
      SizedBox(height: size.height*.04),
        //#01
        DropdownComponents(
            title: ' ¿Realiza podas?',
            initialValue: '-', 
            hintext: ' Seleccionar dato', 
            items:const ['Si', 'No'], 
            validator: (value) => ValidationInputs.inputTypeSelect(value),
            onChanged: (val){
              setState(()=>controller.text = val.toString());
            },
          ),
      if( controller.text.isNotEmpty && controller.text =='Si') SizedBox(height: size.height*.04),
    if( controller.text.isNotEmpty && controller.text =='Si')
          // #02
        Animate(
          effects: const[FadeEffect(), ScaleEffect()],
          child: DropdownComponents(
            title: ' Número de años de poda',
            initialValue: '-', 
            hintext: ' Seleccionar dato', 
            items:const ['1', '2','3','4'], 
            validator: (value) => ValidationInputs.inputTypeSelect(value),
            onChanged: (val){   
              
            },
          ),
        ),
      SizedBox(height: size.height*.06),
    
          /*boton para continuar*/
        ButtonComponents(
          title: 'Continuar',
         onPressed: (){
          //Todo: debe validar 
          /*navega a la pantalla #15*/
          Navigator.pushNamed(context, MainRoutes.fifteenSurveysRoute);
          
         },
      ),
      SizedBox(height: size.height*.06),
    ],
  ),
 );
 }
}