class RegistoDiario {
  final int? idRegisto;
  final int? idCiclo;
  final String dataRegisto;
  final int nivelDor;
  final String estadoHumor;
  final String sintomasFisicos;

  RegistoDiario({
    this.idRegisto,
    this.idCiclo,
    required this.dataRegisto,
    required this.nivelDor,
    required this.estadoHumor,
    required this.sintomasFisicos,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_registo': idRegisto,
      'id_ciclo': idCiclo,
      'data_registo': dataRegisto,
      'nivel_dor': nivelDor,
      'estado_humor': estadoHumor,
      'sintomas_fisicos': sintomasFisicos,
    };
  }

  factory RegistoDiario.fromMap(Map<String, dynamic> map) {
    return RegistoDiario(
      idRegisto: map['id_registo'],
      idCiclo: map['id_ciclo'],
      dataRegisto: map['data_registo'],
      nivelDor: map['nivel_dor'],
      estadoHumor: map['estado_humor'],
      sintomasFisicos: map['sintomas_fisicos'],
    );
  }
}
