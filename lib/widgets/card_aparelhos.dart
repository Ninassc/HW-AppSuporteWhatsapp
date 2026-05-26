import 'package:app_suporte_whatsapp/models/aparelho.dart';
import 'package:app_suporte_whatsapp/pages/historico_atendimentos_page.dart';
import 'package:flutter/material.dart';

class CardAparelhos extends StatelessWidget {
  final Aparelho aparelho;
  const CardAparelhos({super.key, required this.aparelho});

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
          ],
        ),
      ),
    );
  }
}
