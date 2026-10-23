import 'package:flutter/material.dart';
import 'package:projetoescola/controllers/professor_controller.dart';
import 'package:projetoescola/views/tela_form_professor.dart';
import 'package:projetoescola/widgets/escola_cartao.dart';
import 'package:projetoescola/widgets/escola_pagina.dart';

class TelaProfessor extends StatefulWidget {
  const TelaProfessor({Key? key}) : super(key: key);

  @override
  State<TelaProfessor> createState() => _TelaProfessorState();
}

class _TelaProfessorState extends State<TelaProfessor> {
  final ProfessorController _controller = ProfessorController();

  void _atualizar() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final lista = _controller.listar();
    return EscolaPagina(
      titulo: 'Lista de Professores',
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
                MaterialPageRoute(builder: (context) => TelaFormProfessor(controller: _controller)),
              );
              _atualizar();
            },
            child: const Text(
              'Cadastrar Novo Professor',
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
                  DataColumn(label: Text('CPF')),
                  DataColumn(label: Text('Ações')),
                ],
                rows: lista.map((prof) {
                  return DataRow(
                    cells: [
                      DataCell(Text(prof.id.toString())),
                      DataCell(Text(prof.nome)),
                      DataCell(Text(prof.cpf)),
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
                                    builder: (context) => TelaFormProfessor(
                                      controller: _controller,
                                      professor: prof,
                                    ),
                                  ),
                                );
                                _atualizar();
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                              onPressed: () {
                                _controller.excluir(prof);
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