import 'package:flutter/material.dart';
import 'package:shop/models/base_filme.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resultado_pesquisa_filme.g.dart';

@JsonSerializable(explicitToJson: true, checked: true)
class ResultadoPesquisaFilme extends BaseFilme with ChangeNotifier {
  final double mediaAvaliacoes;
  final String createdAt;
  final String updatedAt;

  ResultadoPesquisaFilme({
    required super.id,
    required super.titulo,
    required super.descricao,
    required super.linkImagem,
    required super.linkFilme,
    required super.numeroVisualizacoes,
    required super.classificacaoIndicativa,
    required this.mediaAvaliacoes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ResultadoPesquisaFilme.fromJson(Map<String, dynamic> json) =>
      _$ResultadoPesquisaFilmeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResultadoPesquisaFilmeToJson(this);
}
