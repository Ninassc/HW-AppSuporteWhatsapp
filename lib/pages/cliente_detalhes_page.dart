import 'package:app_suporte_whatsapp/database/database_helper.dart';
import 'package:app_suporte_whatsapp/models/aparelho.dart';
import 'package:app_suporte_whatsapp/widgets/card_aparelhos.dart';
import 'package:flutter/material.dart';
import '../models/cliente.dart';

class ClienteDetalhesPage extends StatefulWidget {
  final Cliente cliente;
  const ClienteDetalhesPage({super.key, required this.cliente});

  @override
  State<ClienteDetalhesPage> createState() => _ClienteDetalhesPageState();
}

class _ClienteDetalhesPageState extends State<ClienteDetalhesPage> {
  List<Aparelho> aparelhos = [];

  @override
  void initState() {
    super.initState();

    carregarAparelhos();
  }

  Future<void> carregarAparelhos() async {
    final db = DatabaseHelper();

    final listaAparelhos = await db.getAparelhosCliente(widget.cliente.id!);

    setState(() {
      aparelhos = listaAparelhos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes"),
        backgroundColor: const Color(0xFF028FCF),
        toolbarHeight: 90,
      ),

      body: Padding(
        padding: const EdgeInsets.all(30.0),

        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF028FCF),
            borderRadius: BorderRadius.circular(20),
          ),

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Row(
                  spacing: 25,
                  children: [
                    SelectableText(
                      "Nome : ${widget.cliente.nome}",
                      selectionColor: Colors.white24,
                    ),
                    SelectableText(
                      "Contato : ${widget.cliente.whatsapp}",
                      selectionColor: Colors.white24,
                    ),
                    SelectableText(
                      "Empresa : ${widget.cliente.empresa}",
                      selectionColor: Colors.white24,
                    ),
                  ],
                ),
                Text(
                  "Aparelhos:",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: aparelhos.length,

                    itemBuilder: (context, index) {
                      final aparelho = aparelhos[index];
                      return CardAparelhos(aparelho: aparelho);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
