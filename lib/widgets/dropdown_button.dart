import 'package:flutter/material.dart';

class StatusDropdown extends StatelessWidget {
  final Function(String) onStatusChanged;

  const StatusDropdown({super.key, required this.onStatusChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Status",
        labelStyle: TextStyle(
          color: const Color(0xFF028FCF),
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),

      items: const [
        DropdownMenuItem(
          value: "Em atendimento",
          child: Text("Em atendimento"),
        ),

        DropdownMenuItem(value: "Resolvido", child: Text("Resolvido")),

        DropdownMenuItem(value: "Encerrado", child: Text("Encerrado")),
      ],

      onChanged: (value) {
        onStatusChanged(value!);
      },
    );
  }
}
