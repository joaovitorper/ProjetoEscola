import 'package:flutter/material.dart';
import '../models/turma.dart';
import 'tela_form_turma.dart';

class TelaTurma extends StatefulWidget {
  const TelaTurma({super.key});

  @override
  State<TelaTurma> createState() => _TelaTurmaState();
}

class _TelaTurmaState extends State<TelaTurma> {
  final List<Turma> _turmas = [
    Turma(
      id: 1,
      nome: 'Turma A',
      disciplina: 'Matemática',
      professor: 'Carlos Silva',
      turno: 'Manhã',
      vagas: 30,
    ),
    Turma(
      id: 2,
      nome: 'Turma B',
      disciplina: 'História',
      professor: 'Ana Souza',
      turno: 'Tarde',
      vagas: 25,
    ),
  ];

  int _proximoId = 3;

  Future<void> _abrirFormulario({Turma? turma}) async {
    final resultado = await Navigator.push<Turma>(
      context,
      MaterialPageRoute(
        builder: (_) => TelaFormTurma(turma: turma),
      ),
    );

    if (resultado == null) return;

    setState(() {
      if (turma == null) {
        _turmas.add(resultado.copyWith(id: _proximoId++));
      } else {
        final i = _turmas.indexWhere((t) => t.id == turma.id);
        _turmas[i] = resultado;
      }
    });
  }

  void _excluir(Turma turma) {
    setState(() => _turmas.removeWhere((t) => t.id == turma.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Turmas')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _abrirFormulario(),
        child: const Icon(Icons.add),
      ),
      body: _turmas.isEmpty
          ? const Center(child: Text('Nenhuma turma cadastrada'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _turmas.length,
              itemBuilder: (context, index) {
                final t = _turmas[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text(t.nome[0])),
                    title: Text('${t.nome} - ${t.disciplina}'),
                    subtitle: Text(
                      'Professor: ${t.professor}\nTurno: ${t.turno} | Vagas: ${t.vagas}',
                    ),
                    isThreeLine: true,
                    onTap: () => _abrirFormulario(turma: t),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => _excluir(t),
                    ),
                  ),
                );
              },
            ),
    );
  }
}