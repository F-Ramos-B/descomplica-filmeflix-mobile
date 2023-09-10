// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filme _$FilmeFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Filme',
      json,
      ($checkedConvert) {
        final val = Filme(
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
        );
        return val;
      },
    );

Map<String, dynamic> _$FilmeToJson(Filme instance) => <String, dynamic>{
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
    };
