import 'package:bancodedadoslocal/models/estoque_model.dart';
import 'package:bancodedadoslocal/services/estoque_banco.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  List<EstoqueModel> _produtos = [];
  @override
  void initState() {
    super.initState();
    _carregarProdutos();
  }
  void _carregarProdutos() async {
    final produtos = await EstoqueBanco()
        .listarEstoque();
    setState(() {
      _produtos = produtos;
    });
  }
  void abrirFormulario() {
    final nomeController = TextEditingController();
    final descricaoController = TextEditingController();
    final categoriaController = TextEditingController();
    final valorController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Cadastro de Produto"
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: "Nome"
                ),
              ),
              TextField(
                controller: descricaoController,
                decoration: InputDecoration(
                  labelText: "Descrição"
                ),
              ),
              TextField(
                controller: categoriaController,
                decoration: InputDecoration(
                  labelText: "Categoria"
                ),
              ),
              TextField(
                controller: valorController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Valor"
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancelar"
              ),
            ),
            TextButton(
              onPressed: () async {
                final produto = EstoqueModel(
                  nome: nomeController.text,
                  descricao: descricaoController.text,
                  categoria: categoriaController.text,
                  valor: double.parse(
                    valorController.text
                  ),
                );
                await EstoqueBanco()
                    .inserirEstoque(produto);
                Navigator.pop(context);
                _carregarProdutos();
                ScaffoldMessenger.of(context)
                .showSnackBar(
                  SnackBar(
                    content: Text(
                      "Produto cadastrado com sucesso!"
                    ),
                  ),
                );
              },
              child: Text(
                "Salvar"
              ),

            )
          ],


        );

      },

    );

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text(
          "Estoque"
        ),

        backgroundColor: Colors.deepPurple,

      ),

      body: ListView.builder(
        itemCount: _produtos.length,

        itemBuilder: (context,index) {
          final produto = _produtos[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.inventory
                ),

              ),

              title: Text(
                produto.nome
              ),

              subtitle: Text(

                "${produto.categoria}\n"
                "${produto.descricao}\n"
                "R\$ ${produto.valor.toStringAsFixed(2)}"

              ),
            ),


          );

        },


      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          abrirFormulario();
        },


        child: Icon(
          Icons.add
        ),
      ),

    );

  }



}