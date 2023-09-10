import 'package:shop/models/entidade_dominio.dart';

import 'package:json_annotation/json_annotation.dart';

part 'plataforma.g.dart';

@JsonSerializable(explicitToJson: true, checked: true)
class Plataforma extends EntidadeDominio {
  final String linkPrefixo;

  Plataforma({
    required super.id,
    required super.nome,
    required this.linkPrefixo,
  });

  factory Plataforma.fromJson(Map<String, dynamic> json) =>
      _$PlataformaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PlataformaToJson(this);
}
