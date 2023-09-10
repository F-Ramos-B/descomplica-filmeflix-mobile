import 'package:json_annotation/json_annotation.dart';

part 'base_filme.g.dart';

@JsonSerializable(explicitToJson: true, checked: true)
class BaseFilme {
  final int id;
  final String titulo;
  final String descricao;
  final String linkImagem;
  final String linkFilme;
  final int numeroVisualizacoes;
  final int classificacaoIndicativa;

  BaseFilme({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.linkImagem,
    required this.linkFilme,
    required this.numeroVisualizacoes,
    required this.classificacaoIndicativa,
  });

  factory BaseFilme.fromJson(Map<String, dynamic> json) =>
      _$BaseFilmeFromJson(json);

  Map<String, dynamic> toJson() => _$BaseFilmeToJson(this);
}
