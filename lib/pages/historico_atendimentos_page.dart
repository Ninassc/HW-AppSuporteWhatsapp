import 'package:app_suporte_whatsapp/database/database_helper.dart';
import 'package:app_suporte_whatsapp/models/aparelho.dart';
import 'package:app_suporte_whatsapp/models/atendimento.dart';
import 'package:app_suporte_whatsapp/widgets/card_atendimento.dart';
import 'package:flutter/material.dart';

class HistoricoAtendimentosPage extends StatefulWidget {
  final Aparelho aparelho;
  const HistoricoAtendimentosPage({super.key, required this.aparelho});

  @override
  State<HistoricoAtendimentosPage> createState() =>
      _HistoricoAtendimentosPageState();
}

class _HistoricoAtendimentosPageState extends State<HistoricoAtendimentosPage> {
  List<Atendimento> atendimentos = [];

  @override
  void initState() {
    super.initState();

    carregarAtendimentos();
  }

  Future<void> carregarAtendimentos() async {
    final db = DatabaseHelper();

    final listaAtendimentos = await db.getAtendimentosAparelho(
      widget.aparelho.id!,
    );

    setState(() {
      atendimentos = listaAtendimentos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Histórico Atendimentos"),
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
                Text(
                  widget.aparelho.numeroSerie,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: atendimentos.length,

                    itemBuilder: (context, index) {
                      final atendimento = atendimentos[index];

                      return CardAtendimento(atendimento: atendimento);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                width: 650,
                                height: 600,
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [Text("Novo Atendimento",
                                  style: TextStyle(
                                    color: const Color(0xFF028FCF),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                  ),)],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
