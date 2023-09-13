import 'package:json_annotation/json_annotation.dart';

part 'filtro_pesquisa_filme.g.dart';

//dart run build_runner build
@JsonSerializable(explicitToJson: true, checked: true)
class FiltroPesquisaFilme {
  String? titulo;
  String? descricao;
  String? classificacaoIndicativaMin;
  String? classificacaoIndicativaMax;
  Set<String>? generos;
  String? plataforma;

  FiltroPesquisaFilme({
    this.titulo,
    this.descricao,
    this.classificacaoIndicativaMin,
    this.classificacaoIndicativaMax,
    this.generos,
    this.plataforma,
  });

  factory FiltroPesquisaFilme.fromJson(Map<String, dynamic> json) =>
      _$FiltroPesquisaFilmeFromJson(json);

  Map<String, dynamic> toJson() => _$FiltroPesquisaFilmeToJson(this);
}
