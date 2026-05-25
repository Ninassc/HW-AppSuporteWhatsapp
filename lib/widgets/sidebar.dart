import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  final Function(String) selecionarPagina;
  const SideBar({super.key, required this.selecionarPagina});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: const Color(0xFF028FCF),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Registro Atendimentos",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: 5),
              children: [
                SizedBox(height: 30),
                ListTile(
                  leading: Icon(Icons.home, color: Colors.white),
                  title: Text("Home", style: TextStyle(color: Colors.white)),
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () {
                    selecionarPagina("Home");
                  },
                  // onTap: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomePage()),
                  // ),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.white),
                  title: Text(
                    "Clientes",
                    style: TextStyle(color: Colors.white),
                  ),
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () {
                    selecionarPagina("Clientes");
                  },
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.add, color: Colors.white),
                  title: Text(
                    "Novo Cliente",
                    style: TextStyle(color: Colors.white),
                  ),
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () {
                    selecionarPagina("Novo Cliente");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
