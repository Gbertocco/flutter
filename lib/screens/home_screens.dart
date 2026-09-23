import 'package:bancodedadoslocal/models/estoque_model.dart';
import 'package:bancodedadoslocal/services/estoque_banco.dart';
import 'package:flutter/material.dart';



          class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

         class _HomeScreenState extends State<HomeScreen> {
            final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
         final TextEditingController _categoriaController = TextEditingController();
          final TextEditingController _valorController = TextEditingController();

  void _cadastrarProduto() async {
    final produto = EstoqueModel(
      nome: _nomeController.text,
      descricao: _descricaoController.text,
      categoria: _categoriaController.text,
      valor: double.parse(_valorController.text),
    );
                     await EstoqueBanco().inserirEstoque(produto);

    _nomeController.clear();
    _descricaoController.clear();
    _categoriaController.clear();
    _valorController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Produto cadastrado com sucesso!"),
      ),
    );
  }

                 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Produto"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: "Nome",
              ),
            ),

            TextField(
              controller: _descricaoController,
              decoration: const InputDecoration(
                labelText: "Descrição",
              ),
            ),

            TextField(
              controller: _categoriaController,
              decoration: const InputDecoration(
                labelText: "Categoria",
              ),
            ),

            TextField(
              controller: _valorController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: "Valor",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _cadastrarProduto,
              child: const Text("Cadastrar Produto"),
            ),
          ],
        ),
      ),
    );
  }
}