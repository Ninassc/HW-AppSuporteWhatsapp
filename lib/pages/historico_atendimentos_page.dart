import 'dart:io';

import 'package:app_suporte_whatsapp/database/database_helper.dart';
import 'package:app_suporte_whatsapp/models/aparelho.dart';
import 'package:app_suporte_whatsapp/models/atendimento.dart';
import 'package:app_suporte_whatsapp/widgets/card_atendimento.dart';
import 'package:app_suporte_whatsapp/widgets/dialog_novo_atendimento.dart';
import 'package:app_suporte_whatsapp/widgets/dropdown_button.dart';
import 'package:app_suporte_whatsapp/widgets/input_novo_atendimento.dart';
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

  final TextEditingController _controllerProblema = TextEditingController();
  final TextEditingController _controllerObservacoes = TextEditingController();
  final TextEditingController _controllerSolucao = TextEditingController();

  String statusSelecionado = "Em atendimento";

  @override
  void dispose() {
    _controllerProblema.dispose();
    _controllerObservacoes.dispose();
    _controllerSolucao.dispose();

    super.dispose();
  }

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

  void salvarAtendimento() async {
    if (_controllerProblema.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Informe o problema.")));

      return;
    }

    final atendimento = Atendimento(
      aparelhoId: widget.aparelho.id!,
      problema: _controllerProblema.text,
      observacoes: _controllerObservacoes.text,
      status: statusSelecionado,
      solucao: _controllerSolucao.text,
      dataContato: '',
    );

    try {
      final db = DatabaseHelper();

      await db.insertAtendimento(atendimento);

      Navigator.of(context).pop();

      await carregarAtendimentos();
    } catch (e) {
      debugPrint(e.toString());
    }
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
                            return DialogNovoAtendimento(
                              controllerProblema: _controllerProblema,
                              controllerObservacoes: _controllerObservacoes,
                              controllerSolucao: _controllerSolucao,
                              salvarAtendimento: salvarAtendimento,
                              onStatusChanged: (status) {
                                setState(() {
                                  statusSelecionado = status;
                                });
                              },
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
