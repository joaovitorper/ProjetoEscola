import 'package:flutter/material.dart';
import '../models/turma.dart';

class TelaFormTurma extends StatefulWidget {
  final Turma? turma;

  const TelaFormTurma({super.key, this.turma});

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
    if (widget.turma != null) {
      _nome = widget.turma!.nome;
      _disciplina = widget.turma!.disciplina;
      _professor = widget.turma!.professor;
      _turno = widget.turma!.turno;
      _vagas = widget.turma!.vagas;
    } else {
      _nome = '';
      _disciplina = '';
      _professor = '';
      _turno = 'Manhã';
      _vagas = 30;
    }
  }

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final novaTurma = Turma(
        id: widget.turma?.id,
        nome: _nome,
        disciplina: _disciplina,
        professor: _professor,
        turno: _turno,
        vagas: _vagas,
      );

      Navigator.pop(context, novaTurma);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.turma == null ? 'Nova Turma' : 'Editar Turma'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _nome,
                decoration: const InputDecoration(labelText: 'Nome da Turma'),
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Informe o nome' : null,
                onSaved: (value) => _nome = value!,
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: _disciplina,
                decoration: const InputDecoration(labelText: 'Disciplina'),
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Informe a disciplina' : null,
                onSaved: (value) => _disciplina = value!,
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: _professor,
                decoration: const InputDecoration(labelText: 'Professor'),
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Informe o professor' : null,
                onSaved: (value) => _professor = value!,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: _turno,
                decoration: const InputDecoration(labelText: 'Turno'),
                items: const [
                  DropdownMenuItem(value: 'Manhã', child: Text('Manhã')),
                  DropdownMenuItem(value: 'Tarde', child: Text('Tarde')),
                  DropdownMenuItem(value: 'Noite', child: Text('Noite')),
                ],
                onChanged: (value) => setState(() => _turno = value!),
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: _vagas.toString(),
                decoration: const InputDecoration(labelText: 'Vagas'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || int.tryParse(value) == null) {
                    return 'Informe um número válido de vagas';
                  }
                  return null;
                },
                onSaved: (value) => _vagas = int.parse(value!),
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