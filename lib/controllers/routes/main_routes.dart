import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';
/*
manejo de rutas, de forma optmizada, en caso de usar solo se debe llamar la clase y a la ruta que se quiere navegar
*/

class MainRoutes {
  static const initialRoute = '/home_route';
  static const firtSurveysRoute = '/firt_surveys_route';
  static const secondSurveysdRoute = '/second_surveys_route';
  static const thirdSurveysRoute = '/third_surveys_route';
  static const fourSurveysRoute ='/four_surveys_route';
  static const allDraftsRoute ='/all_drafts_route';
  static const logAndLatRoute ='/log_and_lat_route';

  static Map<String, Widget Function(BuildContext)> routes = {
    /*-----RUTA INICIAL------*/
    initialRoute: (_) => const HomeSurveysScreen(),
    /*------ENCUENTAS--------*/
    //firtSurveysRoute:(_) => const FirstSurveysScreens(),
    secondSurveysdRoute:(_)=> const SecondSurveysScreen(),
    thirdSurveysRoute:(_)=> const ThirdSurveysScreen(),
    fourSurveysRoute:(_)=> const FourSurveysScreen(),
    allDraftsRoute:(_)=> const AllDraftsScreen(),
    logAndLatRoute:(_)=>  const LogAndLatSurveysScreen(),

 
  };
}