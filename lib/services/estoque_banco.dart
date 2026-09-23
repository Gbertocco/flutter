import 'package:bancodedadoslocal/models/estoque_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

                class EstoqueBanco {
  Future<Database> iniciarBanco() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'estoque.db'),
      onCreate: (db, version) {
        return db.execute("""
          CREATE TABLE estoque (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            descricao TEXT,
            categoria TEXT,
            valor REAL
          )
        """);
      },
      version: 1,
    );
  }

  Future<bool> inserirEstoque(EstoqueModel dadosEstoque) async {
    final db = await iniciarBanco();

                  await db.insert(
                   "estoque",
                dadosEstoque.toJson(),
    );

    return true;
  }
}