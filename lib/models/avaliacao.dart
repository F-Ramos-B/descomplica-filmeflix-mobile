import 'package:shop/models/usuario.dart';
import 'package:json_annotation/json_annotation.dart';

part 'avaliacao.g.dart';

@JsonSerializable(explicitToJson: true, checked: true)
class Avaliacao {
  final int id;
  int? idFilme;
  int? idPlaylist;
  final int nota;
  final String critica;
  final Usuario usuario;
  final String createdAt;
  final String updatedAt;

  Avaliacao({
    required this.id,
    this.idFilme,
    this.idPlaylist,
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
