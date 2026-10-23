import 'package:projetoescola/models/professor.dart';

class ProfessorController {
  final List<Professor> professores = [
    Professor(1, 'Carlos Alberto', '111.111.111-11', '(12)98888-1111'),
  ];

  List<Professor> listar() {
    return professores;
  }

  bool cadastrar(String nome, String cpf, String telefone) {
    for (final professor in professores) {
      if (professor.cpf == cpf) {
        return false; // Retorna falso se já existir um professor com o mesmo CPF
      }
    }

    int id = 1;
    if (professores.isNotEmpty) {
      id = professores.last.id + 1;
    }

    professores.add(Professor(id, nome, cpf, telefone));
    return true;
  }

  void editar(Professor professor, String nome, String telefone) {
    professor.nome = nome;
    professor.telefone = telefone;
  }

  void excluir(Professor professor) {
    professores.remove(professor);
  }
}