import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shop/models/avaliacao.dart';
import 'package:shop/models/playlist_filme.dart';
import 'package:shop/models/usuario.dart';

part 'playlist.g.dart';

@JsonSerializable(explicitToJson: true, checked: true)
class Playlist with ChangeNotifier {
  final int id;
  final String nome;
  final String descricao;
  final String linkImagem;
  final Usuario criador;
  final List<PlaylistFilme> filmes;
  final List<Avaliacao> avaliacoes;
  Avaliacao? avaliacaoUsuarioLogado;
  final double mediaAvaliacoes;
  final String createdAt;
  final String updatedAt;

  Playlist({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.linkImagem,
    required this.criador,
    required this.filmes,
    required this.avaliacoes,
    this.avaliacaoUsuarioLogado,
    required this.mediaAvaliacoes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}
