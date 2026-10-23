import 'package:flutter/material.dart';
import 'package:projetoescola/controllers/turma_controller.dart';
import 'package:projetoescola/models/turma.dart';
import 'package:projetoescola/views/tela_form_turma.dart';

class TelaTurma extends StatefulWidget {
  const TelaTurma({Key? key}) : super(key: key);

  @override
  State<TelaTurma> createState() => _TelaTurmaState();
}

class _TelaTurmaState extends State<TelaTurma> {
  final TurmaController _controller = TurmaController();

  void _atualizarTela() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final turmas = _controller.listar();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Turmas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                // Abre o formulário para cadastrar nova turma
                final Turma? novaTurma = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaFormTurma(),
                  ),
                );

                if (novaTurma != null) {
                  _controller.cadastrar(
                    novaTurma.nome,
                    novaTurma.disciplina,
                    novaTurma.professor,
                    novaTurma.turno,
                    novaTurma.vagas,
                  );
                  _atualizarTela();
                }
              },
              child: const Text('Cadastrar Nova Turma'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: turmas.length,
              itemBuilder: (context, index) {
                final turma = turmas[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: ListTile(
                    title: Text(turma.nome),
                    subtitle: Text(
                      'Disciplina: ${turma.disciplina}\nProfessor: ${turma.professor} | Turno: ${turma.turno} | Vagas: ${turma.vagas}',
                    ),
                    isThreeLine: true,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Botão de Editar
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () async {
                            final Turma? turmaEditada = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TelaFormTurma(turma: turma),
                              ),
                            );

                            if (turmaEditada != null) {
                              _controller.editar(
                                turma.id!,
                                turmaEditada.nome,
                                turmaEditada.disciplina,
                                turmaEditada.professor,
                                turmaEditada.turno,
                                turmaEditada.vagas,
                              );
                              _atualizarTela();
                            }
                          },
                        ),
                        // Botão de Excluir
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            _controller.excluir(turma);
                            _atualizarTela();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}