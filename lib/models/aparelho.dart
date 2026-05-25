class Aparelho {
  final int? id;
  final int clienteId;
  final String numeroSerie;

  Aparelho({
    this.id,
    required this.clienteId,
    required this.numeroSerie,
  });

  factory Aparelho.fromMap(Map<String, dynamic> map) {
    return Aparelho(
      id: map['id'],
      clienteId: map['cliente_id'],
      numeroSerie: map['numero_serie'],
    );
  }
}