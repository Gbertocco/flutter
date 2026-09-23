import 'package:bancodedadoslocal/models/estoque_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class EstoqueBanco {
  Future<Database> iniciarBanco() async {

    return await openDatabase(
      join(
        await getDatabasesPath(),
        'estoque.db'
      ),
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
  // CADASTRAR PRODUTO

  Future<bool> inserirEstoque(EstoqueModel produto) async {
    final db = await iniciarBanco();
    await db.insert(
      "estoque",
      produto.toJson(),
    );
    return true;

  }
  // LISTAR PRODUTOS

  Future<List<EstoqueModel>> listarEstoque() async {
    final db = await iniciarBanco();
    final lista = await db.query(
      "estoque"
    );
    return lista.map((item) {
      return EstoqueModel.fromJson(item);
    }).toList();
  }


}