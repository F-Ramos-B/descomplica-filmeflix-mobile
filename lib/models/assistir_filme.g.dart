// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assistir_filme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssistirFilme _$AssistirFilmeFromJson(Map<String, dynamic> json) =>
    AssistirFilme(
      id: json['id'] as int,
      titulo: json['titulo'] as String,
      descricao: json['descricao'] as String,
      linkImagem: json['linkImagem'] as String,
      linkFilme: json['linkFilme'] as String,
      numeroVisualizacoes: json['numeroVisualizacoes'] as int,
      classificacaoIndicativa: json['classificacaoIndicativa'] as int,
      generos: (json['generos'] as List<dynamic>)
          .map((e) => EntidadeDominio.fromJson(e as Map<String, dynamic>))
          .toList(),
      plataforma:
          Plataforma.fromJson(json['plataforma'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      mediaAvaliacoes: (json['mediaAvaliacoes'] as num).toDouble(),
      avaliacoes: (json['avaliacoes'] as List<dynamic>)
          .map((e) => Avaliacao.fromJson(e as Map<String, dynamic>))
          .toList(),
      avaliacaoUsuarioLogado: Avaliacao.fromJson(
          json['avaliacaoUsuarioLogado'] as Map<String, dynamic>),
      atores: (json['atores'] as List<dynamic>)
          .map((e) => Ator.fromJson(e as Map<String, dynamic>))
          .toList(),
      linkExibicao: json['linkExibicao'] as String,
      generosTexto: json['generosTexto'] as String,
      atoresTexto: json['atoresTexto'] as String,
    );

Map<String, dynamic> _$AssistirFilmeToJson(AssistirFilme instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'linkImagem': instance.linkImagem,
      'linkFilme': instance.linkFilme,
      'numeroVisualizacoes': instance.numeroVisualizacoes,
      'classificacaoIndicativa': instance.classificacaoIndicativa,
      'generos': instance.generos.map((e) => e.toJson()).toList(),
      'plataforma': instance.plataforma.toJson(),
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'mediaAvaliacoes': instance.mediaAvaliacoes,
      'atores': instance.atores.map((e) => e.toJson()).toList(),
      'avaliacoes': instance.avaliacoes.map((e) => e.toJson()).toList(),
      'avaliacaoUsuarioLogado': instance.avaliacaoUsuarioLogado.toJson(),
      'linkExibicao': instance.linkExibicao,
      'generosTexto': instance.generosTexto,
      'atoresTexto': instance.atoresTexto,
    };
