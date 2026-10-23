import 'package:projetoescola/models/matricula.dart';

class MatriculaController {
  final List<Matricula> matriculas = [
    Matricula(
      id: 1,
      aluno: 'João Silva',
      turma: 'INFO1A',
      dataMatricula: '10/02/2026',
    ),
  ];

  List<Matricula> listar() {
    return matriculas;
  }

  bool cadastrar(String aluno, String turma, String dataMatricula) {
    int novoId = 1;
    if (matriculas.isNotEmpty) {
      novoId = matriculas.last.id! + 1;
    }

    matriculas.add(
      Matricula(
        id: novoId,
        aluno: aluno,
        turma: turma,
        dataMatricula: dataMatricula,
      ),
    );
    return true;
  }

  void editar(int id, String aluno, String turma, String dataMatricula) {
    final index = matriculas.indexWhere((m) => m.id == id);
    if (index != -1) {
      matriculas[index].aluno = aluno;
      matriculas[index].turma = turma;
      matriculas[index].dataMatricula = dataMatricula;
    }
  }

  void excluir(Matricula matricula) {
    matriculas.remove(matricula);
  }
}