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
  static const fourSurveysRoute = '/four_surveys_route';
  static const newMemberRoute = '/new_member_route';
  static const fiveSurveysRoute = '/five_surveys_route';
  static const sevenSurveysRoute = '/seven_surveys_route';
  static const eightSurveyRoute = '/eight_surveys_route';
  static const nineSurveysRoute = '/nine_surveys_route';
  static const tenSurveysRoute = '/ten_surveys_route';
  static const elevenSurveysRoute = '/eleven_surveys_route';
  static const twelveSurveysRoute = '/twelve_surveys_route';
  static const threeSurveysRoute = '/six_surveys_route';
  static const allDraftsRoute = '/all_drafts_route';
  static const foursSurveysRoute = '/four_surveys_route';
  static const listMembersRoute = '/list_members_route';
  static const thirteenThreeSurveysRoute = '/twenty_three_surveys_route';
  static const endSurveysScreenRoute = '/end_surveys_screen_route';

  /*encuestas de visitas*/
  static const secondVisitsSurveysRoute = '/second_visits_surveys_route';
  static const thirdVisitsSurveysRoute = '/third_visits_surveys_route';
  static const fiveVisitsSurveysRoute = '/five_visits_surveys_route';
  static const sixVisitsSurveysRoute = '/six_visits_surveys_route';
  // static const firtVisitsSurveys = '/firt_visits_surveys_route';
  // static const fourVisitsSurveysRoute = '/four_visits_surveys_route';

  static Map<String, Widget Function(BuildContext)> routes = {
    /*-----RUTA INICIAL------*/
    initialRoute: (_) => const HomeSurveysScreen(),
    /*------ENCUENTAS BENEFICIARIOS DE POTENCIALES BENEFICIOS--------*/
    secondSurveysdRoute: (_) => const SecondSurveysScreen(),
    threeSurveysRoute: (_) => const ThreeSurveysScreen(),
    foursSurveysRoute: (_) => const FourSurveysScreen(),
    fiveSurveysRoute: (_) => const FiveSurveysScreen(),
    sevenSurveysRoute: (_) => const SevenSurveysScreen(),
    eightSurveyRoute: (_) => const EightSurveysScreen(),
    nineSurveysRoute: (_) => const NineSurveysScreen(),
    tenSurveysRoute: (_) => const TenSurveysScreen(),
    elevenSurveysRoute: (_) => const ElevenSurveysScreen(),
    twelveSurveysRoute: (_) => const TwelveSurveysScreen(),

    endSurveysScreenRoute: (_) => const EndSurveysScreen(),
    thirteenThreeSurveysRoute: (_) => const ThirteenurveysScreen(),
    allDraftsRoute: (_) => const AllDraftsScreen(),
    listMembersRoute: (_) => const ListMembersScreen(),

    newMemberRoute: (_) => const NewMemberSurveysScreen(),

    //firtSurveysRoute:(_) => const FirstSurveysScreens(),
    // fiveSurveysRoute: (_) => const FiveSurveysScreen(),

    /*----------ENCUESTAS DE VISITAS------------*/
    // firtVisitsSurveys: (_) => const FirtSurveysVisitsScreen(),
    secondVisitsSurveysRoute: (_) => const SecondSurveysVisitsScreen(),
    thirdVisitsSurveysRoute: (_) => const ThirdSurveysVisitsScreen(),
    fiveVisitsSurveysRoute: (_) => const FiveSurveysVisitsScreen(),
    sixVisitsSurveysRoute: (_) => const SixSurveysVisitsScreen(),
    // fourVisitsSurveysRoute: (_) => const FourSurveysVisitsScreen(),
  };
}
