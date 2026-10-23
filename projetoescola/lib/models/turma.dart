class Turma {
  final int? id; // Alterado para opcional (nullable)
  final String nome;
  final String disciplina;
  final String professor;
  final String turno; // Manhã, Tarde ou Noite
  final int vagas;

  const Turma({
    this.id,
    required this.nome,
    required this.disciplina,
    required this.professor,
    required this.turno,
    required this.vagas,
  });

  Turma copyWith({
    int? id,
    String? nome,
    String? disciplina,
    String? professor,
    String? turno,
    int? vagas,
  }) {
    return Turma(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      disciplina: disciplina ?? this.disciplina,
      professor: professor ?? this.professor,
      turno: turno ?? this.turno,
      vagas: vagas ?? this.vagas,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'disciplina': disciplina,
      'professor': professor,
      'turno': turno,
      'vagas': vagas,
    };
  }

  factory Turma.fromMap(Map<String, dynamic> map) {
    return Turma(
      id: map['id'] as int?,
      nome: map['nome'] as String,
      disciplina: map['disciplina'] as String,
      professor: map['professor'] as String,
      turno: map['turno'] as String,
      vagas: map['vagas'] as int,
    );
  }
}