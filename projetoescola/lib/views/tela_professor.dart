import 'package:flutter/material.dart';
import 'package:projetoescola/controllers/professor_controller.dart';
import 'package:projetoescola/views/tela_form_professor.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Professores')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaFormProfessor(controller: _controller)),
                );
                _atualizar();
              },
              child: const Text('Cadastrar Novo Professor'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                final prof = lista[index];
                return ListTile(
                  title: Text(prof.nome),
                  subtitle: Text('CPF: ${prof.cpf} - Tel: ${prof.telefone}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TelaFormProfessor(controller: _controller, professor: prof),
                            ),
                          );
                          _atualizar();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _controller.excluir(prof);
                          _atualizar();
                        },
                      ),
                    ],
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