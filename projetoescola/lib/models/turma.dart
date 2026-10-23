class Turma {
  int? id;
  String nome;
  String disciplina;
  String professor;
  String turno;
  int vagas;

  Turma({
    this.id,
    required this.nome,
    required this.disciplina,
    required this.professor,
    required this.turno,
    required this.vagas,
  });
}