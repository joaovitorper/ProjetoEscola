import 'package:flutter/material.dart';
import 'package:projetoescola/controllers/turma_controller.dart';
import 'package:projetoescola/models/turma.dart';
import 'package:projetoescola/widgets/escola_cartao.dart';
import 'package:projetoescola/widgets/escola_pagina.dart';

class TelaFormTurma extends StatefulWidget {
  const TelaFormTurma({super.key, required this.controller, this.turma});
  final TurmaController controller;
  final Turma? turma;

  @override
  State<TelaFormTurma> createState() => _TelaFormTurmaState();
}

class _TelaFormTurmaState extends State<TelaFormTurma> {
  final _formKey = GlobalKey<FormState>();
  late String _nome;
  late String _disciplina;
  late String _professor;
  late String _turno;
  late int _vagas;

  @override
  void initState() {
    super.initState();
    _nome = widget.turma?.nome ?? '';
    _disciplina = widget.turma?.disciplina ?? '';
    _professor = widget.turma?.professor ?? '';
    _turno = widget.turma?.turno ?? '';
    _vagas = widget.turma?.vagas ?? 30;
  }

  @override
  Widget build(BuildContext context) {
    final editando = widget.turma != null;
    return EscolaPagina(
      titulo: editando ? 'Editar Turma' : 'Nova Turma',
      comMenu: false,
      child: EscolaCartao(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                initialValue: _nome,
                decoration: const InputDecoration(labelText: 'Nome da Turma'),
                validator: (value) => value == null || value.isEmpty ? 'Informe o nome' : null,
                onSaved: (value) => _nome = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _disciplina,
                decoration: const InputDecoration(labelText: 'Disciplina'),
                validator: (value) => value == null || value.isEmpty ? 'Informe a disciplina' : null,
                onSaved: (value) => _disciplina = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _professor,
                decoration: const InputDecoration(labelText: 'Professor'),
                validator: (value) => value == null || value.isEmpty ? 'Informe o professor' : null,
                onSaved: (value) => _professor = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _turno,
                decoration: const InputDecoration(labelText: 'Turno'),
                validator: (value) => value == null || value.isEmpty ? 'Informe o turno' : null,
                onSaved: (value) => _turno = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _vagas.toString(),
                decoration: const InputDecoration(labelText: 'Vagas'),
                keyboardType: TextInputType.number,
                validator: (value) => value == null || int.tryParse(value) == null ? 'Informe um número válido de vagas' : null,
                onSaved: (value) => _vagas = int.parse(value!),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (editando) {
                      widget.controller.editar(widget.turma!.id!, _nome, _disciplina, _professor, _turno, _vagas);
                    } else {
                      bool sucesso = widget.controller.cadastrar(_nome, _disciplina, _professor, _turno, _vagas);
                      if (!sucesso) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Já existe uma turma com este nome!')),
                        );
                        return;
                      }
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(editando ? 'Salvar Alterações' : 'Cadastrar', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}