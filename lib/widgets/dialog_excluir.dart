import 'package:flutter/material.dart';

class DialogExcluir extends StatelessWidget {
  final VoidCallback? excluirAparelho;
  final VoidCallback? excluirCliente;

  const DialogExcluir({super.key, this.excluirAparelho, this.excluirCliente});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 650,
        height: 220,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Deseja mesmo excluir?",
              style: TextStyle(
                color: const Color(0xFF028FCF),
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Text(
              excluirAparelho != null
                  ? "Todos os atendimentos relacionados a esse aparelho também serão excluídos!"
                  : "Todos os atendimentos e aparelhos relacionados a esse cliente também serão excluídos!",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),

            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        (excluirAparelho ?? excluirCliente)?.call();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF028FCF),
                      ),
                      child: Text("Sim", style: TextStyle(color: Colors.white)),
                    ),
                  ),

                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF028FCF),
                      ),
                      child: Text("Não", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
