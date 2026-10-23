class Disciplina {
  final int? id;
  final String nome;
  final int cargaHoraria;
  final String ementa;

  Disciplina({
    this.id,
    required this.nome,
    required this.cargaHoraria,
    required this.ementa,
  });

  Disciplina copyWith({
    int? id,
    String? nome,
    int? cargaHoraria,
    String? ementa,
  }) {
    return Disciplina(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      cargaHoraria: cargaHoraria ?? this.cargaHoraria,
      ementa: ementa ?? this.ementa,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'cargaHoraria': cargaHoraria,
      'ementa': ementa,
    };
  }

  factory Disciplina.fromMap(Map<String, dynamic> map) {
    return Disciplina(
      id: map['id'] as int?,
      nome: map['nome'] as String,
      cargaHoraria: map['cargaHoraria'] as int,
      ementa: map['ementa'] as String,
    );
  }
}