// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_filme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseFilme _$BaseFilmeFromJson(Map<String, dynamic> json) => BaseFilme(
      id: json['id'] as int,
      titulo: json['titulo'] as String,
      descricao: json['descricao'] as String,
      linkImagem: json['linkImagem'] as String,
      linkFilme: json['linkFilme'] as String,
      numeroVisualizacoes: json['numeroVisualizacoes'] as int,
      classificacaoIndicativa: json['classificacaoIndicativa'] as int,
    );

Map<String, dynamic> _$BaseFilmeToJson(BaseFilme instance) => <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'linkImagem': instance.linkImagem,
      'linkFilme': instance.linkFilme,
      'numeroVisualizacoes': instance.numeroVisualizacoes,
      'classificacaoIndicativa': instance.classificacaoIndicativa,
    };
