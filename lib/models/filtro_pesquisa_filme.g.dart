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
          anoPublicacaoMin:
              $checkedConvert('anoPublicacaoMin', (v) => v as int?),
          anoPublicacaoMax:
              $checkedConvert('anoPublicacaoMax', (v) => v as int?),
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

Map<String, dynamic> _$FiltroPesquisaFilmeToJson(FiltroPesquisaFilme instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('titulo', instance.titulo);
  writeNotNull('descricao', instance.descricao);
  writeNotNull('anoPublicacaoMin', instance.anoPublicacaoMin);
  writeNotNull('anoPublicacaoMax', instance.anoPublicacaoMax);
  writeNotNull(
      'classificacaoIndicativaMin', instance.classificacaoIndicativaMin);
  writeNotNull(
      'classificacaoIndicativaMax', instance.classificacaoIndicativaMax);
  writeNotNull('generos', instance.generos?.toList());
  writeNotNull('plataforma', instance.plataforma);
  return val;
}
