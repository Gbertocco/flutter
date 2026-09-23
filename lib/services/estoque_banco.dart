import 'package:listacontatos/models/estoque_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class EstoqueModel {

  Future<Database> iniciarBanco() async {
    return await openDatabase(
      // /data/data/<package_name>/databases/"contato.db"
      join(await getDatabasesPath(), 'estoque.db'),
      onCreate: (db, version) {
        return db.execute("""CREATE TABLE estoque (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT,
          descricao TEXT,
          categoria TEXT,
          valor double
        )""");
      },
      version: 1
    );
  }
  Future<List<EstoqueModel>> listarEstoque() async {
    final db = await iniciarBanco();
    final List<Map<String, dynamic>> json = await db.query("estoque");
     return json.map((item) => EstoqueModel.fromJson(item)).toList();
  }

  Future<bool> inserirEstoque(EstoqueModel dadosEstoque) async {
    final db = await iniciarBanco(); 
    await db.insert("estoque", dadosEstoque.toJson());
    return true;
  }
}