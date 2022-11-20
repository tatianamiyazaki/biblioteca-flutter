import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/livro.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then(
    (dbPath) {
      final String path = join(dbPath, 'livro.db');
      return openDatabase(
        path,
        onCreate: (db, version) {
          db.execute(
            'CREATE TABLE livros( '
            'id INTEGER PRIMARY KEY, '
            'name TEXT, '
            'autor TEXT,'
            'editora TEXT,'
            'edicao TEXT,'
            'anoEdicao INTEGER) ',
          );
        },
        version: 1,
      );
    },
  );
}

Future<int> save(Livro livro) {
  return createDatabase().then(
    (db) {
      final Map<String, dynamic> livroMap = Map();
      livroMap['name'] = livro.name;
      livroMap['autor'] = livro.autor;
      livroMap['editora'] = livro.editora;
      livroMap['edicao'] = livro.edicao;
      livroMap['anoEdicao'] = livro.anoEdicao;
      return db.insert('livros', livroMap);
    },
  );
}

Future<List<Livro>> findAll() {
  return createDatabase().then(
    (db) {
      return db.query('livros').then(
        (maps) {
          final List<Livro> livros = [];
          for (Map<String, dynamic> map in maps) {
            final Livro livro = Livro(
              map['id'],
              map['name'],
              map['autor'],
              map['editora'],
              map['edicao'],
              map['anoEdicao'],
            );
            livros.add(livro);
          }
          return livros;
        },
      );
    },
  );
}
