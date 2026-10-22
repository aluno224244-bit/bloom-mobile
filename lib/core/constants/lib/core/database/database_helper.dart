import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('bloom.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    // Tabela Definicoes_Utilizador
    await db.execute('''
      CREATE TABLE Definicoes_Utilizador (
        id_utilizador INTEGER PRIMARY KEY AUTOINCREMENT,
        duracao_media_ciclo INTEGER NOT NULL DEFAULT 28,
        pin_hash TEXT NOT NULL,
        biometria_ativa BOOLEAN NOT NULL DEFAULT 0,
        modo_discreto BOOLEAN NOT NULL DEFAULT 0
      )
    ''');

    // Tabela Ciclos
    await db.execute('''
      CREATE TABLE Ciclos (
        id_ciclo INTEGER PRIMARY KEY AUTOINCREMENT,
        data_inicio DATE NOT NULL,
        data_fim_prevista DATE,
        duracao_dias INTEGER
      )
    ''');

    // Tabela Registos_Diarios
    await db.execute('''
      CREATE TABLE Registos_Diarios (
        id_registo INTEGER PRIMARY KEY AUTOINCREMENT,
        id_ciclo INTEGER,
        data_registo DATE NOT NULL,
        nivel_dor INTEGER CHECK (nivel_dor BETWEEN 1 AND 5),
        estado_humor VARCHAR(50),
        sintomas_fisicos TEXT,
        FOREIGN KEY (id_ciclo) REFERENCES Ciclos(id_ciclo) ON DELETE CASCADE
      )
    ''');
  }
}
