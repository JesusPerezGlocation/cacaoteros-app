import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';
import 'package:surveys_app/views/screens/end_surveys_screen.dart';
 

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
  static const sixSurveysRoute ='/six_surveys_route';
  static const sevenSurveysRoute ='/seven_surveys_route';
  static const eightSurveyRoute= '/eight_surveys_route';
  static const nineSurveysRoute ='/nine_surveys_route';
  static const tenSurveysRoute ='/ten_surveys_route';
  static const elevenSurveysRoute ='/eleven_surveys_route';
  static const listMembersRoute ='/list_members_route';
  static const twelveSurveysRoute ='/twelve_surveys_route';
  static const thirteenSurveysRoute ='/thirteen_surveys_route';
  static const fourteenSurveysRoute='/fourteen_surveys_route';
  static const fifteenSurveysRoute ='/fifteen_surveys_route';
  static const sixteenSurveysRoute = '/sixteen_surveys_route';
  static const seveenteenSurveysRoute ='/seveenteen_surveys_route';
  static const eighteenSurveysRoute ='/eighteen_surveys_route';
  static const nineteenSurveysRoute ='/nineteen_surveys_route';
  static const twentySurveysRoute= '/twenty_surveys_route';
  static const twentyOneSurveysRoute ='/twenty_one_surveys_route';
  static const twentyTwoSurveysRoute ='/twenty_two_surveys_route';
  static const twentyThreeSurveysRoute = '/twenty_three_surveys_route';
  static const twentyFourSurveysRoute ='/twenty_four_surveys_route';
  static const endSurveysScreenRoute ='/end_surveys_screen_route';
  // static const fiveSurveysRoute ='/log_and_lat_route';
  

  static Map<String, Widget Function(BuildContext)> routes = {
    /*-----RUTA INICIAL------*/
    initialRoute: (_) => const HomeSurveysScreen(),
    /*------ENCUENTAS--------*/
    secondSurveysdRoute:(_)=> const SecondSurveysScreen(),
    thirdSurveysRoute:(_)=> const ThirdSurveysScreen(),
    fourSurveysRoute:(_)=> const FourSurveysScreen(),
    allDraftsRoute:(_)=> const AllDraftsScreen(),
    sixSurveysRoute:(_)=> const SixSurveysScreen(),
    sevenSurveysRoute:(_)=> const SevenSurveysScreen(),
    eightSurveyRoute:(_)=> const EightSurveysScreen(),
    nineSurveysRoute:(_)=> const NineSurveysScreen(),
    tenSurveysRoute:(_)=> const TenSurveysScreen(),
    elevenSurveysRoute:(_)=> const ElevenSurveysScreen(),
    listMembersRoute:(_)=> const ListMembersScreen(),
    twelveSurveysRoute:(_)=> const TwelveSurveysScreen(),
    thirteenSurveysRoute:(_)=> const ThirteenSurveysScreen(),
    fourteenSurveysRoute:(_)=> const FourteenSurveysScreen(),
    fifteenSurveysRoute:(_)=> const FifteenSurveysScreen(),
    sixteenSurveysRoute:(_)=> const SixteenSurveysScreen(),
    seveenteenSurveysRoute:(_)=> const SeventeenSurveysScreen(),
    eighteenSurveysRoute:(_)=> const EighteenSurveysScreen(),
    nineteenSurveysRoute:(_)=> const NineteenSurveysScreen(),
    twentySurveysRoute:(_)=> const TwentySurveysScreen(),
    twentyOneSurveysRoute:(_)=> const TwentyOneSurveysScreen(),
    twentyTwoSurveysRoute:(_)=> const TwentyTwoSurveysScreen(),
    twentyThreeSurveysRoute:(_)=> const TwentyThreeSurveysScreen(),
    twentyFourSurveysRoute:(_)=> const TwentyFourSurveysScreen(),
    endSurveysScreenRoute:(_)=> const EndSurveysScreen(),
    //firtSurveysRoute:(_) => const FirstSurveysScreens(),
   // fiveSurveysRoute:(_)=>  const FiveSurveysScreen(),

 
  };
}