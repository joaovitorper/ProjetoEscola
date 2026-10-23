import 'package:flutter/material.dart';
import 'package:projetoescola/controllers/matricula_controller.dart';
import 'package:projetoescola/models/matricula.dart';
import 'package:projetoescola/widgets/escola_cartao.dart';
import 'package:projetoescola/widgets/escola_pagina.dart';

class TelaFormMatricula extends StatefulWidget {
  const TelaFormMatricula({
    super.key,
    required this.controller,
    this.matricula,
  });

  final MatriculaController controller;
  final Matricula? matricula;

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
    _aluno = widget.matricula?.aluno ?? '';
    _turma = widget.matricula?.turma ?? '';
    _dataMatricula = widget.matricula?.dataMatricula ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final editando = widget.matricula != null;
    return EscolaPagina(
      titulo: editando ? 'Editar Matrícula' : 'Nova Matrícula',
      comMenu: false,
      child: EscolaCartao(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                initialValue: _aluno,
                decoration: const InputDecoration(labelText: 'Aluno'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe o aluno' : null,
                onSaved: (value) => _aluno = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _turma,
                decoration: const InputDecoration(labelText: 'Turma'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe a turma' : null,
                onSaved: (value) => _turma = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _dataMatricula,
                decoration: const InputDecoration(labelText: 'Data da Matrícula'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe a data' : null,
                onSaved: (value) => _dataMatricula = value!,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (editando) {
                      widget.controller.editar(
                        widget.matricula!.id!,
                        _aluno,
                        _turma,
                        _dataMatricula,
                      );
                    } else {
                      widget.controller.cadastrar(_aluno, _turma, _dataMatricula);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  editando ? 'Salvar Alterações' : 'Cadastrar',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}