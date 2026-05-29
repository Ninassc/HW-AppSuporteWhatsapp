import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  final String titulo;
  final int total;

  const CardHome({
    super.key,
    required this.titulo,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 6,
        color: const Color(0xFF028FCF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      
        child: Padding(
          padding: const EdgeInsets.all(20),
      
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
      
            children: [
      
              Text(
                titulo,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
      
              const SizedBox(height: 10),
      
              Text(
                total.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}