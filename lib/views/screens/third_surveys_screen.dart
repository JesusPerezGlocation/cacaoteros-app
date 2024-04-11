


import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/routes/main_routes.dart';
/*
pantalla para la tercera parte de las encuentas 
*/

class ThirdSurveysScreen extends StatefulWidget {

const ThirdSurveysScreen({super.key});

  @override
  State<ThirdSurveysScreen> createState() => _ThirdSurveysScreenState();
}

class _ThirdSurveysScreenState extends State<ThirdSurveysScreen> {
  //!! borrar, solo es una preuba, pasar a un gestor de estado
  TextEditingController economic = TextEditingController();
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
                 const TitleSurveysComponents(title:'INFORMACIÓN BÁSICA DEL CACAOCULTOR > INFORMACIÓN DE LA TIERRA'), 
      SizedBox(height: size.height*.02),

     const LinealPercentComponent(
      percent: 0.03, 
      questions: '30',
      answers: '3',
      ),
      SizedBox(height: size.height*.04),
      //#1 
       DropdownComponents(
       title: ' Seleccionar tipo de tenencia de la tierra',
      initialValue: '-', 
      hintext: ' Seleccionar tipo de tenencia', 
      items:const ['Carta venta', 'Escritura','Resguardo indígena','Consejo comunitario','Sana posesión'],
      validator: (value) => ValidationInputs.inputTypeSelect(value), 
      onChanged: (val){  
       },
     ),
     SizedBox(height: size.height*.03),
     //#2
     DropdownComponents(
       title: ' Seleccionar origen de la tenencia de la tierra',
      initialValue: '-', 
      hintext: ' Seleccionar tipo de tenencia', 
      items:const ['Compra','Herencia', 'Subsidio estatal'],
      validator: (value) => ValidationInputs.inputTypeSelect(value), 
      onChanged: (val){  
       },
     ),
        SizedBox(height: size.height*.03),
     //#3
     DropdownComponents(
       title: ' Seleccionar posesión sobre el cultivo',
      initialValue: '-', 
      hintext: ' Seleccionar tipo de posesión', 
      items:const ['Arrendatario','Sociedad','Propietario'],
      validator: (value) => ValidationInputs.inputTypeSelect(value), 
      onChanged: (val){  
       },
     ),
      
       SizedBox(height: size.height*.03),
     //#4
     DropdownComponents(
       title: ' ¿Está afiliado a alguna organización de productores?',
      initialValue: '-', 
      hintext: ' Seleccionar dato', 
      items:const ['Si', 'No'],
      validator: (value) => ValidationInputs.inputTypeSelect(value), 
      onChanged: (val){  
       },
     ),
    
     SizedBox(height: size.height*.03),
     //#5
      InputsComponent(
        title: 'Nombre de alguna organización a la que pertenece', 
        hintext: ' Ingresar organización',
        textInputAction: TextInputAction.next,
        keyboardType:TextInputType.text,
        validator: (val)=> ValidationInputs.inputEmpty(val), 
        onChanged: (val){},
      ),

       SizedBox(height: size.height*.03),
     //#6
     DropdownComponents(
       title: ' Principal actividad económica',
      initialValue: '-', 
      hintext: ' Seleccionar actividad', 
      items:const ['Agricultor', 'Ganadero','Comerciante', 'Otro'],
      validator: (value) => ValidationInputs.inputTypeSelect(value), 
      onChanged: (val){ 
         setState(()=>  economic.text = val.toString()); 
       },
     ),
     
        economic.text.isNotEmpty && economic.text=='Otro'?   SizedBox(height: size.height*.03): const SizedBox(),
    //#6 economica
     economic.text.isNotEmpty && economic.text=='Otro'?  InputsComponent(
        title: '¿Otro, Cuál?', 
        hintext: ' Ingresar actividad económica',
        textInputAction: TextInputAction.next,
        keyboardType:TextInputType.text,
        validator: (val)=> ValidationInputs.inputEmpty(val), 
        onChanged: (val){
        
        },
      ): const SizedBox(), 
      SizedBox(height: size.height*.03),
      //#7
      InputsComponent(
        title: 'Números de días al mes que labora en el cultivo de cacao', 
        hintext: ' Ingresar número',
        textInputAction: TextInputAction.next,
        keyboardType:TextInputType.number,
        validator: (val)=> ValidationInputs.inputEmpty(val), 
        onChanged: (val){},
      ),

         SizedBox(height: size.height*.03),
      //#8
      InputsComponent(
        title: 'Números de días al mes que labora fuera de la finca', 
        hintext: ' Ingresar número',
        textInputAction: TextInputAction.next,
        keyboardType:TextInputType.number,
        validator: (val)=> ValidationInputs.inputEmpty(val), 
        onChanged: (val){},
      ),

     SizedBox(height: size.height*.06),
   /*boton para continuar */
    ButtonComponents(
    title: 'Continuar', 
    onPressed: (){
      //Todo: debe validar los datos
      //Todo: debe pedir los permisos de ubicación y en caso de que no los tenga enviarlos a los ajustes para activarlos
      Navigator.pushNamed(context, MainRoutes.fourSurveysRoute,);
    },
    ),
    SizedBox(height: size.height*.06),
    ],
    ),
  ),
 );
 }
}