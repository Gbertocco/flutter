class EstoqueModel {
  int? id;
  final String nome;
  final String descricao;
  final String categoria;
  final double valor;
  
  EstoqueModel({
    required this.nome,
    required this.descricao,
    required this.categoria,
    required this.valor,
    this.id
  });

  factory EstoqueModel.fromJson(Map json) {
    return EstoqueModel(
      id: json['id'],
      nome: json['nome'], 
      descricao: json['email'], 
      categoria: json['telefone'],
      valor: json['valor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nome": nome,
      "descricao": descricao,
      "categoria": categoria,
      "valor": valor,
    };
  }
}