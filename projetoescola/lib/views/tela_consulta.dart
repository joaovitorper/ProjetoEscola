import 'package:flutter/material.dart';
import 'package:projetoescola/core/escola_ds.dart';
import 'package:projetoescola/widgets/escola_cartao.dart';
import 'package:projetoescola/widgets/escola_pagina.dart';
import 'package:projetoescola/views/tela_relatorio.dart'; // Importa a tela de relatório

class TelaConsulta extends StatefulWidget {
  const TelaConsulta({super.key});

  @override
  State<TelaConsulta> createState() => _TelaConsultaState();
}

class _TelaConsultaState extends State<TelaConsulta> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _registos = [
    {'titulo': 'Ana Souza (Matemática)', 'tipo': 'Aluno/Disciplina'},
    {'titulo': 'Pedro Lima (História)', 'tipo': 'Aluno/Disciplina'},
    {'titulo': 'Turma A - Manhã', 'tipo': 'Turma'},
    {'titulo': 'Turma B - Tarde', 'tipo': 'Turma'},
    {'titulo': 'Matemática (80h)', 'tipo': 'Disciplina'},
    {'titulo': 'História (60h)', 'tipo': 'Disciplina'},
  ];

  @override
  Widget build(BuildContext context) {
    return EscolaPagina(
      titulo: 'Consultar Registos',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Botão para abrir o relatório sem perder o contexto
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TelaRelatorio(),
                ),
              );
            },
            child: const Text(
              'Gerar Relatório',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),

          // Caixa de pesquisa
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Pesquisar registos...',
              prefixIcon: const Icon(Icons.search, color: EscolaDS.azul),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
          const SizedBox(height: 16),

          // Lista de itens em cartões
          ..._registos.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: EscolaCartao(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: EscolaDS.azul.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.check_circle_outline, color: EscolaDS.azul),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['titulo']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['tipo']!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}