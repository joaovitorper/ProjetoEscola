import 'package:flutter/material.dart';
import '../models/disciplina.dart';

class TelaFormDisciplina extends StatefulWidget {
  final Disciplina? disciplina;

  const TelaFormDisciplina({super.key, this.disciplina});

  @override
  State<TelaFormDisciplina> createState() => _TelaFormDisciplinaState();
}
class _TelaFormDisciplinaState extends State<TelaFormDisciplina> {
  final _formKey = GlobalKey<FormState>();
  late String _nome;
  late int _cargaHoraria;
  late String _ementa;

  @override
  void initState() {
    super.initState();
    if (widget.disciplina != null) {
      _nome = widget.disciplina!.nome;
      _cargaHoraria = widget.disciplina!.cargaHoraria;
      _ementa = widget.disciplina!.ementa;
    } else {
      _nome = '';
      _cargaHoraria = 60;
      _ementa = '';
    }
  }

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final novaDisciplina = Disciplina(
        id: widget.disciplina?.id,
        nome: _nome,
        cargaHoraria: _cargaHoraria,
        ementa: _ementa,
      );

      Navigator.pop(context, novaDisciplina);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.disciplina == null ? 'Nova Disciplina' : 'Editar Disciplina'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _nome,
                decoration: const InputDecoration(labelText: 'Nome da Disciplina'),
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Informe o nome' : null,
                onSaved: (value) => _nome = value!,
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: _cargaHoraria.toString(),
                decoration: const InputDecoration(labelText: 'Carga Horária (horas)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || int.tryParse(value) == null) {
                    return 'Informe um número válido';
                  }
                  return null;
                },
                onSaved: (value) => _cargaHoraria = int.parse(value!),
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: _ementa,
                decoration: const InputDecoration(labelText: 'Ementa / Descrição'),
                maxLines: 3,
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Informe a ementa' : null,
                onSaved: (value) => _ementa = value!,
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