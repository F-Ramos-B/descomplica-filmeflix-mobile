import 'package:shop/models/entidade_dominio.dart';

import 'package:json_annotation/json_annotation.dart';

part 'ator.g.dart';

@JsonSerializable(explicitToJson: true, checked: true)
class Ator extends EntidadeDominio {
  final String sobrenome;
  String? biografia;
  final String dataNascimento;
  final String textoSelect;
  final int idade;
  final String nomeCompleto;

  Ator({
    required super.id,
    required super.nome,
    required this.sobrenome,
    this.biografia,
    required this.dataNascimento,
    required this.idade,
    required this.textoSelect,
    required this.nomeCompleto,
  });

  factory Ator.fromJson(Map<String, dynamic> json) => _$AtorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AtorToJson(this);
}
