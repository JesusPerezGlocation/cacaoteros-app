// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
Base SQL para guardar las visitas en local
*/
class VisitsRegisterSQLServices {
  // Inicializa la base SQL
  static final VisitsRegisterSQLServices instance =
      VisitsRegisterSQLServices._init();

  static Database? _database;

  VisitsRegisterSQLServices._init();

  // Nombre de la tabla
  final String tableVisitsRegister = 'visits_register';

  // Base de datos
  Future<Database> get database async {
    // Si la base de datos está creada, la retorna; si no, la crea
    if (_database != null) return _database!;

    _database = await _initDB('visits.db');

    return _database!;
  }

  // Lista de visitas
  List<VisitsSurveysModels> _listVisitsRegister = [];

  // Instancia para acceder a la lista
  List<VisitsSurveysModels> get listVisitsRegister => _listVisitsRegister;

  Future<Database> _initDB(String filePath) async {
    // Ayuda a determinar el path adecuado para los archivos
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(
      path,
      version: 9,
      onCreate: _onCreateDB,
    );
  }

//        SubmitterName TEXT NOT NULL,
  // Crea la base con los datos
  Future<void> _onCreateDB(Database db, int version) async {
    // Si es la primera vez que se abre la base de datos, crea una tabla
    await db.execute('''
    CREATE TABLE $tableVisitsRegister (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      surveyId TEXT NOT NULL,
      percent REAL NOT NULL,
      categorieSurveys TEXT NOT NULL,
      SubmitterID TEXT NOT NULL,
      SubmitterName TEXT NOT NULL,
      start TEXT NOT NULL,
      ubicacionbeneficiariop4_beneficiario TEXT,
      ubicacionbeneficiariop5_cedula TEXT,
      ubicaciontecnicop3_fecha TEXT,
      ubicacionubicacion_fincap6_departamento TEXT,
      ubicacion_ubicacion_finca_codigo_departamento TEXT,
      ubicacionubicacion_fincap7_municipio TEXT,
      ubicacionubicacion_fincap7_codigo_municipio TEXT,
      ubicacionubicacion_fincap8_vereda TEXT,
      ubicacionubicacion_fincap8_codigo_vereda TEXT,
      ubicacioninformacion_fincap_9_nombre_finca TEXT,
      ubicacioninformacion_fincap10_area_finca REAL,
      ubicacioninformacion_fincap11_area_cacao REAL,
      coordenadasp22_poligono TEXT,
      startgeopointLatitude REAL NOT NULL,
      startgeopointLongitude REAL NOT NULL,
      startgeopointAccuracy REAL NOT NULL,
      startgeopointAltitude REAL,
      situacion_actualvisitap14_objetivo_visita TEXT,
      situacion_actualvisitap13_descripcion_proyecto TEXT,
      situacion_actualvisita_resultadop19_recomendaciones TEXT,
      situacion_actualvisita_resultadop18_compromisos TEXT,
      firmasp20_firma_agricultor TEXT,
      firmasp21_firma_tecnico TEXT,
      registroregistro_fotograficop23_foto_registro TEXT,
      datos_personalespdp_lugar TEXT,
      datos_personalespdp_direccion TEXT,
      datos_personalespdp_telefono TEXT,
      datos_personalespdp_firma TEXT,
      end TEXT NOT NULL,
      ubicacioninformacion_fincap_visita TEXT,
      datos_personalespdp_fecha_nota TEXT,
      datos_personalespdp_nota TEXT,
      datos_personalespdp_nota3 TEXT,
      datos_personalespdp_nota4 TEXT,
      ubicaciontecniconota_inicial TEXT,
      ubicaciontecnicop_fecha_nota TEXT,
      FOREIGN KEY (surveyId) REFERENCES ${ListDraftAllSurveysSQL.instance.tableListSurveys}(id)
    )
''');
  }

  // Inserta los datos en la tabla
  Future<void> insertVisitsRegister(
      VisitsSurveysModels visitsSurveysModels, BuildContext context) async {
    try {
      final db = await database;
      // Obtenemos el ID correspondiente de list_all_surveys
      final List<DraftSurveysListModel> allSurveys =
          await ListDraftAllSurveysSQL.instance.getAllSurveysGet();
      int surveyId = allSurveys.isNotEmpty ? allSurveys.first.id : 0;

      // Asignamos el ID de list_all_surveys al nuevo registro
      visitsSurveysModels =
          visitsSurveysModels.copyWith(surveyId: surveyId.toString());

      await db.insert(tableVisitsRegister, visitsSurveysModels.toJson());
      _listVisitsRegister.add(visitsSurveysModels);
    } catch (e) {
      log('Error al insertar registro de visita: ');
      return SnackBarGlobalWidget.showSnackBar(
        context,
        'Hubo un error $e',
        Icons.error_outlined,
        PaletteColorsTheme.redErrorColor,
      );
    }
    log('Lista insertada: ${_listVisitsRegister.length}');
  }

  // Obtiene la lista de visitas
  Future<List<VisitsSurveysModels>> readVisitsRegister() async {
    try {
      final db = await database;
      final results = await db.query(
        tableVisitsRegister,
        orderBy: 'id DESC',
      );
      _listVisitsRegister = List.generate(results.length, (index) {
        return VisitsSurveysModels.fromJson(results[index]);
      });

      // _listVisitsRegister =
      //     results.map((row) => VisitsSurveysModels.fromJson(row)).toList();
      print('Lista de visitas: $_listVisitsRegister');
      return _listVisitsRegister;
    } catch (e) {
      log('Error al leer registros de visita: ${e.toString()}');
      return [];
    }
  }

  // Actualiza una encuesta de visita
  Future<void> updateVisitsRegister(
      VisitsSurveysModels visitsSurveysModels, BuildContext context) async {
    try {
      final db = await database;
      await db.update(
        tableVisitsRegister,
        visitsSurveysModels.toJson(),
        where: 'id = ?',
        whereArgs: [visitsSurveysModels.metainstanceID],
      );

      final index = _listVisitsRegister.indexWhere((element) =>
          element.metainstanceID == visitsSurveysModels.metainstanceID);
      if (index != -1) {
        _listVisitsRegister[index] = visitsSurveysModels;
      }
    } catch (e) {
      log('Error al actualizar registro de visita: ${e.toString()}');
      return SnackBarGlobalWidget.showSnackBar(
        context,
        'Hubo un error $e',
        Icons.error_outlined,
        PaletteColorsTheme.redErrorColor,
      );
    }
  }

  // Elimina todas las encuestas hijas de registro de visitas
  Future<void> deleteAllVisitsRegister() async {
    try {
      final db = await database;
      await db.delete(tableVisitsRegister);
      _listVisitsRegister.clear();
    } catch (e) {
      log('Error al eliminar todos los registros de visita: ${e.toString()}');
    }
  }

  // Elimina una encuesta
  Future<void> deleteVisitsRegisterById(String id) async {
    try {
      final db = await database;
      await db.delete(
        tableVisitsRegister,
        where: 'id = ?',
        whereArgs: [id],
      );

      final index = _listVisitsRegister
          .indexWhere((element) => element.metainstanceID == id);
      if (index != -1) {
        _listVisitsRegister.removeAt(index);
      }
    } catch (e) {
      log('Error al eliminar registro de visita por ID: ${e.toString()}');
    }
  }
}
