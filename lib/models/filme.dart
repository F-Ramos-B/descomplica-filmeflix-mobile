import 'package:shop/models/base_filme.dart';
import 'package:shop/models/entidade_dominio.dart';
import 'package:shop/models/plataforma.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filme.g.dart';

@JsonSerializable(explicitToJson: true)
class Filme extends BaseFilme {
  final List<EntidadeDominio> generos;
  final Plataforma plataforma;
  final String createdAt;
  final String updatedAt;

  Filme({
    required super.id,
    required super.titulo,
    required super.descricao,
    required super.linkImagem,
    required super.linkFilme,
    required super.numeroVisualizacoes,
    required super.classificacaoIndicativa,
    required this.generos,
    required this.plataforma,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Filme.fromJson(Map<String, dynamic> json) => _$FilmeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FilmeToJson(this);
}
