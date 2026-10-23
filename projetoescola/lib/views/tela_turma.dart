import 'package:flutter/material.dart';
import 'package:projetoescola/controllers/turma_controller.dart';
import 'package:projetoescola/views/tela_form_turma.dart';
import 'package:projetoescola/widgets/escola_cartao.dart';
import 'package:projetoescola/widgets/escola_pagina.dart';

class TelaTurma extends StatefulWidget {
  const TelaTurma({super.key});

  @override
  State<TelaTurma> createState() => _TelaTurmaState();
}

class _TelaTurmaState extends State<TelaTurma> {
  final TurmaController _controller = TurmaController();

  void _atualizar() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final lista = _controller.listar();
    return EscolaPagina(
      titulo: 'Lista de Turmas',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaFormTurma(controller: _controller),
                ),
              );
              _atualizar();
            },
            child: const Text('Cadastrar Nova Turma', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 16),
          EscolaCartao(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Nome')),
                  DataColumn(label: Text('Disciplina')),
                  DataColumn(label: Text('Professor')),
                  DataColumn(label: Text('Turno')),
                  DataColumn(label: Text('Vagas')),
                  DataColumn(label: Text('Ações')),
                ],
                rows: lista.map((t) {
                  return DataRow(
                    cells: [
                      DataCell(Text(t.id.toString())),
                      DataCell(Text(t.nome)),
                      DataCell(Text(t.disciplina)),
                      DataCell(Text(t.professor)),
                      DataCell(Text(t.turno)),
                      DataCell(Text(t.vagas.toString())),
                      DataCell(
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue, size: 20),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TelaFormTurma(controller: _controller, turma: t),
                                  ),
                                );
                                _atualizar();
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                              onPressed: () {
                                _controller.excluir(t);
                                _atualizar();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}