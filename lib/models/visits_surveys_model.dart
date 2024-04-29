/*
modelo para la encuesta de registro de visitas
*/
class VisitsSurveysModels {
  final String metainstanceID;
  final String surveyId;
  final double percent;
  final String submitterName;
  final String submitterID;
  final String categorieSurveys;
  final String start;
  final String ubicacionBeneficiarioBeneficiario;
  final String ubicacionBeneficiarioCedula;
  final String ubicacionTecnicoFecha;
  final String ubicacionUbicacionFincaDepartamento;
  final String ubicacionUbicacionFincaCodigoDepartamento;
  final String ubicacionUbicacionFincaMunicipio;
  final String ubicacionUbicacionFincaCodigoMunicipio;
  final String ubicacionUbicacionFincaVereda;
  final String ubicacionUbicacionFincaCodigoVereda;
  final String ubicacionInformacionFincaNombreFinca;
  final String ubicacionInformacionFincaAreaFinca;
  final String ubicacionInformacionFincaAreaCacao;
  final String coordenadasPoligono;
  final String startGeopointLatitude;
  final String startGeopointLongitude;
  final String startGeopointAccuracy;
  final String startGeopointAltitude;
  final String situacionActualVisitaObjetivoVisita;
  final String situacionActualVisitaDescripcionProyecto;
  final String situacionActualVisitaRecomendaciones;
  final String situacionActualVisitaCompromisos;
  final String firmasFirmaAgricultor;
  final String firmasFirmaTecnico;
  final String registroFotograficoFotoRegistro;
  final String datosPersonalesLugar;
  final String datosPersonalesDireccion;
  final String datosPersonalesTelefono;
  final String datosPersonalesFirma;
  final String end;
  final String ubicacionInformacionFincaVisita;
  final String datosPersonalesFechaNota;
  final String datosPersonalesNota;
  final String datosPersonalesNota3;
  final String datosPersonalesNota4;
  final String ubicacionTecnicoNotaInicial;
  final String ubicacionTecnicoFechaNota;

  VisitsSurveysModels({
    required this.surveyId,
    required this.percent,
    required this.categorieSurveys,
    required this.submitterName,
    required this.submitterID,
    required this.start,
    required this.ubicacionBeneficiarioBeneficiario,
    required this.ubicacionBeneficiarioCedula,
    required this.ubicacionTecnicoFecha,
    required this.metainstanceID,
    required this.ubicacionUbicacionFincaDepartamento,
    required this.ubicacionUbicacionFincaCodigoDepartamento,
    required this.ubicacionUbicacionFincaMunicipio,
    required this.ubicacionUbicacionFincaCodigoMunicipio,
    required this.ubicacionUbicacionFincaVereda,
    required this.ubicacionUbicacionFincaCodigoVereda,
    required this.ubicacionInformacionFincaNombreFinca,
    required this.ubicacionInformacionFincaAreaFinca,
    required this.ubicacionInformacionFincaAreaCacao,
    required this.coordenadasPoligono,
    required this.startGeopointLatitude,
    required this.startGeopointLongitude,
    required this.startGeopointAccuracy,
    required this.startGeopointAltitude,
    required this.situacionActualVisitaObjetivoVisita,
    required this.situacionActualVisitaDescripcionProyecto,
    required this.situacionActualVisitaRecomendaciones,
    required this.situacionActualVisitaCompromisos,
    required this.firmasFirmaAgricultor,
    required this.firmasFirmaTecnico,
    required this.registroFotograficoFotoRegistro,
    required this.datosPersonalesLugar,
    required this.datosPersonalesDireccion,
    required this.datosPersonalesTelefono,
    required this.datosPersonalesFirma,
    required this.end,
    required this.ubicacionInformacionFincaVisita,
    required this.datosPersonalesFechaNota,
    required this.datosPersonalesNota,
    required this.datosPersonalesNota3,
    required this.datosPersonalesNota4,
    required this.ubicacionTecnicoNotaInicial,
    required this.ubicacionTecnicoFechaNota,
  });

  // Método para crear una nueva instancia de VisitsSurveysModels con campos actualizados
  VisitsSurveysModels copyWith({
    String? metainstanceID,
    String? surveyId,
    double? percent,
    String? submitterName,
    String? submitterID,
    String? categorieSurveys,
    String? start,
    String? ubicacionBeneficiarioBeneficiario,
    String? ubicacionBeneficiarioCedula,
    String? ubicacionTecnicoFecha,
    String? ubicacionUbicacionFincaDepartamento,
    String? ubicacionUbicacionFincaCodigoDepartamento,
    String? ubicacionUbicacionFincaMunicipio,
    String? ubicacionUbicacionFincaCodigoMunicipio,
    String? ubicacionUbicacionFincaVereda,
    String? ubicacionUbicacionFincaCodigoVereda,
    String? ubicacionInformacionFincaNombreFinca,
    String? ubicacionInformacionFincaAreaFinca,
    String? ubicacionInformacionFincaAreaCacao,
    String? coordenadasPoligono,
    String? startGeopointLatitude,
    String? startGeopointLongitude,
    String? startGeopointAccuracy,
    String? startGeopointAltitude,
    String? situacionActualVisitaObjetivoVisita,
    String? situacionActualVisitaDescripcionProyecto,
    String? situacionActualVisitaRecomendaciones,
    String? situacionActualVisitaCompromisos,
    String? firmasFirmaAgricultor,
    String? firmasFirmaTecnico,
    String? registroFotograficoFotoRegistro,
    String? datosPersonalesLugar,
    String? datosPersonalesDireccion,
    String? datosPersonalesTelefono,
    String? datosPersonalesFirma,
    String? end,
    String? ubicacionInformacionFincaVisita,
    String? datosPersonalesFechaNota,
    String? datosPersonalesNota,
    String? datosPersonalesNota3,
    String? datosPersonalesNota4,
    String? ubicacionTecnicoNotaInicial,
    String? ubicacionTecnicoFechaNota,
  }) {
    return VisitsSurveysModels(
      surveyId: surveyId ?? this.surveyId,
      percent: percent ?? this.percent,
      submitterName: submitterName ?? this.submitterName,
      submitterID: submitterID ?? this.submitterID,
      categorieSurveys: categorieSurveys ?? this.categorieSurveys,
      start: start ?? this.start,
      ubicacionBeneficiarioBeneficiario: ubicacionBeneficiarioBeneficiario ??
          this.ubicacionBeneficiarioBeneficiario,
      ubicacionBeneficiarioCedula:
          ubicacionBeneficiarioCedula ?? this.ubicacionBeneficiarioCedula,
      ubicacionTecnicoFecha:
          ubicacionTecnicoFecha ?? this.ubicacionTecnicoFecha,
      metainstanceID: metainstanceID ?? this.metainstanceID,
      ubicacionUbicacionFincaDepartamento:
          ubicacionUbicacionFincaDepartamento ??
              this.ubicacionUbicacionFincaDepartamento,
      ubicacionUbicacionFincaCodigoDepartamento:
          ubicacionUbicacionFincaCodigoDepartamento ??
              this.ubicacionUbicacionFincaCodigoDepartamento,
      ubicacionUbicacionFincaMunicipio: ubicacionUbicacionFincaMunicipio ??
          this.ubicacionUbicacionFincaMunicipio,
      ubicacionUbicacionFincaCodigoMunicipio:
          ubicacionUbicacionFincaCodigoMunicipio ??
              this.ubicacionUbicacionFincaCodigoMunicipio,
      ubicacionUbicacionFincaVereda:
          ubicacionUbicacionFincaVereda ?? this.ubicacionUbicacionFincaVereda,
      ubicacionUbicacionFincaCodigoVereda:
          ubicacionUbicacionFincaCodigoVereda ??
              this.ubicacionUbicacionFincaCodigoVereda,
      ubicacionInformacionFincaNombreFinca:
          ubicacionInformacionFincaNombreFinca ??
              this.ubicacionInformacionFincaNombreFinca,
      ubicacionInformacionFincaAreaFinca: ubicacionInformacionFincaAreaFinca ??
          this.ubicacionInformacionFincaAreaFinca,
      ubicacionInformacionFincaAreaCacao: ubicacionInformacionFincaAreaCacao ??
          this.ubicacionInformacionFincaAreaCacao,
      coordenadasPoligono: coordenadasPoligono ?? this.coordenadasPoligono,
      startGeopointLatitude:
          startGeopointLatitude ?? this.startGeopointLatitude,
      startGeopointLongitude:
          startGeopointLongitude ?? this.startGeopointLongitude,
      startGeopointAccuracy:
          startGeopointAccuracy ?? this.startGeopointAccuracy,
      startGeopointAltitude:
          startGeopointAltitude ?? this.startGeopointAltitude,
      situacionActualVisitaObjetivoVisita:
          situacionActualVisitaObjetivoVisita ??
              this.situacionActualVisitaObjetivoVisita,
      situacionActualVisitaDescripcionProyecto:
          situacionActualVisitaDescripcionProyecto ??
              this.situacionActualVisitaDescripcionProyecto,
      situacionActualVisitaRecomendaciones:
          situacionActualVisitaRecomendaciones ??
              this.situacionActualVisitaRecomendaciones,
      situacionActualVisitaCompromisos: situacionActualVisitaCompromisos ??
          this.situacionActualVisitaCompromisos,
      firmasFirmaAgricultor:
          firmasFirmaAgricultor ?? this.firmasFirmaAgricultor,
      firmasFirmaTecnico: firmasFirmaTecnico ?? this.firmasFirmaTecnico,
      registroFotograficoFotoRegistro: registroFotograficoFotoRegistro ??
          this.registroFotograficoFotoRegistro,
      datosPersonalesLugar: datosPersonalesLugar ?? this.datosPersonalesLugar,
      datosPersonalesDireccion:
          datosPersonalesDireccion ?? this.datosPersonalesDireccion,
      datosPersonalesTelefono:
          datosPersonalesTelefono ?? this.datosPersonalesTelefono,
      datosPersonalesFirma: datosPersonalesFirma ?? this.datosPersonalesFirma,
      end: end ?? this.end,
      ubicacionInformacionFincaVisita: ubicacionInformacionFincaVisita ??
          this.ubicacionInformacionFincaVisita,
      datosPersonalesFechaNota:
          datosPersonalesFechaNota ?? this.datosPersonalesFechaNota,
      datosPersonalesNota: datosPersonalesNota ?? this.datosPersonalesNota,
      datosPersonalesNota3: datosPersonalesNota3 ?? this.datosPersonalesNota3,
      datosPersonalesNota4: datosPersonalesNota4 ?? this.datosPersonalesNota4,
      ubicacionTecnicoNotaInicial:
          ubicacionTecnicoNotaInicial ?? this.ubicacionTecnicoNotaInicial,
      ubicacionTecnicoFechaNota:
          ubicacionTecnicoFechaNota ?? this.ubicacionTecnicoFechaNota,
    );
  }

  factory VisitsSurveysModels.fromJson(Map<String, dynamic> json) {
    return VisitsSurveysModels(
      surveyId: json['surveyId'],
      percent: json['percent'],
      submitterName: json['SubmitterName'],
      submitterID: json['SubmitterID'],
      categorieSurveys: json['categorieSurveys'],
      start: json['start'],
      ubicacionBeneficiarioBeneficiario:
          json['ubicacionbeneficiariop4_beneficiario'],
      ubicacionBeneficiarioCedula: json['ubicacionbeneficiariop5_cedula'],
      ubicacionTecnicoFecha: json['ubicaciontecnicop3_fecha'],
      metainstanceID: json['metainstanceID'],
      ubicacionUbicacionFincaDepartamento:
          json['ubicacionubicacion_fincap6_departamento'],
      ubicacionUbicacionFincaCodigoDepartamento:
          json['ubicacionubicacion_fincap6_codigo_departamento'],
      ubicacionUbicacionFincaMunicipio:
          json['ubicacionubicacion_fincap7_municipio'],
      ubicacionUbicacionFincaCodigoMunicipio:
          json['ubicacionubicacion_fincap7_codigo_municipio'],
      ubicacionUbicacionFincaVereda: json['ubicacionubicacion_fincap8_vereda'],
      ubicacionUbicacionFincaCodigoVereda:
          json['ubicacionubicacion_fincap8_codigo_vereda'],
      ubicacionInformacionFincaNombreFinca:
          json['ubicacioninformacion_fincap_9_nombre_finca'],
      ubicacionInformacionFincaAreaFinca:
          json['ubicacioninformacion_fincap10_area_finca'],
      ubicacionInformacionFincaAreaCacao:
          json['ubicacioninformacion_fincap11_area_cacao'],
      coordenadasPoligono: json['coordenadasp22_poligono'],
      startGeopointLatitude: json['startgeopointLatitude'],
      startGeopointLongitude: json['startgeopointLongitude'],
      startGeopointAccuracy: json['startgeopointAccuracy'],
      startGeopointAltitude: json['startgeopointAltitude'],
      situacionActualVisitaObjetivoVisita:
          json['situacion_actualvisitap14_objetivo_visita'],
      situacionActualVisitaDescripcionProyecto:
          json['situacion_actualvisitap13_descripcion_proyecto'],
      situacionActualVisitaRecomendaciones:
          json['situacion_actualvisita_resultadop19_recomendaciones'],
      situacionActualVisitaCompromisos:
          json['situacion_actualvisita_resultadop18_compromisos'],
      firmasFirmaAgricultor: json['firmasp20_firma_agricultor'],
      firmasFirmaTecnico: json['firmasp21_firma_tecnico'],
      registroFotograficoFotoRegistro:
          json['registroregistro_fotograficop23_foto_registro'],
      datosPersonalesLugar: json['datos_personalespdp_lugar'],
      datosPersonalesDireccion: json['datos_personalespdp_direccion'],
      datosPersonalesTelefono: json['datos_personalespdp_telefono'],
      datosPersonalesFirma: json['datos_personalespdp_firma'],
      end: json['end'],
      ubicacionInformacionFincaVisita:
          json['ubicacioninformacion_fincap_visita'],
      datosPersonalesFechaNota: json['datos_personalespdp_fecha_nota'],
      datosPersonalesNota: json['datos_personalespdp_nota'],
      datosPersonalesNota3: json['datos_personalespdp_nota3'],
      datosPersonalesNota4: json['datos_personalespdp_nota4'],
      ubicacionTecnicoNotaInicial: json['ubicaciontecniconota_inicial'],
      ubicacionTecnicoFechaNota: json['ubicaciontecnicop_fecha_nota'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'surveyId': surveyId,
      'percent': percent,
      'SubmitterName': submitterName,
      'SubmitterID': submitterID,
      'categorieSurveys': categorieSurveys,
      'start': start,
      'ubicacionbeneficiariop4_beneficiario': ubicacionBeneficiarioBeneficiario,
      'ubicacionbeneficiariop5_cedula': ubicacionBeneficiarioCedula,
      'ubicaciontecnicop3_fecha': ubicacionTecnicoFecha,
      'metainstanceID': metainstanceID,
      'ubicacionubicacion_fincap6_departamento':
          ubicacionUbicacionFincaDepartamento,
      'ubicacionubicacion_fincap6_codigo_departamento':
          ubicacionUbicacionFincaCodigoDepartamento,
      'ubicacionubicacion_fincap7_municipio': ubicacionUbicacionFincaMunicipio,
      'ubicacionubicacion_fincap7_codigo_municipio':
          ubicacionUbicacionFincaCodigoMunicipio,
      'ubicacionubicacion_fincap8_vereda': ubicacionUbicacionFincaVereda,
      'ubicacionubicacion_fincap8_codigo_vereda':
          ubicacionUbicacionFincaCodigoVereda,
      'ubicacioninformacion_fincap_9_nombre_finca':
          ubicacionInformacionFincaNombreFinca,
      'ubicacioninformacion_fincap10_area_finca':
          ubicacionInformacionFincaAreaFinca,
      'ubicacioninformacion_fincap11_area_cacao':
          ubicacionInformacionFincaAreaCacao,
      'coordenadasp22_poligono': coordenadasPoligono,
      'startgeopointLatitude': startGeopointLatitude,
      'startgeopointLongitude': startGeopointLongitude,
      'startgeopointAccuracy': startGeopointAccuracy,
      'startgeopointAltitude': startGeopointAltitude,
      'situacion_actualvisitap14_objetivo_visita':
          situacionActualVisitaObjetivoVisita,
      'situacion_actualvisitap13_descripcion_proyecto':
          situacionActualVisitaDescripcionProyecto,
      'situacion_actualvisita_resultadop19_recomendaciones':
          situacionActualVisitaRecomendaciones,
      'situacion_actualvisita_resultadop18_compromisos':
          situacionActualVisitaCompromisos,
      'firmasp20_firma_agricultor': firmasFirmaAgricultor,
      'firmasp21_firma_tecnico': firmasFirmaTecnico,
      'registroregistro_fotograficop23_foto_registro':
          registroFotograficoFotoRegistro,
      'datos_personalespdp_lugar': datosPersonalesLugar,
      'datos_personalespdp_direccion': datosPersonalesDireccion,
      'datos_personalespdp_telefono': datosPersonalesTelefono,
      'datos_personalespdp_firma': datosPersonalesFirma,
      'end': end,
      'ubicacioninformacion_fincap_visita': ubicacionInformacionFincaVisita,
      'datos_personalespdp_fecha_nota': datosPersonalesFechaNota,
      'datos_personalespdp_nota': datosPersonalesNota,
      'datos_personalespdp_nota3': datosPersonalesNota3,
      'datos_personalespdp_nota4': datosPersonalesNota4,
      'ubicaciontecniconota_inicial': ubicacionTecnicoNotaInicial,
      'ubicaciontecnicop_fecha_nota': ubicacionTecnicoFechaNota,
    };
  }
}
