import 'package:app_suporte_whatsapp/widgets/card_clientes.dart';
import 'package:flutter/material.dart';
import 'package:app_suporte_whatsapp/database/database_helper.dart';
import 'package:app_suporte_whatsapp/models/cliente.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({super.key});

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  List<Cliente> clientes = [];

  final TextEditingController controllerPesquisa = TextEditingController();

  @override
  void initState() {
    super.initState();

    carregarClientes();
  }

  Future<void> carregarClientes() async {
    final db = DatabaseHelper();

    final listaClientes = await db.getClientes();

    setState(() {
      clientes = listaClientes;
    });
  }

  @override
  Widget build(BuildContext context) {
    final clientesFiltrados = clientes.where((cliente) {
      return cliente.nome.toLowerCase().contains(
            controllerPesquisa.text.toLowerCase(),
          ) ||
          cliente.whatsapp.toLowerCase().contains(
            controllerPesquisa.text.toLowerCase(),
          ) ||
          cliente.empresa.toLowerCase().contains(
            controllerPesquisa.text.toLowerCase(),
          );
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "Clientes",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF028FCF),
            ),
          ),

          SizedBox(height: 15),

          TextField(
            controller: controllerPesquisa,

            decoration: InputDecoration(
              hintText: "Nome, Contato, Empresa...",
              hintStyle: TextStyle(color: Colors.white70),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: const Color(0xFF028FCF)),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: const Color(0xFF028FCF)),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: const Color.fromARGB(255, 5, 105, 151),
                ),
              ),
            ),

            onChanged: (_) {
              setState(() {});
            },
          ),

          SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              itemCount: clientesFiltrados.length,

              itemBuilder: (context, index) {
                final cliente = clientesFiltrados[index];

                return CardClientes(
                  cliente: cliente,
                  nome: cliente.nome,
                  whatsapp: cliente.whatsapp,
                  empresa: cliente.empresa,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//const Color(0xFF028FCF)
