import 'package:json_annotation/json_annotation.dart';

part 'filtro_pesquisa_filme.g.dart';

//dart run build_runner build
@JsonSerializable(explicitToJson: true, checked: true)
class FiltroPesquisaFilme {
  final String titulo;
  final String descricao;
  final int classificacaoIndicativaMin;
  final int classificacaoIndicativaMax;
  final Set<int> generos;
  final int plataforma;

  FiltroPesquisaFilme(
    this.titulo,
    this.descricao,
    this.classificacaoIndicativaMin,
    this.classificacaoIndicativaMax,
    this.generos,
    this.plataforma,
  );

  factory FiltroPesquisaFilme.fromJson(Map<String, dynamic> json) =>
      _$FiltroPesquisaFilmeFromJson(json);

  Map<String, dynamic> toJson() => _$FiltroPesquisaFilmeToJson(this);
}
