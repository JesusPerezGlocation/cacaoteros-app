/*
filtro para los departamentos, municipios y veredas
*/
import 'dart:convert';
import 'dart:developer';

import 'package:surveys_app/controllers/exports/models_exports.dart';

class FilterPlacesServices {
/*filtro para los departamentos*/
  static List<String> departments = [
    'ANTIOQUIA',
    'ATLÁNTICO',
    'BOGOTÁ, D,C',
    'BOLÍVAR',
    'BOYACÁ',
    'CALDAS',
    'CAQUETÁ',
    'CAUCA',
    'CESAR',
    'CÓRDOBA',
    'CUNDINAMARCA',
    'CHOCÓ',
    'HUILA',
    'LA GUAJIRA',
    'MAGDALENA',
    'META',
    'NARIÑO',
    'NORTE DE SANTANDER',
    'QUINDIO',
    'RISARALDA',
    'SANTANDER',
    'SUCRE',
    'TOLIMA',
    'VALLE DEL CAUCA',
    'ARAUCA',
    'CASANARE',
    'PUTUMAYO',
    'ARCHIPIÉLAGO DE SAN ANDRÉS',
    'AMAZONAS',
    'GUAINÍA',
    'GUAVIARE',
    'VAUPÉS',
    'VICHADA',
  ];

  /*codigos de departamentos*/
  static List<String> codeDepartaments = [
    '05',
    '08',
    '11',
    '13',
    '15',
    '17',
    '18',
    '19',
    '20',
    '23',
    '25',
    '27',
    '41',
    '44',
    '47',
    '50',
    '52',
    '54',
    '63',
    '66',
    '68',
    '70',
    '73',
    '76',
    '81',
    '85',
    '86',
    '88',
    '91',
    '94',
    '95',
    '97',
    '99',
  ];

/*filtro para obtener los municipios*/
  List<MunicipalitiesModels> municipios =
      MunicipalitiesModels.fromJsonList(JsonDataMunicipalities.jsonData);

/*filtro par obtener los municipios */
  static List<MunicipalitiesModels> getMunicipalitiesByDepartment(
      String department,
      {int page = 1,
      int pageSize = 10}) {
    try {
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
    } catch (e) {
      log('error:: $e');
    }
    return [];
  }

/*filtro para generar las veredas*/
  static List<MunicipalitiesModels> getVeredasByMunicipio(String municipality,
      {int page = 1, int pageSize = 10}) {
    List<MunicipalitiesModels> veredas = [];

    List<dynamic> jsonList = json.decode(JsonDataMunicipalities.jsonData);

    int startIndex = (page - 1) * pageSize;
    int endIndex = startIndex + pageSize;

    Set<String> uniqueVeredas = {};

    for (final data in jsonList) {
      if (data['MUNICIPIO'] == municipality) {
        String vereda = data['VEREDA'];

        if (!uniqueVeredas.contains(vereda)) {
          veredas.add(MunicipalitiesModels.fromJson(data));
          uniqueVeredas.add(vereda);
        }
      }
    }

    /*paginación */
    if (startIndex < veredas.length) {
      if (endIndex > veredas.length) {
        endIndex = veredas.length;
      }
      veredas = veredas.sublist(startIndex, endIndex);
    } else {
      veredas = [];
    }

    return veredas;
  }

//List<MunicipalitiesModels> municipalitiesList = MunicipalitiesModels.fromJsonList(JsonDataMunicipalities.jsonData);
}
