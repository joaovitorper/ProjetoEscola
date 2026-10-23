import 'package:projetoescola/models/disciplina.dart';

class DisciplinaController {
  final List<Disciplina> disciplinas = [
    Disciplina(id: 1, nome: 'Matemática', cargaHoraria: '80h'),
  ];

  List<Disciplina> listar() => disciplinas;

  bool cadastrar(String nome, String cargaHoraria) {
    int novoId = disciplinas.isNotEmpty ? disciplinas.last.id! + 1 : 1;
    disciplinas.add(Disciplina(id: novoId, nome: nome, cargaHoraria: cargaHoraria));
    return true;
  }

  void editar(int id, String nome, String cargaHoraria) {
    final index = disciplinas.indexWhere((d) => d.id == id);
    if (index != -1) {
      disciplinas[index].nome = nome;
      disciplinas[index].cargaHoraria = cargaHoraria;
    }
  }

  void excluir(Disciplina disciplina) => disciplinas.remove(disciplina);
}