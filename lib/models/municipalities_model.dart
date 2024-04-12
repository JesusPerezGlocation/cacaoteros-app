import 'dart:convert';

class MunicipalitiesModels {
    String codDepa;
    String departamento;
    String municipio;
    String vereda;
    String codMuni;
    String codMVer;
  MunicipalitiesModels({
   required this.codDepa,
   required this.departamento,
   required this.municipio,
   required this.vereda,
   required this.codMVer,
   required this.codMuni,
  });


  
 static List<MunicipalitiesModels> fromJsonList(dynamic jsonString) {
  List<dynamic> jsonList = json.decode(jsonString);
  List<MunicipalitiesModels> municipalities = [];
  for (final json in jsonList) {
    // Convierte los valores numéricos a cadenas
      json['COD_DEPA'] = json['COD_DEPA'].toString();
      json['COD_MUNI'] = json['COD_MUNI'].toString();
      json['CODIGO_VER'] = json['CODIGO_VER'].toString();;

    municipalities.add(MunicipalitiesModels.fromJson(json));
  }
  return municipalities;
}


  factory MunicipalitiesModels.fromJson(Map<String, dynamic> json) {
    return MunicipalitiesModels(
        codDepa: json["COD_DEPA"].toString(),
        departamento: json["DEPARTAMENTO"].toString(),
        municipio: json["MUNICIPIO"].toString(),
        vereda: json["VEREDA"].toString(),
        codMVer: json["CODIGO_VER"].toString(),
        codMuni: json["COD_MUNI"].toString(),
    );
  }

  

 
}