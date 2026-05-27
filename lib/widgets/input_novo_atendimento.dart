import 'package:flutter/material.dart';

class InputNovoAtendimento extends StatelessWidget {
  final TextEditingController controller;
  final String texto;
  final int linhas;

  const InputNovoAtendimento({
    super.key,
    required this.controller,
    required this.texto,
    required this.linhas
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultSelectionStyle(
          selectionColor: const Color.fromARGB(255, 162, 201, 233),
          child: TextField(
            controller: controller,
            maxLines: linhas,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hint: Text(
                texto,
                style: TextStyle(
                  color: const Color(0xFF028FCF),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
