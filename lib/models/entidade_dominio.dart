import 'package:json_annotation/json_annotation.dart';

part 'entidade_dominio.g.dart';

@JsonSerializable(explicitToJson: true, checked: true)
class EntidadeDominio {
  final int id;
  final String nome;

  EntidadeDominio({
    required this.id,
    required this.nome,
  });

  factory EntidadeDominio.fromJson(Map<String, dynamic> json) =>
      _$EntidadeDominioFromJson(json);

  Map<String, dynamic> toJson() => _$EntidadeDominioToJson(this);
}
