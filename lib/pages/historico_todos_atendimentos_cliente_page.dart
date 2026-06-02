import 'package:app_suporte_whatsapp/database/database_helper.dart';
import 'package:app_suporte_whatsapp/models/atendimento.dart';
import 'package:app_suporte_whatsapp/models/cliente.dart';
import 'package:app_suporte_whatsapp/widgets/card_atendimento.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HistoricoTodosAtendimentosClientePage extends StatefulWidget {
  final Cliente cliente;

  const HistoricoTodosAtendimentosClientePage({
    super.key,
    required this.cliente,
  });

  @override
  State<HistoricoTodosAtendimentosClientePage> createState() =>
      _HistoricoTodosAtendimentosClientePageState();
}

class _HistoricoTodosAtendimentosClientePageState
    extends State<HistoricoTodosAtendimentosClientePage> {
  List<Atendimento> atendimentosCliente = [];

  @override
  void initState() {
    super.initState();

    carregarAtendimentos();
  }

  Future<void> carregarAtendimentos() async {
    try {
      final db = DatabaseHelper();

      final listaAtendimentos = await db.getAtendimentosCliente(
        widget.cliente.id!,
      );

      setState(() {
        atendimentosCliente = listaAtendimentos;
      });
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Histórico de Todos os Atendimentos"),
        backgroundColor: const Color(0xFF028FCF),
        toolbarHeight: 90,
      ),

      body: Padding(
        padding: EdgeInsets.all(30),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF028FCF),
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  "Históricos:",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: atendimentosCliente.length,
                    itemBuilder: (context, index) {
                      Atendimento atendimento = atendimentosCliente[index];

                      return CardAtendimento(atendimento: atendimento);
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
