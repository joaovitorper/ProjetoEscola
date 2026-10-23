import 'package:flutter/material.dart';
import 'package:projetoescola/controllers/disciplina_controller.dart';
import 'package:projetoescola/views/tela_form_disciplina.dart';
import 'package:projetoescola/widgets/escola_cartao.dart';
import 'package:projetoescola/widgets/escola_pagina.dart';

class TelaDisciplina extends StatefulWidget {
  const TelaDisciplina({super.key});

  @override
  State<TelaDisciplina> createState() => _TelaDisciplinaState();
}

class _TelaDisciplinaState extends State<TelaDisciplina> {
  final DisciplinaController _controller = DisciplinaController();

  void _atualizar() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final lista = _controller.listar();
    return EscolaPagina(
      titulo: 'Lista de Disciplinas',
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
                  builder: (context) => TelaFormDisciplina(controller: _controller),
                ),
              );
              _atualizar();
            },
            child: const Text(
              'Cadastrar Nova Disciplina',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          EscolaCartao(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Nome')),
                  DataColumn(label: Text('Carga Horária')),
                  DataColumn(label: Text('Ações')),
                ],
                rows: lista.map((d) {
                  return DataRow(
                    cells: [
                      DataCell(Text(d.id.toString())),
                      DataCell(Text(d.nome)),
                      DataCell(Text(d.cargaHoraria)),
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
                                    builder: (context) => TelaFormDisciplina(controller: _controller, disciplina: d),
                                  ),
                                );
                                _atualizar();
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                              onPressed: () {
                                _controller.excluir(d);
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