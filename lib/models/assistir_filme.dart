import 'package:flutter/material.dart';
import 'package:shop/models/ator.dart';
import 'package:shop/models/avaliacao.dart';
import 'package:shop/models/filme.dart';
import 'package:shop/models/entidade_dominio.dart';
import 'package:shop/models/plataforma.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shop/utils/constants.dart';

part 'assistir_filme.g.dart';

@JsonSerializable(explicitToJson: true)
class AssistirFilme extends Filme with ChangeNotifier {
  final double mediaAvaliacoes;
  final List<Ator> atores;
  final List<Avaliacao> avaliacoes;
  final Avaliacao avaliacaoUsuarioLogado;
  final String linkExibicao;
  final String generosTexto;
  final String atoresTexto;

  AssistirFilme({
    required super.id,
    required super.titulo,
    required super.descricao,
    required super.linkImagem,
    required super.linkFilme,
    required super.numeroVisualizacoes,
    required super.classificacaoIndicativa,
    required super.generos,
    required super.plataforma,
    required super.createdAt,
    required super.updatedAt,
    required this.mediaAvaliacoes,
    required this.avaliacoes,
    required this.avaliacaoUsuarioLogado,
    required this.atores,
    required this.linkExibicao,
    required this.generosTexto,
    required this.atoresTexto,
  });

  factory AssistirFilme.fromJson(Map<String, dynamic> json) =>
      _$AssistirFilmeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AssistirFilmeToJson(this);

  Future<AssistirFilme> carregarFilme(int idFilme) async {
    final response = await http.get(
      Uri.http(
        Constants.filmeflixUrl,
        '${Constants.filmeflixBasePath}/filmes/assistir/$idFilme',
      ),
      headers: Map.from({HttpHeaders.authorizationHeader: Constants.token}),
    );

    var responseBody = response.body;

    print('Assistir Filme carregado:');
    print(responseBody);

    notifyListeners();
    return jsonDecode(responseBody);
  }
}
