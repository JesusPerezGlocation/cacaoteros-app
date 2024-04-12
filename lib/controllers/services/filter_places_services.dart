
/*
filtro para los departamentos, municipios y veredas
*/
import 'dart:convert';

import 'package:surveys_app/controllers/exports/models_exports.dart';

class FilterPlacesServices {



/*filtro para los departamentos*/
static List<String> departments = [
  'ANTIOQUIA','ATLÁNTICO', 'BOGOTÁ, D,C','BOLÍVAR','BOYACÁ',
  'CALDAS','CAQUETÁ','CAUCA','CESAR','CÓRDOBA',
  'CUNDINAMARCA','CHOCÓ','HUILA',
  'LA GUAJIRA','MAGDALENA','META',
  'NARIÑO','NORTE DE SANTANDER',
  'QUINDIO','RISARALDA',
  'SANTANDER','SUCRE','TOLIMA','VALLE DEL CAUCA',
  'ARAUCA','CASANARE','PUTUMAYO','ARCHIPIÉLAGO DE SAN ANDRÉS',
  'AMAZONAS','GUAINÍA','GUAVIARE','VAUPÉS','VICHADA',
  ];


/*filtro para obtener los municipios*/
List<MunicipalitiesModels> municipios = MunicipalitiesModels.fromJsonList(JsonDataMunicipalities.jsonData); 

/*filtro par obtener los municipios */
static List<MunicipalitiesModels> getMunicipalitiesByDepartment(String department, {int page = 1, int pageSize = 10}) {
  try{
    List<MunicipalitiesModels> municipalities = [];

  List<dynamic> jsonList = json.decode(JsonDataMunicipalities.jsonData);

  /*utiliza un conjunto para mantener un registro de los municipios únicos */
  Set<String> uniqueMunicipalities = {};

  // Calcula el índice de inicio y el índice final para la paginación
  int startIndex = (page - 1) * pageSize;
  int endIndex = startIndex + pageSize;

  for (final data in jsonList) {
    /*verifica si el municipio pertenece al departamento especificado */
    if (data['DEPARTAMENTO'] == department) {
      /*0btiene el nombre del municipio */
      String municipalityName = data['MUNICIPIO'];
      /*verifica si el municipio ya ha sido agregado al conjunto*/
      if (!uniqueMunicipalities.contains(municipalityName)) {
        /* agrega el municipio al conjunto y a la lista de municipos */
        uniqueMunicipalities.add(municipalityName);
        municipalities.add(MunicipalitiesModels.fromJson(data));
      }
    }
  }

  /* aplica la paginación */

if (endIndex > municipalities.length) {
  endIndex = municipalities.length;
}
municipalities = municipalities.sublist(startIndex, endIndex);
  return municipalities;

  }catch(e){}
 return [];
}
}