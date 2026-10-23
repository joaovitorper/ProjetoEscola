import 'package:flutter/material.dart';
import 'package:projetoescola/widgets/escola_cartao.dart';
import 'package:projetoescola/widgets/escola_pagina.dart';

class TelaMatricula extends StatelessWidget {
  const TelaMatricula({super.key});

  @override
  Widget build(BuildContext context) {
    return const EscolaPagina(
      titulo: 'Matrículas',
      child: EscolaCartao(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Módulo de Matrículas'),
        ),
      ),
    );
  }
}