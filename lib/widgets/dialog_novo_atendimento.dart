import 'package:app_suporte_whatsapp/widgets/dropdown_button.dart';
import 'package:app_suporte_whatsapp/widgets/input_novo_atendimento.dart';
import 'package:flutter/material.dart';

class DialogNovoAtendimento extends StatelessWidget {
  final TextEditingController controllerProblema;
  final TextEditingController controllerObservacoes;
  final TextEditingController controllerSolucao;
  final VoidCallback salvarAtendimento;

  final Function(String) onStatusChanged;

  const DialogNovoAtendimento({
    super.key,
    required this.controllerProblema,
    required this.controllerObservacoes,
    required this.controllerSolucao,
    required this.salvarAtendimento,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 650,
        height: 600,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Novo Atendimento",
              style: TextStyle(
                color: const Color(0xFF028FCF),
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 10),
            InputNovoAtendimento(
              controller: controllerProblema,
              texto: "Problema",
              linhas: 2,
            ),

            SizedBox(height: 25),

            InputNovoAtendimento(
              controller: controllerObservacoes,
              texto: "Observações",
              linhas: 5,
            ),

            SizedBox(height: 25),

            StatusDropdown(onStatusChanged: onStatusChanged),

            SizedBox(height: 25),

            InputNovoAtendimento(
              controller: controllerSolucao,
              texto: "Solução",
              linhas: 2,
            ),

            SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      salvarAtendimento();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF028FCF),
                    ),
                    child: Text(
                      "Adicionar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      controllerProblema.clear();
                      controllerObservacoes.clear();
                      controllerSolucao.clear();

                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF028FCF),
                    ),
                    child: Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
