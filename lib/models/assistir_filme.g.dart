// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assistir_filme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssistirFilme _$AssistirFilmeFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AssistirFilme',
      json,
      ($checkedConvert) {
        final val = AssistirFilme(
          id: $checkedConvert('id', (v) => v as int),
          titulo: $checkedConvert('titulo', (v) => v as String),
          descricao: $checkedConvert('descricao', (v) => v as String),
          linkImagem: $checkedConvert('linkImagem', (v) => v as String),
          linkFilme: $checkedConvert('linkFilme', (v) => v as String),
          numeroVisualizacoes:
              $checkedConvert('numeroVisualizacoes', (v) => v as int),
          classificacaoIndicativa:
              $checkedConvert('classificacaoIndicativa', (v) => v as int),
          generos: $checkedConvert(
              'generos',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      EntidadeDominio.fromJson(e as Map<String, dynamic>))
                  .toList()),
          plataforma: $checkedConvert('plataforma',
              (v) => Plataforma.fromJson(v as Map<String, dynamic>)),
          createdAt: $checkedConvert('createdAt', (v) => v as String),
          updatedAt: $checkedConvert('updatedAt', (v) => v as String),
          mediaAvaliacoes:
              $checkedConvert('mediaAvaliacoes', (v) => (v as num).toDouble()),
          avaliacoes: $checkedConvert(
              'avaliacoes',
              (v) => (v as List<dynamic>)
                  .map((e) => Avaliacao.fromJson(e as Map<String, dynamic>))
                  .toList()),
          avaliacaoUsuarioLogado: $checkedConvert(
              'avaliacaoUsuarioLogado',
              (v) => v == null
                  ? null
                  : Avaliacao.fromJson(v as Map<String, dynamic>)),
          atores: $checkedConvert(
              'atores',
              (v) => (v as List<dynamic>)
                  .map((e) => Ator.fromJson(e as Map<String, dynamic>))
                  .toList()),
          linkExibicao: $checkedConvert('linkExibicao', (v) => v as String),
          generosTexto: $checkedConvert('generosTexto', (v) => v as String),
          atoresTexto: $checkedConvert('atoresTexto', (v) => v as String),
        );
        return val;
      },
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
      'avaliacaoUsuarioLogado': instance.avaliacaoUsuarioLogado?.toJson(),
      'linkExibicao': instance.linkExibicao,
      'generosTexto': instance.generosTexto,
      'atoresTexto': instance.atoresTexto,
    };
