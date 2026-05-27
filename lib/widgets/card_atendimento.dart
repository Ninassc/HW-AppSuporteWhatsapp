import 'package:app_suporte_whatsapp/models/atendimento.dart';
import 'package:flutter/material.dart';

class CardAtendimento extends StatelessWidget {
  final Atendimento atendimento;
  const CardAtendimento({super.key, required this.atendimento});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Row(
          spacing: 20,
          children: [
            const Icon(Icons.hourglass_empty_rounded),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  "Problema: ${atendimento.problema}",
                  style: TextStyle(color: Colors.black),
                ),

                Text(
                  "Observações: ${atendimento.observacoes}",
                  style: TextStyle(color: Colors.black),
                ),

                Text(
                  "Status: ${atendimento.status}",
                  style: TextStyle(color: Colors.black),
                ),

                if (atendimento.solucao != null && atendimento.solucao!.isNotEmpty)
                  Text(
                    "Solução: ${atendimento.solucao}",
                    style: TextStyle(color: Colors.black),
                  ),

                Text(
                  "Data Contato: ${atendimento.dataContato}",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
