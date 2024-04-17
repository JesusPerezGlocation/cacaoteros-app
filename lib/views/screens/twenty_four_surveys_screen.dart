

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/routes/main_routes.dart';

/*
pantalla #24 REGISTRO FINAL PARTE 2
*/
class TwentyFourSurveysScreen extends StatelessWidget {

const TwentyFourSurveysScreen({super.key});
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
            const TitleSurveysComponents(title:'REGISTRO FINAL'), 
            SizedBox(height: size.height*.02),
              const LinealPercentComponent(
              percent: (24 - 1) * (100 / 23) / 100,
              questions: '30',
              answers: '24',
              ),
           SizedBox(height: size.height*.04),
             //#01
            InputsComponent(
              title: 'Nombre del encuestador', 
              hintext: ' Ingresar nombre',
              textInputAction: TextInputAction.next,
              validator: (val)=> ValidationInputs.inputEmpty(val), 
              onChanged: (val){},
            ),
 
           SizedBox(height: size.height*.04),
          //03 firma
         const SignatureComponents(),

        SizedBox(height: size.height*.06),
    
          /*boton para continuar*/
        ButtonComponents(
          title: 'Continuar',
         onPressed: (){
          //Todo: debe validar 
          /*navega a la pantalla #*/
          Navigator.pushNamed(context, MainRoutes.endSurveysScreenRoute);

         },
      ),
      SizedBox(height: size.height*.06),
    ],
   ),
 ),
 );
 }
}