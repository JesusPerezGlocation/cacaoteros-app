import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla para información básica del cacaocultor
*/
class SecondSurveysScreen extends StatefulWidget {

const SecondSurveysScreen({super.key});

  @override
  State<SecondSurveysScreen> createState() => _SecondSurveysScreenState();
}

class _SecondSurveysScreenState extends State<SecondSurveysScreen> {

  //!! borrar, solo es una preuba, pasar a un gestor de estado
  TextEditingController nacionality =TextEditingController();
 
 @override
 Widget build(BuildContext context) {
 final size = MediaQuery.of(context).size;
 return Scaffold(
  appBar: AppBar(    
    actions:const [
    SaveIconDraftComponents()
    ],),
  body: FadeIn(
    child: ListView(
          physics: const BouncingScrollPhysics(),
       padding: EdgeInsets.symmetric(horizontal: size.width*.03, vertical: size.height*.03),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
         const TitleSurveysComponents(title:'INFORMACIÓN BÁSICA DEL CACAOCULTOR > IDENTIFICACIÓN'), 
      SizedBox(height: size.height*.02),
     const LinealPercentComponent(
      percent: 0.02, 
      questions: '30',
      answers: '2',
      ),
      SizedBox(height: size.height*.04),
    
        //#1 tipo de persona
           DropdownComponents(
            title: 'Tipo de persona',
            initialValue: 'NATURAL', 
            hintext: 'Seleccionar tipo de persona', 
            items:const ['Natural', 'Jurídica'], 
            validator: (value) => ValidationInputs.inputTypeSelect(value),
            onChanged: (val){     
            },
            ),
    
         SizedBox(height: size.height*.03),
     
        //#2 tipo de documento
          DropdownComponents(
            title: 'Tipo de documento',
            initialValue: 'CC', 
            hintext: 'Seleccionar tipo de persona', 
            items:const ['Cédula de ciudadanía', 'Tarjeta de identidad','Cédula de extranjería'], 
            validator: (value) => ValidationInputs.inputTypeSelect(value),
            onChanged: (val){   
               
            },
          ),
      SizedBox(height: size.height*.03),
    
      // #3 número de documento
      InputsComponent(
        title: 'Número de documento', 
        hintext: ' Ingresar número de documento',
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        validator: (val)=> ValidationInputs.inputEmpty(val), 
        onChanged: (val){},
      ),
      
    SizedBox(height: size.height*.03),
    
      // #4 nombre y apellidos
      InputsComponent(
        title: 'Nombres y apellidos', 
        hintext: ' Ingresar nombres y apellidos',
        textInputAction: TextInputAction.next,
        validator: (val)=>ValidationInputs.inputEmpty(val), 
        onChanged: (val){},
      ),
    SizedBox(height: size.height*.03),
    // #4 número de celular
       InputsComponent(
        title: 'Número de celular', 
        hintext: ' Ingresar número de celular',
        textInputAction: TextInputAction.next,
        keyboardType:TextInputType.number,
        validator: (val)=> ValidationInputs.inputEmpty(val), 
        onChanged: (val){},
      ),
    SizedBox(height: size.height*.03),
    // #4 número de teléfono fijo
      InputsComponent(
        title: 'Teléfono fijo', 
        hintext: ' Ingresar teléfono fijo',
        textInputAction: TextInputAction.next,
        keyboardType:TextInputType.number,
        validator: (val)=> ValidationInputs.inputEmpty(val), 
        onChanged: (val){},
      ),
       SizedBox(height: size.height*.03),
    // #5 correo electronico
      InputsComponent(
        title: 'Correo electrónico', 
        hintext: ' Ingresar correo electrónico',
        textInputAction: TextInputAction.next,
        keyboardType:TextInputType.emailAddress,
        validator: (val)=> ValidationInputs.inputEmpty(val), 
        onChanged: (val){},
      ),
         SizedBox(height: size.height*.03),
        //#6 genero
          DropdownComponents(
            title: ' Seleccionar género',
            initialValue: '-', 
            hintext: 'Seleccionar género', 
            items:const ['Masculino', 'Femenino'], 
            validator: (value) => ValidationInputs.inputTypeSelect(value),
            onChanged: (val){   
                
            },
          ),
        
         SizedBox(height: size.height*.03),
      // #7 fecha de nacimiento
      Row(
        children: [
        //01
        Flexible(
          flex: 1,
          child: InputsComponent(
          title: 'Mes de nacimiento', 
          hintext: ' 03',  
          keyboardType: TextInputType.number, 
          textInputAction: TextInputAction.next,
          validator: (val)=> ValidationInputs.inputDateEmpty(val),
          onChanged: (val){},
          ),
        ),
        SizedBox(width: size.width*.02),
        //02
        Flexible(
          flex: 1,
          child: InputsComponent(
          title: 'Día de nacimient', 
          hintext: ' 07', 
          keyboardType: TextInputType.number, 
          textInputAction: TextInputAction.next,
          validator: (val)=> ValidationInputs.inputDateEmpty(val), 
          onChanged: (val){},
          ),
        ),
        SizedBox(width: size.width*.02),
        //03
        Flexible(
          flex: 1,
          child: InputsComponent(
          title: 'Año de nacimient', 
          hintext: ' 1999', 
          keyboardType: TextInputType.number, 
          textInputAction: TextInputAction.next, 
          validator: (val)=> ValidationInputs.inputDateEmpty(val), 
          onChanged: (val){},
          ),
        ),
        ],
      ),
      SizedBox(height: size.height*.03),
     //#8 estado civil
       DropdownComponents(
            title: ' Seleccionar estado civil',
            initialValue: '-', 
            hintext: ' Seleccionar estado civil', 
            items:const ['Casado', 'Unión libre','Soltero'], 
            validator: (value) => ValidationInputs.inputTypeSelect(value),
            onChanged: (val){   
               
            },
          ),
         SizedBox(height: size.height*.03),
     //#9 nacionalidad
       DropdownComponents(
            title: ' Seleccionar nacionalidad',
            initialValue: '-', 
            hintext: ' Seleccionar nacionalidad', 
            items:const ['Colombiano', 'Otro'],
            validator: (value) => ValidationInputs.inputTypeSelect(value), 
            onChanged: (val){   
                  setState(()=>  nacionality.text = val.toString());
  
 
            },
          ),  

   nacionality.text.isNotEmpty && nacionality.text!='Colombiano'?   SizedBox(height: size.height*.03): const SizedBox(),
    // #10 nacionalidad
    nacionality.text.isNotEmpty && nacionality.text!='Colombiano'?  InputsComponent(
        title: '¿Otro, Cuál?', 
        hintext: ' Ingresar nacionalidad',
        textInputAction: TextInputAction.next,
        keyboardType:TextInputType.text,
        validator: (val)=> ValidationInputs.inputEmpty(val), 
        onChanged: (val){
        
        },
      ): const SizedBox(), 
    SizedBox(height: size.height*.03),
    // #11 nivel academico
      InputsComponent(
        title: 'Nivel de escolaridad', 
        hintext: ' Ingresar nivel de escolaridad',
        textInputAction: TextInputAction.next,
        keyboardType:TextInputType.text,
        validator: (val)=> ValidationInputs.inputEmpty(val), 
        onChanged: (val){},
      ),  

      SizedBox(height: size.height*.03),
    // #12 años cursados
      InputsComponent(
        title: 'Número de años cursados', 
        hintext: ' Ingresar número de años cursados',
        textInputAction: TextInputAction.next,
        keyboardType:TextInputType.number,
        validator: (val)=> ValidationInputs.inputEmpty(val), 
        onChanged: (val){},
      ), 
      SizedBox(height: size.height*.03),
    // #13 titulo obtenido
      InputsComponent(
        title: 'Título obtenido', 
        hintext: ' Ingresar título obtenido',
        textInputAction: TextInputAction.next,
        keyboardType:TextInputType.text,
        validator: (val)=> ValidationInputs.inputEmpty(val), 
        onChanged: (val){},
      ),
    
          SizedBox(height: size.height*.06),

    ButtonComponents(
    title: 'Continuar', 
    onPressed: (){
      //Todo: debe validar los datos
      /*navega a la siguiente pantalla*/
      Navigator.pushNamed(context, MainRoutes.thirdSurveysRoute,);
      
    },
    ),
    SizedBox(height: size.height*.06),

      ],
    ),
  ),
 );
 }
}