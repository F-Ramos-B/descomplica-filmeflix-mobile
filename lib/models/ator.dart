import 'package:shop/models/entidade_dominio.dart';

import 'package:json_annotation/json_annotation.dart';

part 'ator.g.dart';

@JsonSerializable(explicitToJson: true)
class Ator extends EntidadeDominio {
  final String sobrenome;
  final String biografia;
  final String dataNascimento;
  final String textoSelect;
  final int idade;
  final String nomeCompleto;

  Ator({
    required super.id,
    required super.nome,
    required this.sobrenome,
    required this.biografia,
    required this.dataNascimento,
    required this.idade,
    required this.textoSelect,
    required this.nomeCompleto,
  });

  factory Ator.fromJson(Map<String, dynamic> json) => _$AtorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AtorToJson(this);
}
