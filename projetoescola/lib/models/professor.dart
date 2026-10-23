class Professor {
  final int id;
  final String nome;
  final String email;
  final String disciplina;
  final String telefone;

  const Professor({
    required this.id,
    required this.nome,
    required this.email,
    required this.disciplina,
    required this.telefone,
  });

  // Cria uma cópia alterando só os campos informados (útil na edição).
  Professor copyWith({
    int? id,
    String? nome,
    String? email,
    String? disciplina,
    String? telefone,
  }) {
    return Professor(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      disciplina: disciplina ?? this.disciplina,
      telefone: telefone ?? this.telefone,
    );
  }

  // Converte para Map (útil para salvar em banco ou enviar para uma API).
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'disciplina': disciplina,
      'telefone': telefone,
    };
  }

  // Cria um Professor a partir de um Map.
  factory Professor.fromMap(Map<String, dynamic> map) {
    return Professor(
      id: map['id'] as int,
      nome: map['nome'] as String,
      email: map['email'] as String,
      disciplina: map['disciplina'] as String,
      telefone: map['telefone'] as String,
    );
  }
}