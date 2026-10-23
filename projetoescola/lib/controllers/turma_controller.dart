import 'package:projetoescola/models/turma.dart';

class TurmaController {
  final List<Turma> turmas = [
    Turma(
      id: 1,
      nome: 'INFO1A',
      disciplina: 'Matemática',
      professor: 'Carlos Souza',
      turno: 'Manhã',
      vagas: 30,
    ),
  ];

  List<Turma> listar() {
    return turmas;
  }

  bool cadastrar(String nome, String disciplina, String professor, String turno, int vagas) {
    for (final turma in turmas) {
      if (turma.nome.toLowerCase() == nome.toLowerCase()) {
        return false;
      }
    }

    int novoId = 1;
    if (turmas.isNotEmpty) {
      novoId = turmas.last.id! + 1;
    }

    turmas.add(
      Turma(
        id: novoId,
        nome: nome,
        disciplina: disciplina,
        professor: professor,
        turno: turno,
        vagas: vagas,
      ),
    );
    return true;
  }

  void editar(int id, String nome, String disciplina, String professor, String turno, int vagas) {
    final index = turmas.indexWhere((t) => t.id == id);
    if (index != -1) {
      turmas[index].nome = nome;
      turmas[index].disciplina = disciplina;
      turmas[index].professor = professor;
      turmas[index].turno = turno;
      turmas[index].vagas = vagas;
    }
  }

  void excluir(Turma turma) {
    turmas.remove(turma);
  }
}