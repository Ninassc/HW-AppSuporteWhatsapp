class Cliente {
  final int? id;
  final String nome;
  final String whatsapp;
  final String empresa;

  Cliente({
    this.id,
    required this.nome,
    required this.whatsapp,
    required this.empresa,
  });

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      id: map['id'],
      nome: map['nome'],
      whatsapp: map['whatsapp'],
      empresa: map['empresa'],
    );
  }
}