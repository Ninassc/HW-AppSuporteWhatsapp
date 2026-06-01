import 'package:app_suporte_whatsapp/database/database_helper.dart';
import 'package:app_suporte_whatsapp/pages/clientes_page.dart';
import 'package:app_suporte_whatsapp/pages/novo_cliente_page.dart';
import 'package:app_suporte_whatsapp/widgets/card_home.dart';
import 'package:app_suporte_whatsapp/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String paginaSelecionada = "Home";

  int totalClientes = 0;
  int totalAparelhos = 0;
  int totalAtendimentos = 0;

  @override
  void initState() {
    super.initState();
    carregarTotais();
  }

  Future<void> carregarTotais() async {
    final db = DatabaseHelper();

    final totais = await Future.wait([
      db.getTotalClientes(),
      db.getTotalAparelhos(),
      db.getTotalAtendimentos(),
    ]);

    if (!mounted) return;

    setState(() {
      totalClientes = totais[0];
      totalAparelhos = totais[1];
      totalAtendimentos = totais[2];
    });
  }

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

  Widget homeContent() {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 217, 235),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Bem-vindo ao sistema de Suporte",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF028FCF),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                spacing: 20,
                children: [
                  Expanded(
                    child: CardHome(
                      titulo: "Clientes",
                      total: totalClientes,
                      paginaSelecionada: (pagina) {
                        setState(() {
                          paginaSelecionada = pagina;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CardHome(titulo: "Aparelhos", total: totalAparelhos),
                  ),
                  Expanded(
                    child: CardHome(
                      titulo: "Atendimentos",
                      total: totalAparelhos,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
    return homeContent();
  }
}

//color: const Color(0xFF028FCF)
