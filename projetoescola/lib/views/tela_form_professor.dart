import 'package:flutter/material.dart';
import 'package:projetoescola/controllers/professor_controller.dart';
import 'package:projetoescola/models/professor.dart';

class TelaFormProfessor extends StatefulWidget {
  final ProfessorController controller;
  final Professor? professor;

  const TelaFormProfessor({Key? key, required this.controller, this.professor}) : super(key: key);

  @override
  State<TelaFormProfessor> createState() => _TelaFormProfessorState();
}

class _TelaFormProfessorState extends State<TelaFormProfessor> {
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _telefoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.professor != null) {
      _nomeController.text = widget.professor!.nome;
      _cpfController.text = widget.professor!.cpf;
      _telefoneController.text = widget.professor!.telefone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.professor == null ? 'Novo Professor' : 'Editar Professor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _cpfController,
              decoration: const InputDecoration(labelText: 'CPF'),
              enabled: widget.professor == null,
            ),
            TextField(
              controller: _telefoneController,
              decoration: const InputDecoration(labelText: 'Telefone'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (widget.professor == null) {
                  bool sucesso = widget.controller.cadastrar(
                    _nomeController.text,
                    _cpfController.text,
                    _telefoneController.text,
                  );
                  if (!sucesso) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('CPF já cadastrado!')),
                    );
                    return;
                  }
                } else {
                  widget.controller.editar(
                    widget.professor!,
                    _nomeController.text,
                    _telefoneController.text,
                  );
                }
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}