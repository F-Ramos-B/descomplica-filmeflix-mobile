// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtro_pesquisa_filme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FiltroPesquisaFilme _$FiltroPesquisaFilmeFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'FiltroPesquisaFilme',
      json,
      ($checkedConvert) {
        final val = FiltroPesquisaFilme(
          $checkedConvert('titulo', (v) => v as String),
          $checkedConvert('descricao', (v) => v as String),
          $checkedConvert('classificacaoIndicativaMin', (v) => v as int),
          $checkedConvert('classificacaoIndicativaMax', (v) => v as int),
          $checkedConvert('generos',
              (v) => (v as List<dynamic>).map((e) => e as int).toSet()),
          $checkedConvert('plataforma', (v) => v as int),
        );
        return val;
      },
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
