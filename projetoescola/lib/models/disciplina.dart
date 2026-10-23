class Disciplina {
  final int id;
  final String nome;
  final int cargaHoraria;
  final String descricao;

  const Disciplina({
    required this.id,
    required this.nome,
    required this.cargaHoraria,
    required this.descricao,
  });

  Disciplina copyWith({
    int? id,
    String? nome,
    int? cargaHoraria,
    String? descricao,
  }) {
    return Disciplina(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      cargaHoraria: cargaHoraria ?? this.cargaHoraria,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'cargaHoraria': cargaHoraria,
      'descricao': descricao,
    };
  }

  factory Disciplina.fromMap(Map<String, dynamic> map) {
    return Disciplina(
      id: map['id'] as int,
      nome: map['nome'] as String,
      cargaHoraria: map['cargaHoraria'] as int,
      descricao: map['descricao'] as String,
    );
  }
}