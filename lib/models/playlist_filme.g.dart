// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_filme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistFilme _$PlaylistFilmeFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PlaylistFilme',
      json,
      ($checkedConvert) {
        final val = PlaylistFilme(
          id: $checkedConvert('id', (v) => v as int),
          titulo: $checkedConvert('titulo', (v) => v as String),
          descricao: $checkedConvert('descricao', (v) => v as String),
          linkImagem: $checkedConvert('linkImagem', (v) => v as String),
          linkFilme: $checkedConvert('linkFilme', (v) => v as String),
          numeroVisualizacoes:
              $checkedConvert('numeroVisualizacoes', (v) => v as int),
          classificacaoIndicativa:
              $checkedConvert('classificacaoIndicativa', (v) => v as int),
          dataInclusaoPlaylist:
              $checkedConvert('dataInclusaoPlaylist', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$PlaylistFilmeToJson(PlaylistFilme instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'linkImagem': instance.linkImagem,
      'linkFilme': instance.linkFilme,
      'numeroVisualizacoes': instance.numeroVisualizacoes,
      'classificacaoIndicativa': instance.classificacaoIndicativa,
      'dataInclusaoPlaylist': instance.dataInclusaoPlaylist,
    };
