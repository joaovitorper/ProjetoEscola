import 'package:flutter/material.dart';
import 'package:projetoescola/models/matricula.dart';

class TelaFormMatricula extends StatefulWidget {
  final Matricula? matricula;

  const TelaFormMatricula({super.key, this.matricula});

  @override
  State<TelaFormMatricula> createState() => _TelaFormMatriculaState();
}

class _TelaFormMatriculaState extends State<TelaFormMatricula> {
  final _formKey = GlobalKey<FormState>();
  late String _aluno;
  late String _turma;
  late String _dataMatricula;

  @override
  void initState() {
    super.initState();
    if (widget.matricula != null) {
      _aluno = widget.matricula!.aluno;
      _turma = widget.matricula!.turma;
      _dataMatricula = widget.matricula!.dataMatricula;
    } else {
      _aluno = '';
      _turma = '';
      _dataMatricula = '';
    }
  }

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final novaMatricula = Matricula(
        id: widget.matricula?.id,
        aluno: _aluno,
        turma: _turma,
        dataMatricula: _dataMatricula,
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
                decoration: const InputDecoration(labelText: 'Nome do Aluno'),
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Informe o aluno' : null,
                onSaved: (value) => _aluno = value!,
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: _turma,
                decoration: const InputDecoration(labelText: 'Turma'),
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Informe a turma' : null,
                onSaved: (value) => _turma = value!,
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: _dataMatricula,
                decoration: const InputDecoration(labelText: 'Data da Matrícula (ex: 10/02/2026)'),
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Informe a data' : null,
                onSaved: (value) => _dataMatricula = value!,
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