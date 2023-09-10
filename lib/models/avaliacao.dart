import 'package:shop/models/usuario.dart';
import 'package:json_annotation/json_annotation.dart';

part 'avaliacao.g.dart';

@JsonSerializable(explicitToJson: true)
class Avaliacao {
  final int id;
  final int idFilme;
  final int idPlaylist;
  final int nota;
  final String critica;
  final Usuario usuario;
  final String createdAt;
  final String updatedAt;

  Avaliacao({
    required this.id,
    required this.idFilme,
    required this.idPlaylist,
    required this.nota,
    required this.critica,
    required this.usuario,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Avaliacao.fromJson(Map<String, dynamic> json) =>
      _$AvaliacaoFromJson(json);

  Map<String, dynamic> toJson() => _$AvaliacaoToJson(this);
}
