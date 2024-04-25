// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
base sql para el crud de listas de encuestas guardadas en borradores
*/
class ListDraftAllSurveysSQL {
/*inicializa la base SQL */
  static final ListDraftAllSurveysSQL instance = ListDraftAllSurveysSQL._init();

  static Database? _database;

  ListDraftAllSurveysSQL._init();

  /*nombre de la tabla */
  final String tableListSurveys = 'list_all_surveys';

  /*base de datos */
  Future<Database> get database async {
    /*si la base de datos está creada la retorna, si no la crea */
    if (_database != null) return _database!;

    _database = await _initDB('surveys.db');

    return _database!;
  }

  /*lista de encuestas */
  List<DraftSurveysListModel> _listSurveysAll = [];
  /*instancia para acceder la a la lista*/
  List<DraftSurveysListModel> get listSurveysAll => _listSurveysAll;

  /*modelo json de los datos*/
  static String columID = 'id';
  static String columnmTitle = 'title';
  static String columnmDate = 'date';
  static String columnmColor = 'colors';
  static String columnmCategorie = 'categorie';

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
    CREATE TABLE $tableListSurveys(
    $columID INTEGER PRIMARY KEY,
    $columnmTitle TEXT, 
    $columnmDate TEXT, 
    $columnmColor TEXT,
    $columnmCategorie TEXT
    )
''');
  }

  /*inserta los datos a lista*/
  Future<void> insertAllSurveys(List<DraftSurveysListModel> todos) async {
    final db = await instance.database;

    final batch = db.batch();

    /*recorre la lista */
    for (var todo in todos) {
      batch.insert(tableListSurveys, todo.toJson());
      /*almacena en la lists */
      _listSurveysAll.add(todo);
    }

    await batch.commit(noResult: true);
  }

  /*obtiene todos los datos de la lista*/
  Future<List<DraftSurveysListModel>> getAllSurveysGet() async {
    final db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.query(tableListSurveys);

    /*le da valor a  _listSurveysAll y lo retorna*/
    _listSurveysAll = List.generate(maps.length, (index) {
      return DraftSurveysListModel.fromJson(maps[index]);
    });
    log('borradores guardados: ${_listSurveysAll.length}');
    return _listSurveysAll;
  }

  /*actualiza toda la lista de encuestas */
  Future<void> updateAllSurveys(List<DraftSurveysListModel> todos) async {
    final db = await instance.database;

    final batch = db.batch();

    for (var todo in todos) {
      batch.update(
        tableListSurveys,
        todo.toJson(),
        where: '$columID = ?',
        whereArgs: [todo.id],
      );
      /*actualiza el todo en la lista en memoria*/
      int index =
          _listSurveysAll.indexWhere((element) => element.id == todo.id);
      if (index != -1) {
        _listSurveysAll[index] = todo;
      }
    }
    await batch.commit(noResult: true);
  }

  /*eliminar todas las encuestas alamacenadas*/
  Future<void> deleteAllSurveys() async {
    final db = await instance.database;

    await db.delete(tableListSurveys);

    /*limpia la lista en memoria*/
    _listSurveysAll.clear();
  }

  /*eliminar solo una encuesta por su ID*/
  Future<void> deleteOneSurveyForID(String id) async {
    final db = await instance.database;

    await db.delete(
      tableListSurveys,
      where: '$columID = ?',
      whereArgs: [id],
    );
    /*elimina un dato de la lista*/
    _listSurveysAll.removeWhere((todo) => todo.id == id);
  }
}
