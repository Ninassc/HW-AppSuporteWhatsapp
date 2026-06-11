import 'package:flutter/material.dart';

class DialogExcluirAparelho extends StatelessWidget {
  final VoidCallback excluirAparelho;
  const DialogExcluirAparelho({super.key, required this.excluirAparelho});

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
              "Todos os atendimentos relacionados a esse aparelho também serão excluídos!",
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
                        excluirAparelho();
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
