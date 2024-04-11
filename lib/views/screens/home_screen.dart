import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla para mostrar la primera encuesta
*/
class HomeSurveysScreen extends StatefulWidget {

const HomeSurveysScreen({super.key});

  @override
  State<HomeSurveysScreen> createState() => _HomeSurveysScreenState();
}

class _HomeSurveysScreenState extends State<HomeSurveysScreen> {
  /*calcula la fecha de hoy */
  DateTime dateTime = DateTime.now();

 @override
 Widget build(BuildContext context) {
 final size = MediaQuery.of(context).size;
 return   Scaffold(
  appBar: AppBar(
     title: const HomeAppBarComponents(),
  ),
  body: Padding(
    padding: EdgeInsets.symmetric(horizontal: size.width*.03, vertical: size.height*.03),
    child: Column(
      children: [
        /*componente para llenar las encuestas*/
       StartSurveysComponents(
        title: 'Iniciar encuesta', 
        answers: '10/50 respuestas conectar', 
        dateTime: DateFormat('dd/MM/yyyy').format(dateTime),
        percent: 0.5, 
        onTap: (){
          /*navega a la primera pantalla de preguntas */
          Navigator.push(context, MaterialPageRoute(builder:(context) =>  FirstSurveysScreens(dateTime:DateFormat('dd/MM/yyyy').format(dateTime) ,)));
        },
        ),
        SizedBox(height: size.height*.03),
    
        /*ver todos los borradores*/
        ViewAllDraftComponents(
          title: 'Borradores', 
          action: 'Ver todos',
           onTap: (){
            /*navega a ver todos los borradores */
            Navigator.pushNamed(context, MainRoutes.allDraftsRoute);
        }
      ),

        /*lista de borradores*/
         const Expanded(
          child: ListViewHomeDraftWidget(),
         ),
      ],
    ),
  ),
 );
 }
}