import 'package:app_suporte_whatsapp/pages/clientes_page.dart';
import 'package:app_suporte_whatsapp/pages/novo_cliente_page.dart';
import 'package:app_suporte_whatsapp/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String paginaSelecionada = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(
            selecionarPagina: (pagina) {
              setState(() {
                paginaSelecionada = pagina;
              });
            },
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 202, 217, 235),
              child: Column(
                children: [
                  Container(
                    height: 90,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Image.asset("assets/images/logo.png"),
                      ],
                    ),
                  ),
                  Expanded(child: carregarPagina()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget carregarPagina() {
    if (paginaSelecionada == "Clientes") {
      return ClientesPage();
    }
    if (paginaSelecionada == "Novo Cliente") {
      return NovoClientePage();
    }
    return Center(child: Text("Home"));
  }
  
}

//color: const Color(0xFF028FCF)
