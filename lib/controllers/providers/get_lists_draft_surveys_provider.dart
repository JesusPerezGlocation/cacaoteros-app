import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
provider para obtener las listas de borradores
*/
class GetListDraftSurveysProvider extends ChangeNotifier {
  //*lista de encuestas guardas, ej se muestra en el home */
  List<DraftSurveysListModel> _listsSurveysDraft = [];
  List<DraftSurveysListModel> get listsSurveysDraft => _listsSurveysDraft;

  Future<List<DraftSurveysListModel>> getSetListSurveys() async {
    _listsSurveysDraft =
        await ListDraftAllSurveysSQL.instance.getAllSurveysGet();
    notifyListeners();
    return _listsSurveysDraft;
  }

  //*registro de visitas*/
  List<VisitsSurveysModels> _visitsSurveysList = [];
  List<VisitsSurveysModels> get visitsSurveysList => _visitsSurveysList;

  Future<List<VisitsSurveysModels>> getListVisitsRegister() async {
    _visitsSurveysList =
        await VisitsRegisterSQLServices.instance.readVisitsRegister();

    notifyListeners();
    return _visitsSurveysList;
  }
}
