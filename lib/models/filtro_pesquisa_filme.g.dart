// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtro_pesquisa_filme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FiltroPesquisaFilme _$FiltroPesquisaFilmeFromJson(Map<String, dynamic> json) =>
    FiltroPesquisaFilme(
      json['titulo'] as String,
      json['descricao'] as String,
      json['classificacaoIndicativaMin'] as int,
      json['classificacaoIndicativaMax'] as int,
      (json['generos'] as List<dynamic>).map((e) => e as int).toSet(),
      json['plataforma'] as int,
    );

Map<String, dynamic> _$FiltroPesquisaFilmeToJson(
        FiltroPesquisaFilme instance) =>
    <String, dynamic>{
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'classificacaoIndicativaMin': instance.classificacaoIndicativaMin,
      'classificacaoIndicativaMax': instance.classificacaoIndicativaMax,
      'generos': instance.generos.toList(),
      'plataforma': instance.plataforma,
    };
