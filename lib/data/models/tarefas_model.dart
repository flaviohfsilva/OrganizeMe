import 'dart:ui';

class TarefasModel {
  final int? id;
  final String nome;
  final String? nomeTag;
  final String? corTarefa;
  final String? corTag;
  final bool? status;
  final DateTime dataHora;
  final bool? ativo;
  final bool habito;
  final DateTime? tempoInicio;
  final DateTime? tempoFinal;
  final int? idHabito;

  TarefasModel({
    this.id,
    required this.nome,
    this.nomeTag,
    this.corTarefa,
    this.corTag,
    this.status,
    required this.dataHora,
    this.ativo,
    required this.habito,
    this.tempoInicio,
    this.tempoFinal,
    this.idHabito,
  });

  factory TarefasModel.fromMap(Map<String, dynamic> map) {
    return TarefasModel(
      id: map['id'],
      nome: map['nome'] ,
      corTarefa: map['corTarefa'],
      nomeTag: map['nomeTag'],
      corTag: map['corTag'],
      status: map['status'] == 1,
      dataHora: DateTime.parse(map['dataHora']),
      ativo: map['ativo'] == 1,
      habito: map['habito'] == 1,
      tempoInicio: map['tempoInicio'] != null ? DateTime.parse(map['tempoInicio']) : null,
      tempoFinal: map['tempoFinal'] != null ? DateTime.parse(map['tempoFinal']) : null,
      idHabito: map['idHabito'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "nome": nome.toString(),
      "nomeTag": nomeTag.toString(),
      "corTarefa": corTarefa.toString(),
      "corTag": corTag.toString(),
      "dataHora": dataHora.toIso8601String(),
      "habito": habito,
      "tempoInicio": tempoInicio?.toIso8601String() ?? null,
      "tempoFinal": tempoFinal?.toIso8601String() ?? null,
    };
  }

  TarefasModel copyWith({
    int? id,
    String? nome,
    String? nomeTag,
    String? corTarefa,
    String? corTag,
    bool? status,
    DateTime? dataHora,
    bool? ativo,
    bool? habito,
    DateTime? tempoInicio,
    DateTime? tempoFinal,
    int? idHabito,
  }) {
    return TarefasModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      corTarefa: corTarefa ?? this.corTarefa,
      nomeTag: nomeTag ?? this.nomeTag,
      corTag: corTag ?? this.corTag,
      status: status ?? this.status,
      dataHora: dataHora ?? this.dataHora,
      ativo: ativo ?? this.ativo,
      habito: habito ?? this.habito,
      tempoInicio: tempoInicio ?? this.tempoInicio,
      tempoFinal: tempoFinal ?? this.tempoFinal,
      idHabito: idHabito ?? this.idHabito,
    );
  }
}
