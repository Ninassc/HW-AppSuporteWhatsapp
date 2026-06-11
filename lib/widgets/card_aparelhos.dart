import 'package:app_suporte_whatsapp/models/aparelho.dart';
import 'package:app_suporte_whatsapp/pages/historico_atendimentos_page.dart';
import 'package:app_suporte_whatsapp/widgets/dialog_excluir.dart';
import 'package:app_suporte_whatsapp/widgets/dialog_novo_aparelho.dart';
import 'package:flutter/material.dart';

class CardAparelhos extends StatelessWidget {
  final Aparelho aparelho;
  final TextEditingController controllerAparelhoAtualizado;
  final VoidCallback editarAparelho;
  final VoidCallback excluirAparelho;

  const CardAparelhos({
    super.key,
    required this.aparelho,
    required this.controllerAparelhoAtualizado,
    required this.editarAparelho,
    required this.excluirAparelho
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Row(
          children: [
            const Icon(Icons.devices),

            const SizedBox(width: 15),

            Expanded(
              child: Text(
                aparelho.numeroSerie,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        HistoricoAtendimentosPage(aparelho: aparelho),
                  ),
                );
              },
              child: const Text("Ver Histórico"),
            ),

            const SizedBox(width: 15),

            ElevatedButton.icon(
              onPressed: () {
                controllerAparelhoAtualizado.text = aparelho.numeroSerie;

                showDialog(
                  context: context,
                  builder: (context) {
                    return DialogNovoAparelho(
                      controllerAparelho: controllerAparelhoAtualizado,
                      editarAparelho: editarAparelho,
                    );
                  },
                );
              },
              label: Text("Editar"),
              icon: Icon(Icons.edit),
            ),
            const SizedBox(width: 15),

            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DialogExcluir(excluirAparelho: excluirAparelho,);
                  },
                );
              },
              label: Text("Excluir"),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
