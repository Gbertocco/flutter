import 'package:bancodedadoslocal/models/estoque_model.dart';
import 'package:flutter/material.dart';
import 'package:listacontatos/models/estoque_model.dart';
import 'package:listacontatos/services/estoque_banco.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  //============================================
  List<EstoqueModel> _listarEstoque = [];

  @override
  void initState() {
    super.initState();
    _carregarEstoque();
  }

  void _carregarEstoque() async {
    final contatos = await ContatoBanco().listarContatos();
    setState(() {
      _listarContatos = contatos;
    });
  }

  }