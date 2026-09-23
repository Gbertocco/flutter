    class EstoqueModel {

  int? id;
  final String nome;
  final String descricao;
  final String categoria;
  final double valor;

  EstoqueModel({
    this.id,
    required this.nome,
    required this.descricao,
    required this.categoria,
    required this.valor,
  });

  factory EstoqueModel.fromJson(Map<String, dynamic> json) {
    return EstoqueModel(
      id: json['id'],
      nome: json['nome'],
      descricao: json['descricao'],
      categoria: json['categoria'],
      valor: json['valor'],
    );
  }
  Map<String, dynamic> toJson() {

    return {
      "nome": nome,
      "descricao": descricao,
      "categoria": categoria,
      "valor": valor,
    };
  }
}