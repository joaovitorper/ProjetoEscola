import 'package:flutter/material.dart';
import '../models/matricula.dart';

class TelaFormMatricula extends StatefulWidget {
  final Matricula? matricula;

  const TelaFormMatricula({super.key, this.matricula});

  @override
  State<TelaFormMatricula> createState() => _TelaFormMatriculaState();
}

class _TelaFormMatriculaState extends State<TelaFormMatricula> {
  final _formKey = GlobalKey<FormState>();
  late String _aluno;
  late String _disciplina;
  late DateTime _data;
  late String _situacao;

  @override
  void initState() {
    super.initState();
    if (widget.matricula != null) {
      _aluno = widget.matricula!.aluno;
      _disciplina = widget.matricula!.disciplina;
      _data = widget.matricula!.data;
      _situacao = widget.matricula!.situacao;
    } else {
      _aluno = '';
      _disciplina = '';
      _data = DateTime.now();
      _situacao = 'Ativa';
    }
  }

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final novaMatricula = Matricula(
        id: widget.matricula?.id ?? 0, // O ID real é tratado na tela anterior
        aluno: _aluno,
        disciplina: _disciplina,
        data: _data,
        situacao: _situacao,
      );

      Navigator.pop(context, novaMatricula);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.matricula == null ? 'Nova Matrícula' : 'Editar Matrícula'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _aluno,
                decoration: const InputDecoration(labelText: 'Aluno'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor, informe o nome do aluno.';
                  }
                  return null;
                },
                onSaved: (value) => _aluno = value!,
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: _disciplina,
                decoration: const InputDecoration(labelText: 'Disciplina'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor, informe a disciplina.';
                  }
                  return null;
                },
                onSaved: (value) => _disciplina = value!,
              ),
              DropdownButtonFormField<String>(
                initialValue: _situacao, // Alterado de 'value' para 'initialValue'
                decoration: const InputDecoration(labelText: 'Situação'),
                items: const [
                  DropdownMenuItem(value: 'Ativa', child: Text('Ativa')),
                  DropdownMenuItem(value: 'Trancada', child: Text('Trancada')),
                  DropdownMenuItem(value: 'Concluída', child: Text('Concluída')),
                ],
                onChanged: (value) {
                  setState(() {
                    _situacao = value!;
                  });
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _salvar,
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}