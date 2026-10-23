import 'package:flutter/material.dart';
import 'package:projetoescola/controllers/matricula_controller.dart';
import 'package:projetoescola/views/tela_form_matricula.dart';
import 'package:projetoescola/widgets/escola_cartao.dart';
import 'package:projetoescola/widgets/escola_pagina.dart';

class TelaMatricula extends StatefulWidget {
  const TelaMatricula({super.key});

  @override
  State<TelaMatricula> createState() => _TelaMatriculaState();
}

class _TelaMatriculaState extends State<TelaMatricula> {
  final MatriculaController _controller = MatriculaController();

  void _atualizar() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final lista = _controller.listar();
    return EscolaPagina(
      titulo: 'Lista de Matrículas',
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
                  builder: (context) => TelaFormMatricula(controller: _controller),
                ),
              );
              _atualizar();
            },
            child: const Text(
              'Cadastrar Nova Matrícula',
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
                  DataColumn(label: Text('Aluno')),
                  DataColumn(label: Text('Turma')),
                  DataColumn(label: Text('Data')),
                  DataColumn(label: Text('Ações')),
                ],
                rows: lista.map((m) {
                  return DataRow(
                    cells: [
                      DataCell(Text(m.id.toString())),
                      DataCell(Text(m.aluno)),
                      DataCell(Text(m.turma)),
                      DataCell(Text(m.dataMatricula)),
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
                                    builder: (context) => TelaFormMatricula(controller: _controller, matricula: m),
                                  ),
                                );
                                _atualizar();
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                              onPressed: () {
                                _controller.excluir(m);
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