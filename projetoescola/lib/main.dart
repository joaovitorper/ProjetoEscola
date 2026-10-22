import 'package:flutter/material.dart';
import 'package:projetoescola/views/tela_login.dart';

void main() {
  runApp(const EscolaApp());
}

class EscolaApp extends StatelessWidget {
  const EscolaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema Escolar',
      debugShowCheckedModeBanner: false,
      home: const TelaLogin(),
    );
  }
}