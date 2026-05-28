import 'package:flutter/material.dart';

class InputNovoCliente extends StatelessWidget {
  final TextEditingController controller;
  final String texto;

  const InputNovoCliente({
    super.key,
    required this.controller,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultSelectionStyle(
      child: TextField(
        controller: controller,
        
        style: const TextStyle(color: Colors.white),
    
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white),
          ),
    
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white),
          ),
    
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white, width: 2),
          ),
    
          hintText: texto,
          hintStyle: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
