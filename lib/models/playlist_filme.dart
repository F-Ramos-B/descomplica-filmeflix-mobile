import 'package:json_annotation/json_annotation.dart';
import 'package:shop/models/base_filme.dart';

part 'playlist_filme.g.dart';

@JsonSerializable(explicitToJson: true, checked: true)
class PlaylistFilme extends BaseFilme {
  final String dataInclusaoPlaylist;

  PlaylistFilme({
    required super.id,
    required super.titulo,
    required super.descricao,
    required super.linkImagem,
    required super.linkFilme,
    required super.numeroVisualizacoes,
    required super.classificacaoIndicativa,
    required this.dataInclusaoPlaylist,
  });

  factory PlaylistFilme.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFilmeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PlaylistFilmeToJson(this);
}
