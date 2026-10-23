import 'package:projetoescola/models/disciplina.dart';

class DisciplinaController {
  final List<Disciplina> disciplinas = [
    Disciplina(id: 1, nome: 'Matemática', cargaHoraria: 80, ementa: 'Álgebra e Geometria'),
    Disciplina(id: 2, nome: 'Português', cargaHoraria: 80, ementa: 'Gramática e Literatura'),
  ];

  List<Disciplina> listar() {
    return disciplinas;
  }

  bool cadastrar(String nome, int cargaHoraria, String ementa) {
    for (final disciplina in disciplinas) {
      if (disciplina.nome.toLowerCase() == nome.toLowerCase()) {
        return false;
      }
    }

    int novoId = 1;
    if (disciplinas.isNotEmpty) {
      novoId = disciplinas.last.id! + 1; // <--- Adicionado o '!' aqui
    }

    disciplinas.add(
      Disciplina(id: novoId, nome: nome, cargaHoraria: cargaHoraria, ementa: ementa),
    );
    return true;
  }

  void editar(int id, String nome, int cargaHoraria, String ementa) {
    final index = disciplinas.indexWhere((d) => d.id == id);
    if (index != -1) {
      disciplinas[index].nome = nome;
      disciplinas[index].cargaHoraria = cargaHoraria;
      disciplinas[index].ementa = ementa;
    }
  }

  void excluir(Disciplina disciplina) {
    disciplinas.remove(disciplina);
  }
}