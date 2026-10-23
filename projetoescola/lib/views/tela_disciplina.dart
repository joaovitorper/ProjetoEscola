import 'package:flutter/material.dart';
import 'package:projetoescola/widgets/escola_cartao.dart';
import 'package:projetoescola/widgets/escola_pagina.dart';

class TelaDisciplina extends StatelessWidget {
  const TelaDisciplina({super.key});

  @override
  Widget build(BuildContext context) {
    return const EscolaPagina(
      titulo: 'Disciplinas',
      child: EscolaCartao(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Módulo de Disciplinas'),
        ),
      ),
    );
  }
}