class DefinicoesUtilizador {
  final int? idUtilizador;
  final int duracaoMediaCiclo;
  final String pinHash;
  final bool biometriaAtiva;
  final bool modoDiscreto;

  DefinicoesUtilizador({
    this.idUtilizador,
    required this.duracaoMediaCiclo,
    required this.pinHash,
    required this.biometriaAtiva,
    required this.modoDiscreto,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_utilizador': idUtilizador,
      'duracao_media_ciclo': duracaoMediaCiclo,
      'pin_hash': pinHash,
      'biometria_ativa': biometriaAtiva ? 1 : 0,
      'modo_discreto': modoDiscreto ? 1 : 0,
    };
  }

  factory DefinicoesUtilizador.fromMap(Map<String, dynamic> map) {
    return DefinicoesUtilizador(
      idUtilizador: map['id_utilizador'],
      duracaoMediaCiclo: map['duracao_media_ciclo'],
      pinHash: map['pin_hash'],
      biometriaAtiva: map['biometria_ativa'] == 1,
      modoDiscreto: map['modo_discreto'] == 1,
    );
  }
}
