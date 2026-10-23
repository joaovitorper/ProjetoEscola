import 'package:flutter/material.dart';
import 'package:projetoescola/controllers/disciplina_controller.dart';
import 'package:projetoescola/models/disciplina.dart';
import 'package:projetoescola/widgets/escola_cartao.dart';
import 'package:projetoescola/widgets/escola_pagina.dart';

class TelaFormDisciplina extends StatefulWidget {
  const TelaFormDisciplina({super.key, required this.controller, this.disciplina});

  final DisciplinaController controller;
  final Disciplina? disciplina;

  @override
  State<TelaFormDisciplina> createState() => _TelaFormDisciplinaState();
}

class _TelaFormDisciplinaState extends State<TelaFormDisciplina> {
  final _formKey = GlobalKey<FormState>();
  late String _nome;
  late String _cargaHoraria;

  @override
  void initState() {
    super.initState();
    _nome = widget.disciplina?.nome ?? '';
    _cargaHoraria = widget.disciplina?.cargaHoraria ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final editando = widget.disciplina != null;
    return EscolaPagina(
      titulo: editando ? 'Editar Disciplina' : 'Nova Disciplina',
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
                decoration: const InputDecoration(labelText: 'Nome da Disciplina'),
                validator: (value) => value == null || value.isEmpty ? 'Informe o nome' : null,
                onSaved: (value) => _nome = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _cargaHoraria,
                decoration: const InputDecoration(labelText: 'Carga Horária'),
                validator: (value) => value == null || value.isEmpty ? 'Informe a carga horária' : null,
                onSaved: (value) => _cargaHoraria = value!,
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
                      widget.controller.editar(widget.disciplina!.id!, _nome, _cargaHoraria);
                    } else {
                      widget.controller.cadastrar(_nome, _cargaHoraria);
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