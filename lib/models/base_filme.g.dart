// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_filme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseFilme _$BaseFilmeFromJson(Map<String, dynamic> json) => $checkedCreate(
      'BaseFilme',
      json,
      ($checkedConvert) {
        final val = BaseFilme(
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
        );
        return val;
      },
    );

Map<String, dynamic> _$BaseFilmeToJson(BaseFilme instance) => <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'anoPublicacao': instance.anoPublicacao,
      'tituloAnoPublicacao': instance.tituloAnoPublicacao,
      'descricao': instance.descricao,
      'linkImagem': instance.linkImagem,
      'linkFilme': instance.linkFilme,
      'numeroVisualizacoes': instance.numeroVisualizacoes,
      'classificacaoIndicativa': instance.classificacaoIndicativa,
    };
