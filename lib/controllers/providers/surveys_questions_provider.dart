
import 'package:flutter/material.dart';
/*
provider para manejar el estado los inputs, select, etc.
*/
class SurveysQuestionsProvider extends ChangeNotifier{

/*seleccion de municpio, departamento y vereda*/
final TextEditingController _department = TextEditingController();
final TextEditingController _municipality=TextEditingController();
final TextEditingController _place = TextEditingController(); //vereda

TextEditingController get  department=> _department ;
TextEditingController get  municipality=> _municipality ;
TextEditingController get  place=> _place ;

/*setea los controladores*/
setDepartement(String date){
_department.text = date;
notifyListeners(); 
}

setMunicipality(String date){
_municipality.text = date;
notifyListeners(); 
}

setPlace(String date){
  _place.text = date;
  notifyListeners();
}



/*limpia la selección de departamentos*/
cleanDepartaments(){
  _department.clear();
  _municipality.clear();
  _place.clear();
  notifyListeners();
  
}

/*limpia el municpio*/
cleanMunicipality(){
   _municipality.clear();
  _place.clear();
  notifyListeners();
}

/*limpia la vereda */
cleanPlace(){
    _place.clear();
  notifyListeners();
}

/*limpia todo el cuestionario */
cleanCuestionary(){

}





}



 