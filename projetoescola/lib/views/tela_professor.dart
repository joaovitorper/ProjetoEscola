import 'package:flutter/material.dart';
import '../models/professor.dart';

class TelaFormProfessor extends StatefulWidget {
  // Se vier um professor, é edição. Se vier null, é cadastro.
  final Professor? professor;

  const TelaFormProfessor({super.key, this.professor});

  @override
  State<TelaFormProfessor> createState() => _TelaFormProfessorState();
}

class _TelaFormProfessorState extends State<TelaFormProfessor> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nomeCtrl;
  late final TextEditingController _emailCtrl;
  late final TextEditingController _disciplinaCtrl;
  late final TextEditingController _telefoneCtrl;

  bool get _editando => widget.professor != null;

  @override
  void initState() {
    super.initState();
    final p = widget.professor;
    _nomeCtrl = TextEditingController(text: p?.nome ?? '');
    _emailCtrl = TextEditingController(text: p?.email ?? '');
    _disciplinaCtrl = TextEditingController(text: p?.disciplina ?? '');
    _telefoneCtrl = TextEditingController(text: p?.telefone ?? '');
  }

  @override
  void dispose() {
    _nomeCtrl.dispose();
    _emailCtrl.dispose();
    _disciplinaCtrl.dispose();
    _telefoneCtrl.dispose();
    super.dispose();
  }

  void _salvar() {
    if (!_formKey.currentState!.validate()) return;

    final professor = Professor(
      id: widget.professor?.id ?? 0, // id 0 = novo; a lista define o id real
      nome: _nomeCtrl.text.trim(),
      email: _emailCtrl.text.trim(),
      disciplina: _disciplinaCtrl.text.trim(),
      telefone: _telefoneCtrl.text.trim(),
    );

    // Devolve o professor para a tela que abriu o formulário.
    Navigator.pop(context, professor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_editando ? 'Editar professor' : 'Novo professor'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nomeCtrl,
              decoration: const InputDecoration(labelText: 'Nome'),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Informe o nome' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _emailCtrl,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'E-mail'),
              validator: (v) =>
                  (v == null || !v.contains('@')) ? 'E-mail inválido' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _disciplinaCtrl,
              decoration: const InputDecoration(labelText: 'Disciplina'),
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Informe a disciplina'
                  : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _telefoneCtrl,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'Telefone'),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _salvar,
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}