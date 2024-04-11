
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';


class LogAndLatSurveysScreen extends StatelessWidget {

const LogAndLatSurveysScreen({super.key});
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

      SizedBox(height: size.height*.02),
     const LinealPercentComponent(
      percent: 0.04, 
      questions: '30',
      answers: '4',
      ),
      SizedBox(height: size.height*.04),
        /*componente para mostrar la longitud y la latitud */
      LatAndLongComponents(
        data: '404044439434890, 4398994398349490', 
        secondData: 'Grados · Minutos · Segundos', 
        onTap: (){},
      ),
       
       SizedBox(height: size.height*.03),
        //#1 número de hectareas
        InputsComponent(
        title: 'Número de hectáreas del predio', 
        hintext: ' Ingresar hectáreas',
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        validator: (val)=> ValidationInputs.inputEmpty(val), 
        onChanged: (val){},
      ),
     SizedBox(height: size.height*.03),

           //#2 certificación
          DropdownComponents(
            title: '¿Tiene alguna certificación?',
            initialValue: 'CC', 
            hintext: 'Seleccionar tipo de persona', 
            items:const ['Si', 'No'], 
            validator: (value) => ValidationInputs.inputTypeSelect(value),
            onChanged: (val){     
            },
          ),

           SizedBox(height: size.height*.03),
        //#3 número de hectareas
        InputsComponent(
        title: '¿Qué certificación posee?', 
        hintext: ' Ingresar certificación',
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.join,
        validator: (val)=> ValidationInputs.inputEmpty(val), 
        onChanged: (val){},
      ),

      SizedBox(height: size.height*.06),

      /*boton para continuar*/
      ButtonComponents(
        title: 'Continuar',
       onPressed: (){
        
       },
       )
      ],
    ),
  ),
 );
 }
}