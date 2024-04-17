
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #1 ENCUESTA DE CARACTERIZACIÓN A CACAOCULTORES
*/
class FirstSurveysScreens extends StatelessWidget {
  final String dateTime;
  

const FirstSurveysScreens({
super.key, 
required this.dateTime
});
 @override
 Widget build(BuildContext context) {
 final size = MediaQuery.of(context).size;
 return Scaffold(
  appBar: AppBar(
    actions:const [
    SaveIconDraftComponents()
    ],
  ),
   body: FadeIn(
   child: ListView(
    physics: const BouncingScrollPhysics(),
     padding: EdgeInsets.symmetric(horizontal: size.width*.03, vertical: size.height*.03),
    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    children: [
     const TitleSurveysComponents(title:'ENCUESTA DE CARACTERIZACIÓN A CACAOCULTORES'),
      SizedBox(height: size.height*.02),
     const LinealPercentComponent(
      percent: (1 - 1) * (100 / 23) / 100, 
      questions: '30',
      answers: '1',
      ),
      SizedBox(height: size.height*.02),

    /*fecha de hoy*/
    Text(
        'Fecha $dateTime',  
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
       
       SizedBox(height: size.height*.03),
      //#2 NOMBRE DE LA UNIDAD TÉCNICA
      InputsComponent(
          title: 'Nombre de la unidad técnica', 
          hintext: ' Ingresar unidad',  
          textInputAction: TextInputAction.done, 
          validator: (val)=> ValidationInputs.inputDateEmpty(val), 
          onChanged: (val){},
      ),
    
    SizedBox(height: size.height*.06),

    ButtonComponents(
    title: 'Continuar', 
    onPressed: (){
      //Todo: debe validar los datos
      /*navega a la siguiente pantalla*/
      Navigator.pushNamed(
        context, MainRoutes.secondSurveysdRoute,
      );
    },
    ),

    SizedBox(height: size.height*.06),


    ],
   ),
 ),
 );
 }
}