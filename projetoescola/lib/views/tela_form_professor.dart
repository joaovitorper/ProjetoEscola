import 'package:flutter/material.dart';
import 'package:projetoescola/controllers/professor_controller.dart';
import 'package:projetoescola/models/professor.dart';
import 'package:projetoescola/widgets/escola_cartao.dart';
import 'package:projetoescola/widgets/escola_pagina.dart';

class TelaFormProfessor extends StatefulWidget {
  const TelaFormProfessor({
    super.key,
    required this.controller,
    this.professor,
  });

  final ProfessorController controller;
  final Professor? professor;

  @override
  State<TelaFormProfessor> createState() => _TelaFormProfessorState();
}

class _TelaFormProfessorState extends State<TelaFormProfessor> {
  final _formKey = GlobalKey<FormState>();
  late String _nome;
  late String _cpf;
  late String _telefone;

  @override
  void initState() {
    super.initState();
    _nome = widget.professor?.nome ?? '';
    _cpf = widget.professor?.cpf ?? '';
    _telefone = widget.professor?.telefone ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final editando = widget.professor != null;
    return EscolaPagina(
      titulo: editando ? 'Editar Professor' : 'Novo Professor',
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
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe o nome' : null,
                onSaved: (value) => _nome = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _cpf,
                enabled: !editando, // Desativa a edição do CPF para não alterar a chave
                decoration: const InputDecoration(labelText: 'CPF'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe o CPF' : null,
                onSaved: (value) => _cpf = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _telefone,
                decoration: const InputDecoration(labelText: 'Telefone'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe o telefone' : null,
                onSaved: (value) => _telefone = value!,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Cor verde pedida
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24), // Bordas arredondadas
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (editando) {
                      widget.controller.editar(widget.professor!, _nome, _telefone);
                    } else {
                      widget.controller.cadastrar(_nome, _cpf, _telefone);
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