import 'package:app_suporte_whatsapp/models/aparelho.dart';
import 'package:flutter/material.dart';

class DialogNovoAparelho extends StatelessWidget {
  final TextEditingController controllerAparelho;
  final VoidCallback? salvarAparelhos;
  final VoidCallback? editarAparelho;

  const DialogNovoAparelho({
    super.key,
    required this.controllerAparelho,
    this.salvarAparelhos,
    this.editarAparelho,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 650,
        height: 260,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              salvarAparelhos != null ? "Novo Aparelho" : "Editar Aparelho",
              style: TextStyle(
                color: const Color(0xFF028FCF),
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DefaultSelectionStyle(
                    child: TextField(
                      controller: controllerAparelho,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hint: Text(
                          "Número de Série",
                          style: TextStyle(
                            color: const Color(0xFF028FCF),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 35),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            (salvarAparelhos ?? editarAparelho)?.call();
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
                            controllerAparelho.clear();
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
          ],
        ),
      ),
    );
  }
}
