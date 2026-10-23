class Matricula {
  final int id;
  final String aluno;
  final String disciplina;
  final DateTime data;
  final String situacao; // Ativa, Trancada ou Cancelada

  const Matricula({
    required this.id,
    required this.aluno,
    required this.disciplina,
    required this.data,
    required this.situacao,
  });

  Matricula copyWith({
    int? id,
    String? aluno,
    String? disciplina,
    DateTime? data,
    String? situacao,
  }) {
    return Matricula(
      id: id ?? this.id,
      aluno: aluno ?? this.aluno,
      disciplina: disciplina ?? this.disciplina,
      data: data ?? this.data,
      situacao: situacao ?? this.situacao,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'aluno': aluno,
      'disciplina': disciplina,
      'data': data.toIso8601String(),
      'situacao': situacao,
    };
  }

  factory Matricula.fromMap(Map<String, dynamic> map) {
    return Matricula(
      id: map['id'] as int,
      aluno: map['aluno'] as String,
      disciplina: map['disciplina'] as String,
      data: DateTime.parse(map['data'] as String),
      situacao: map['situacao'] as String,
    );
  }
}