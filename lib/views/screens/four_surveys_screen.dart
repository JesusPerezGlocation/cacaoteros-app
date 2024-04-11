

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
pantalla para mostrar la cuarta parte de los inputs
*/
class FourSurveysScreen extends StatefulWidget {

const FourSurveysScreen({super.key});

  @override
  State<FourSurveysScreen> createState() => _FourSurveysScreenState();
}

class _FourSurveysScreenState extends State<FourSurveysScreen> {

  //!!!cambiar y crear un provider
    String selectedDepartment = '';
  String selectedMunicipality = '';
  String selectedRural = '';
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
      const TitleSurveysComponents(title:'INFORMACIÓN BÁSICA DEL CACAOCULTOR > UBICACIÓN DEL PREDIO'), 
      
            SizedBox(height: size.height*.02),

     const LinealPercentComponent(
      percent: 0.04, 
      questions:'30',
      answers: '4',
      ),
      SizedBox(height: size.height*.04),
          //#1 tipo de persona
          DropdownComponents(
            title: 'Seleccionar departamento',
            initialValue: 'CC', 
            hintext: 'Seleccionar departamento', 
            items:PlacesListJson.departments, 
            validator: (value) => ValidationInputs.inputTypeSelect(value),
            onChanged: (val){  
                  setState(() {
                  selectedDepartment = val.toString();
                  selectedMunicipality = '';
                  selectedRural = '';
                });         
            },
          ),
          SizedBox(height: size.height*.03),
          //#2
          if (selectedDepartment.isNotEmpty)
          DropdownComponents(
            title: 'Seleccionar municipio',
            initialValue: 'CC', 
            hintext: 'Seleccionar municipio', 
            items:PlacesListJson.municipalitiesByDepartment[selectedDepartment]??[], 
            validator: (value) => ValidationInputs.inputTypeSelect(value),
            onChanged: (val){ 
            setState(() {
              selectedMunicipality =val.toString();
              selectedRural = '';
            });
            },
          ),

           SizedBox(height: size.height*.03),
          //#3
           if (selectedMunicipality.isNotEmpty)
          DropdownComponents(
            title: 'Seleccionar vereda',
            initialValue: 'CC', 
            hintext: 'Seleccionar vereda', 
            items:const ['1','2','3'], 
            validator: (value) => ValidationInputs.inputTypeSelect(value),
            onChanged: (val){  
              setState(() {
                selectedRural=val.toString();
              });         
            },
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