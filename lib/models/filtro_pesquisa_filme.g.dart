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
          titulo: $checkedConvert('titulo', (v) => v as String?),
          descricao: $checkedConvert('descricao', (v) => v as String?),
          classificacaoIndicativaMin:
              $checkedConvert('classificacaoIndicativaMin', (v) => v as int?),
          classificacaoIndicativaMax:
              $checkedConvert('classificacaoIndicativaMax', (v) => v as int?),
          generos: $checkedConvert('generos',
              (v) => (v as List<dynamic>?)?.map((e) => e as int).toSet()),
          plataforma: $checkedConvert('plataforma', (v) => v as int?),
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
      'generos': instance.generos?.toList(),
      'plataforma': instance.plataforma,
    };
