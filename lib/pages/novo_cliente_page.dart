import 'package:app_suporte_whatsapp/database/database_helper.dart';
import 'package:app_suporte_whatsapp/models/cliente.dart';
import 'package:app_suporte_whatsapp/widgets/input_novo_cliente.dart';
import 'package:flutter/material.dart';

class NovoClientePage extends StatefulWidget {
  const NovoClientePage({super.key});

  @override
  State<NovoClientePage> createState() => _NovoClientePageState();
}

class _NovoClientePageState extends State<NovoClientePage> {
  final TextEditingController controllerNome = TextEditingController();
  final TextEditingController controllerWhatsapp = TextEditingController();
  final TextEditingController controllerEmpresa = TextEditingController();

  @override
  void dispose() {
    controllerNome.dispose();
    controllerWhatsapp.dispose();
    controllerEmpresa.dispose();

    super.dispose();
  }

  void salvarCliente() async {
    if (controllerWhatsapp.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Informe o Whatsapp.")));

      return;
    }

    try {
      final db = DatabaseHelper();

      await db.insertCliente(
        Cliente(
          nome: controllerNome.text,
          whatsapp: controllerWhatsapp.text,
          empresa: controllerEmpresa.text,
        ),
      );

      controllerNome.clear();
      controllerWhatsapp.clear();
      controllerEmpresa.clear();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Salvo com Sucesso")));

    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 217, 235),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Cadastrar Novo Cliente",
                style: TextStyle(
                  color: const Color(0xFF028FCF),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
          
              SizedBox(height: 20),
          
              Container(
                width: 800,
                height: 300,
                decoration: BoxDecoration(
                  color: const Color(0xFF028FCF),
                  borderRadius: BorderRadius.circular(20),
                ),
              
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: Column(
                        spacing: 20,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputNovoCliente(
                            controller: controllerNome,
                            texto: "Nome",
                          ),
                          
                          InputNovoCliente(
                            controller: controllerWhatsapp,
                            texto: "Whatsapp",
                          ),
              
                          InputNovoCliente(
                            controller: controllerEmpresa,
                            texto: "Empresa",
                          ),
              
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 200,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    salvarCliente();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                  ),
                                  child: Text(
                                    "Adicionar",
                                    style: TextStyle(
                                      color: const Color(0xFF028FCF),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
