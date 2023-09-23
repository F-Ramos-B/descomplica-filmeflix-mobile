import 'package:json_annotation/json_annotation.dart';

part 'filtro_pesquisa_filme.g.dart';

//dart run build_runner build
@JsonSerializable(explicitToJson: true, checked: true, includeIfNull: false)
class FiltroPesquisaFilme {
  String? titulo;
  String? descricao;
  int? anoPublicacaoMin;
  int? anoPublicacaoMax;
  int? classificacaoIndicativaMin;
  int? classificacaoIndicativaMax;
  Set<int>? generos;
  int? plataforma;

  FiltroPesquisaFilme({
    this.titulo,
    this.descricao,
    this.anoPublicacaoMin,
    this.anoPublicacaoMax,
    this.classificacaoIndicativaMin,
    this.classificacaoIndicativaMax,
    this.generos,
    this.plataforma,
  });

  factory FiltroPesquisaFilme.fromJson(Map<String, dynamic> json) =>
      _$FiltroPesquisaFilmeFromJson(json);

  Map<String, dynamic> toJson() => _$FiltroPesquisaFilmeToJson(this);
}
