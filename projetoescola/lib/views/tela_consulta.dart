import 'package:flutter/material.dart';

class TelaConsulta extends StatefulWidget {
  const TelaConsulta({super.key});

  @override
  State<TelaConsulta> createState() => _TelaConsultaState();
}

class _TelaConsultaState extends State<TelaConsulta> {
  // Lista geral de exemplo (pode adaptar para buscar alunos, turmas ou disciplinas)
  final List<String> _itensGerais = [
    'Ana Souza (Matemática)',
    'Pedro Lima (História)',
    'Turma A - Manhã',
    'Turma B - Tarde',
    'Matemática (80h)',
    'História (60h)',
  ];

  String _termoBusca = '';

  @override
  Widget build(BuildContext context) {
    // Filtra os itens com base no texto digitado
    final itensFiltrados = _itensGerais
        .where((item) => item.toLowerCase().contains(_termoBusca.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Consultar Registos')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Pesquisar...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (valor) {
                setState(() {
                  _termoBusca = valor;
                });
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: itensFiltrados.isEmpty
                  ? const Center(child: Text('Nenhum registo encontrado'))
                  : ListView.builder(
                      itemCount: itensFiltrados.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.check_circle_outline),
                            title: Text(itensFiltrados[index]),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}