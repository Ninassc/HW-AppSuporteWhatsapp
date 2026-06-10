import 'package:app_suporte_whatsapp/models/atendimento.dart';
import 'package:app_suporte_whatsapp/widgets/dialog_novo_atendimento.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardAtendimento extends StatefulWidget {
  final Atendimento atendimento;
  final TextEditingController? controllerProblema;
  final TextEditingController? controllerObservacoes;
  final TextEditingController? controllerSolucao;
  final VoidCallback? atualizarAtendimento;

  const CardAtendimento({
    super.key,
    required this.atendimento,
    this.controllerProblema,
    this.controllerObservacoes,
    this.controllerSolucao,
    this.atualizarAtendimento,
  });

  @override
  State<CardAtendimento> createState() => _CardAtendimentoState();
}

class _CardAtendimentoState extends State<CardAtendimento> {
  @override
  Widget build(BuildContext context) {
    final data = DateTime.parse(widget.atendimento.dataContato);

    String statusSelecionado = widget.atendimento.status;

    return SafeArea(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            spacing: 20,
            children: [
              const Icon(Icons.hourglass_empty_rounded),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      "Problema: ${widget.atendimento.problema}",
                      style: TextStyle(color: Colors.black),
                    ),

                    Text(
                      "Observações: ${widget.atendimento.observacoes}",
                      style: TextStyle(color: Colors.black),
                    ),

                    Text(
                      "Status: ${widget.atendimento.status}",
                      style: TextStyle(color: Colors.black),
                    ),

                    if (widget.atendimento.solucao != null &&
                        widget.atendimento.solucao!.isNotEmpty)
                      Text(
                        "Solução: ${widget.atendimento.solucao}",
                        style: TextStyle(color: Colors.black),
                      ),

                    Text(
                      "Data Contato: ${DateFormat('dd/MM/yyyy HH:mm').format(data)}",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  if (widget.controllerProblema != null &&
                      widget.controllerObservacoes != null &&
                      widget.controllerSolucao != null)
                    ElevatedButton.icon(
                      onPressed: () {
                        widget.controllerProblema!.text =
                            widget.atendimento.problema;

                        widget.controllerObservacoes!.text =
                            widget.atendimento.observacoes;

                        widget.controllerSolucao!.text =
                            widget.atendimento.solucao ?? '';

                        showDialog(
                          context: context,
                          builder: (context) {
                            return DialogNovoAtendimento(
                              controllerProblema: widget.controllerProblema!,
                              controllerObservacoes:
                                  widget.controllerObservacoes!,
                              controllerSolucao: widget.controllerSolucao!,
                              atualizarAtendimento: widget.atualizarAtendimento,
                              onStatusChanged: (status) {
                                setState(() {
                                  statusSelecionado = status;
                                });
                              },
                            );
                          },
                        );
                      },
                      label: Text("Editar"),
                      icon: Icon(Icons.edit),
                    ),

                  SizedBox(height: 20),

                  ElevatedButton.icon(
                    onPressed: () {},
                    label: Text("Excluir"),
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
