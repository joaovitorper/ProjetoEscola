import 'package:projetoescola/models/consulta.dart';

class ConsultaController {
  List<ConsultaItem> pesquisar({required String categoria, required String termo}) {
    if (termo.trim().isEmpty) {
      return [
        ConsultaItem(
          titulo: 'Aviso',
          detalhes: 'Introduza um termo para pesquisar.',
        ),
      ];
    }

    // Exemplo de resultados estruturados para a busca
    return [
      ConsultaItem(
        titulo: 'Resultado 1 ($categoria)',
        detalhes: 'Correspondente ao termo "$termo"',
      ),
      ConsultaItem(
        titulo: 'Resultado 2 ($categoria)',
        detalhes: 'Outro registo encontrado para "$termo"',
      ),
    ];
  }
}