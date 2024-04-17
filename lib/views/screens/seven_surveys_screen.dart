

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla número #7 información bancaria
*/
class SevenSurveysScreen extends StatefulWidget {

const SevenSurveysScreen({super.key});

  @override
  State<SevenSurveysScreen> createState() => _SevenSurveysScreenState();
}

class _SevenSurveysScreenState extends State<SevenSurveysScreen> {

TextEditingController accountBank =TextEditingController();
TextEditingController credit =TextEditingController();

 @override
 Widget build(BuildContext context) {
 final size = MediaQuery.of(context).size;
 return Scaffold(
  appBar: AppBar(
    actions:const [
    SaveIconDraftComponents()
    ]
  ),
  body: FadeIn(
    child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: size.width*.03, vertical: size.height*.03),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
        const TitleSurveysComponents(title:'INFORMACIÓN BÁSICA DEL CACAOCULTOR > INFORMACIÓN BANCARIA'), 
        SizedBox(height: size.height*.02),
        
        const LinealPercentComponent(
        percent: (7 - 1) * (100 / 23) / 100, 
        questions: '30',
        answers: '7',
        ),
        SizedBox(height: size.height*.04),
         //#1
         DropdownComponents(
           title: '¿Posee cuenta bancaria?',
           initialValue: 'CC', 
           hintext: ' Seleccionar dato', 
           items:const ['Si', 'No'], 
           validator: (value) => ValidationInputs.inputTypeSelect(value),
           onChanged: (val){   
            setState(()=> accountBank.text = val.toString());  
           },
         ),
    
      if( accountBank.text.isNotEmpty && accountBank.text =='Si') SizedBox(height: size.height*.04),
      if( accountBank.text.isNotEmpty && accountBank.text =='Si')
        // #2
        Animate(
          effects: const[FadeEffect(), ScaleEffect()],
          child: InputsComponent(
            title: 'Qué entidad', 
            hintext: ' Ingresar entidad',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            validator: (val)=> ValidationInputs.inputEmpty(val), 
            onChanged: (val){},
          ),
        ),
    
          SizedBox(height: size.height*.04),
         //#3
         DropdownComponents(
           title: '¿Posee crédito agropecuario?',
           initialValue: 'CC', 
           hintext: ' Seleccionar dato', 
           items:const ['Si', 'No'], 
           validator: (value) => ValidationInputs.inputTypeSelect(value),
           onChanged: (val){     
             setState(()=> credit.text =val.toString());
           },
         ),
      if( credit.text.isNotEmpty && accountBank.text =='Si') SizedBox(height: size.height*.04),
      if( credit.text.isNotEmpty && accountBank.text =='Si')
          // #4
        Animate(
          effects: const[FadeEffect(), ScaleEffect()],
          child: InputsComponent(
            title: '¿En cuál entidad tiene crédito agropecuario?', 
            hintext: ' Ingresar entidad',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            validator: (val)=> ValidationInputs.inputEmpty(val), 
            onChanged: (val){},
          ),
        ),
    
        SizedBox(height: size.height*.04),
         //#5
         DropdownComponents(
           title: '¿Ha sido favorecido con crédito para Cacao?',
           initialValue: 'CC', 
           hintext: ' Seleccionar dato', 
           items:const ['Si', 'No'], 
           validator: (value) => ValidationInputs.inputTypeSelect(value),
           onChanged: (val){     
           },
         ),

          SizedBox(height: size.height*.04),
         //#6
         DropdownComponents(
           title: '¿Qué actividad financió con el crédito?',
           initialValue: 'CC', 
           hintext: ' Seleccionar dato', 
           items:const ['Infraestructura', 'Renovación','Siembra nueva', 'Sostenimiento'], 
           validator: (value) => ValidationInputs.inputTypeSelect(value),
           onChanged: (val){     
           },
         ),
    
         SizedBox(height: size.height*.06),
    
          /*boton para continuar*/
        ButtonComponents(
          title: 'Continuar',
         onPressed: (){
          //Todo: debe validar 
          /*navega hacia la pantalla #8*/
          Navigator.pushNamed(context, MainRoutes.eightSurveyRoute);
           
         },
      ),
      SizedBox(height: size.height*.06),
        ],
    ),
  ),
 );
 }
}