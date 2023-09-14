// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Playlist',
      json,
      ($checkedConvert) {
        final val = Playlist(
          id: $checkedConvert('id', (v) => v as int),
          nome: $checkedConvert('nome', (v) => v as String),
          descricao: $checkedConvert('descricao', (v) => v as String),
          linkImagem: $checkedConvert('linkImagem', (v) => v as String),
          criador: $checkedConvert(
              'criador', (v) => Usuario.fromJson(v as Map<String, dynamic>)),
          filmes: $checkedConvert(
              'filmes',
              (v) => (v as List<dynamic>)
                  .map((e) => PlaylistFilme.fromJson(e as Map<String, dynamic>))
                  .toList()),
          avaliacoes: $checkedConvert(
              'avaliacoes',
              (v) => (v as List<dynamic>)
                  .map((e) => Avaliacao.fromJson(e as Map<String, dynamic>))
                  .toList()),
          avaliacaoUsuarioLogado: $checkedConvert(
              'avaliacaoUsuarioLogado',
              (v) => v == null
                  ? null
                  : Avaliacao.fromJson(v as Map<String, dynamic>)),
          mediaAvaliacoes:
              $checkedConvert('mediaAvaliacoes', (v) => (v as num).toDouble()),
          createdAt: $checkedConvert('createdAt', (v) => v as String),
          updatedAt: $checkedConvert('updatedAt', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'linkImagem': instance.linkImagem,
      'criador': instance.criador.toJson(),
      'filmes': instance.filmes.map((e) => e.toJson()).toList(),
      'avaliacoes': instance.avaliacoes.map((e) => e.toJson()).toList(),
      'avaliacaoUsuarioLogado': instance.avaliacaoUsuarioLogado?.toJson(),
      'mediaAvaliacoes': instance.mediaAvaliacoes,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
