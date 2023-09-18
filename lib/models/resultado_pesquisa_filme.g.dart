// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultado_pesquisa_filme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultadoPesquisaFilme _$ResultadoPesquisaFilmeFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ResultadoPesquisaFilme',
      json,
      ($checkedConvert) {
        final val = ResultadoPesquisaFilme(
          id: $checkedConvert('id', (v) => v as int),
          titulo: $checkedConvert('titulo', (v) => v as String),
          anoPublicacao: $checkedConvert('anoPublicacao', (v) => v as int),
          tituloAnoPublicacao:
              $checkedConvert('tituloAnoPublicacao', (v) => v as String),
          descricao: $checkedConvert('descricao', (v) => v as String),
          linkImagem: $checkedConvert('linkImagem', (v) => v as String),
          linkFilme: $checkedConvert('linkFilme', (v) => v as String),
          numeroVisualizacoes:
              $checkedConvert('numeroVisualizacoes', (v) => v as int),
          classificacaoIndicativa:
              $checkedConvert('classificacaoIndicativa', (v) => v as int),
          mediaAvaliacoes:
              $checkedConvert('mediaAvaliacoes', (v) => (v as num).toDouble()),
          createdAt: $checkedConvert('createdAt', (v) => v as String),
          updatedAt: $checkedConvert('updatedAt', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$ResultadoPesquisaFilmeToJson(
        ResultadoPesquisaFilme instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'anoPublicacao': instance.anoPublicacao,
      'tituloAnoPublicacao': instance.tituloAnoPublicacao,
      'descricao': instance.descricao,
      'linkImagem': instance.linkImagem,
      'linkFilme': instance.linkFilme,
      'numeroVisualizacoes': instance.numeroVisualizacoes,
      'classificacaoIndicativa': instance.classificacaoIndicativa,
      'mediaAvaliacoes': instance.mediaAvaliacoes,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
