// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';
/*
Base sql para guardar las visitas en local
*/

class VisitsRegisterSQLServices {
  /*inicializa la base SQL */
  static final VisitsRegisterSQLServices instance =
      VisitsRegisterSQLServices._init();

  static Database? _database;

  VisitsRegisterSQLServices._init();

  /*nombre de la tabla */
  final String tableVisitsRegister = 'visits_register';

  /*base de datos */
  Future<Database> get database async {
    /*si la base de datos está creada la retorna, si no la crea */
    if (_database != null) return _database!;

    _database = await _initDB('surveys.db');

    return _database!;
  }

  /*lista de visitas */
  final List<VisitsSurveysModels> _listVisitsRegister = [];

  /*instancia para acceder la a la lista*/
  List<VisitsSurveysModels> get listVisitsRegister => _listVisitsRegister;

  Future<Database> _initDB(String filePath) async {
    /*ayuda a determinar el path adecuado para los archivos */
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreateDB,
    );
  }

  /*crea la base con los datos */
  Future<void> _onCreateDB(Database db, int version) async {
    /*si es primera vez que se abre la base de datos, crea una tabla */
    await db.execute('''
    CREATE TABLE $tableVisitsRegister (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      list_id TEXT NOT NULL,
      percent REAL NOT NULL,
      categorie_surveys TEXT NOT NULL,
      submitter_name TEXT NOT NULL,
      submitter_id TEXT NOT NULL,
      start TEXT NOT NULL,
      ubicacion_beneficiario_beneficiario TEXT,
      ubicacion_beneficiario_cedula TEXT,
      ubicacion_tecnico_fecha TEXT,
      ubicacion_ubicacion_finca_departamento TEXT,
      ubicacion_ubicacion_finca_codigo_departamento TEXT,
      ubicacion_ubicacion_finca_municipio TEXT,
      ubicacion_ubicacion_finca_codigo_municipio TEXT,
      ubicacion_ubicacion_finca_vereda TEXT,
      ubicacion_ubicacion_finca_codigo_vereda TEXT,
      ubicacion_informacion_finca_nombre_finca TEXT,
      ubicacion_informacion_finca_area_finca REAL,
      ubicacion_informacion_finca_area_cacao REAL,
      coordenadas_poligono TEXT,
      start_geopoint_latitude REAL NOT NULL,
      start_geopoint_longitude REAL NOT NULL,
      start_geopoint_accuracy REAL NOT NULL,
      start_geopoint_altitude REAL,
      situacion_actual_visita_objetivo_visita TEXT,
      situacion_actual_visita_descripcion_proyecto TEXT,
      situacion_actual_visita_recomendaciones TEXT,
      situacion_actual_visita_compromisos TEXT,
      firmas_firma_agricultor TEXT,
      firmas_firma_tecnico TEXT,
      registro_fotografico_foto_registro TEXT,
      datos_personales_lugar TEXT,
      datos_personales_direccion TEXT,
      datos_personales_telefono TEXT,
      datos_personales_firma TEXT,
      end TEXT NOT NULL,
      ubicacion_informacion_finca_visita TEXT,
      datos_personales_fecha_nota TEXT,
      datos_personales_nota TEXT,
      datos_personales_nota3 TEXT,
      datos_personales_nota4 TEXT,
      ubicacion_tecnico_nota_inicial TEXT,
      ubicacion_tecnico_fecha_nota TEXT,
      FOREIGN KEY (surveyId) REFERENCES ${ListDraftAllSurveysSQL.instance.tableListSurveys}(id)
    )
''');
  }

  /*inserta los datos en la table */
  Future<void> insertVisitsRegister(
      VisitsSurveysModels visitsSurveysModels) async {
    try {
      final db = await database;
      await db.insert(tableVisitsRegister, visitsSurveysModels.toJson());
      _listVisitsRegister.add(visitsSurveysModels);
    } catch (e) {
      log('Error al insertar registro de visita: ${e.toString()}');
    }
  }

  /*actualiza una encueesta visita */
  Future<void> updateVisitsRegister(
      VisitsSurveysModels visitsSurveysModels) async {
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
    }
  }

  /*elimina todas las encuestas hija de registro de visitas*/
  Future<void> deleteAllVisitsRegister() async {
    try {
      final db = await database;
      await db.delete(tableVisitsRegister);
      _listVisitsRegister.clear();
    } catch (e) {
      log('Error al eliminar todos los registros de visita: ${e.toString()}');
    }
  }

  /*elimina una encuesta*/
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
