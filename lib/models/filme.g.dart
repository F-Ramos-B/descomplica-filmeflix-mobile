// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filme _$FilmeFromJson(Map<String, dynamic> json) => Filme(
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
