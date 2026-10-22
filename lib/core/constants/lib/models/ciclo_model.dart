class Ciclo {
  final int? idCiclo;
  final String dataInicio;
  final String? dataFimPrevista;
  final int? duracaoDias;

  Ciclo({
    this.idCiclo,
    required this.dataInicio,
    this.dataFimPrevista,
    this.duracaoDias,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_ciclo': idCiclo,
      'data_inicio': dataInicio,
      'data_fim_prevista': dataFimPrevista,
      'duracao_dias': duracaoDias,
    };
  }

  factory Ciclo.fromMap(Map<String, dynamic> map) {
    return Ciclo(
      idCiclo: map['id_ciclo'],
      dataInicio: map['data_inicio'],
      dataFimPrevista: map['data_fim_prevista'],
      duracaoDias: map['duracao_dias'],
    );
  }
}
