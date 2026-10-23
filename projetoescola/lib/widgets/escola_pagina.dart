import 'package:flutter/material.dart';
import 'package:projetoescola/core/escola_ds.dart';

import '../views/tela_aluno.dart';
import '../views/tela_consulta.dart';
import '../views/tela_disciplina.dart';
import '../views/tela_home.dart';
import '../views/tela_login.dart';
import '../views/tela_matricula.dart';
import '../views/tela_professor.dart';
import '../views/tela_turma.dart';
import 'escola_rodape.dart';

class EscolaPagina extends StatelessWidget {
  const EscolaPagina({
    super.key,
    required this.titulo,
    required this.child,
    this.comMenu = true,
  });

  final String titulo;
  final Widget child;
  final bool comMenu;

  void _ir(BuildContext context, Widget tela) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => tela),
    );
  }

  Widget _menu(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: EscolaDS.azul),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Direção Demonstração (Direcao)',
                style: TextStyle(color: EscolaDS.superficie),
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () => _ir(context, const TelaHome()),
          ),
          ListTile(
            title: const Text('Alunos'),
            onTap: () => _ir(context, const TelaAlunos()),
          ),
          ListTile(
            title: const Text('Professores'),
            onTap: () => _ir(context, const TelaProfessor()),
          ),
          ListTile(
            title: const Text('Turmas'),
            onTap: () => _ir(context, const TelaTurma()),
          ),
          ListTile(
            title: const Text('Disciplinas'),
            onTap: () => _ir(context, const TelaDisciplina()),
          ),
          ListTile(
            title: const Text('Matrículas'),
            onTap: () => _ir(context, const TelaMatricula()),
          ),
          ListTile(
            title: const Text('Consultas'),
            onTap: () => _ir(context, const TelaConsulta()),
          ),
          ListTile(
            title: const Text('Sair'),
            onTap: () => _ir(context, const TelaLogin()),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EscolaDS.fundo,
      appBar: AppBar(
        backgroundColor: EscolaDS.azul,
        foregroundColor: EscolaDS.superficie,
        title: Text(titulo),
      ),
      drawer: comMenu ? _menu(context) : null,
      bottomNavigationBar: const EscolaRodape(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}