class Atendimento {
  final int? id;
  final int aparelhoId;
  final String problema;
  final String observacoes;
  final String status;
  final String? solucao;
  final String dataContato;

  Atendimento({
    this.id,
    required this.aparelhoId,
    required this.problema,
    required this.observacoes,
    required this.status,
    this.solucao,
    required this.dataContato,
  });

  factory Atendimento.fromMap(Map<String, dynamic> map) {
    return Atendimento(
      id: map['id'],
      aparelhoId: map['aparelho_id'],
      problema: map['problema'],
      observacoes: map['observacoes'] ?? '',
      status: map['status'] ?? '',
      solucao: map['solucao'],
      dataContato: map['data_contato'],
    );
  }
}