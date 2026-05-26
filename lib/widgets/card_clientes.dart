import 'package:app_suporte_whatsapp/pages/cliente_detalhes_page.dart';
import '../models/cliente.dart';
import 'package:flutter/material.dart';

class CardClientes extends StatelessWidget {
  final Cliente cliente;
  final String nome;
  final String whatsapp;
  final String empresa;

  const CardClientes({
    super.key,
    required this.cliente,
    required this.nome,
    required this.whatsapp,
    required this.empresa,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        color: const Color(0xFF028FCF),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nome: $nome"),
                  Text("Contato: $whatsapp"),
                  Text("Empresa: $empresa"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClienteDetalhesPage(cliente: cliente),
                      ),
                    );
                  },
                  child: Text("Ver Detalhes"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
