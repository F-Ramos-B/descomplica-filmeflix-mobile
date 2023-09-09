// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultado_pesquisa_filme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultadoPesquisaFilme _$ResultadoPesquisaFilmeFromJson(
        Map<String, dynamic> json) =>
    ResultadoPesquisaFilme(
      id: json['id'] as int,
      titulo: json['titulo'] as String,
      descricao: json['descricao'] as String,
      linkImagem: json['linkImagem'] as String,
      linkFilme: json['linkFilme'] as String,
      numeroVisualizacoes: json['numeroVisualizacoes'] as int,
      classificacaoIndicativa: json['classificacaoIndicativa'] as int,
      mediaAvaliacoes: (json['mediaAvaliacoes'] as num).toDouble(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$ResultadoPesquisaFilmeToJson(
        ResultadoPesquisaFilme instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'linkImagem': instance.linkImagem,
      'linkFilme': instance.linkFilme,
      'numeroVisualizacoes': instance.numeroVisualizacoes,
      'classificacaoIndicativa': instance.classificacaoIndicativa,
      'mediaAvaliacoes': instance.mediaAvaliacoes,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
