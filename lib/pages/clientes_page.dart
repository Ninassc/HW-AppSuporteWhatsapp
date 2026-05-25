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

          SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              itemCount: clientes.length,

              itemBuilder: (context, index) {
                final cliente = clientes[index];

                return SizedBox(
                  height: 150,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    color:const Color(0xFF028FCF) ,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: 
                          Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Nome: ${cliente.nome}"),
                              Text("Contato: ${cliente.whatsapp}"),
                              Text("Empresa: ${cliente.empresa}"),
                            ],
                          ),
                    ),
                  ),
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
