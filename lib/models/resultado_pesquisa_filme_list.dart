import 'dart:developer';

import 'package:shop/models/filtro_pesquisa_filme.dart';
import 'package:shop/models/resultado_pesquisa_filme.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/utils/constants.dart';

class ResultadoPesquisaFilmeList with ChangeNotifier {
  final List<ResultadoPesquisaFilme> _items = [];

  List<ResultadoPesquisaFilme> get items => List.unmodifiable([..._items]);

  Future<void> loadFilmes([FiltroPesquisaFilme? filtro]) async {
    _items.clear();

    var filtroPesquisa = filtro?.toJson().map((key, value) {
      if (value is int) {
        return MapEntry(key, value.toString());
      }
      if (value is List) {
        List<dynamic> iterable = value;
        return MapEntry(key, iterable.join(','));
      }
      if (value is Set) {
        Set<dynamic> iterable = value;
        return MapEntry(key, iterable.join(','));
      }

      return MapEntry(key, value);
    });

    final response = await http.get(
      Uri.http(
        Constants.filmeflixUrl,
        '${Constants.filmeflixBasePath}/filmes/pesquisar',
        filtroPesquisa,
      ),
      headers: Constants.defaultHeaders,
    );

    var responseBody = response.body;

    List<dynamic> data = jsonDecode(responseBody) as List<dynamic>;
    for (var filme in data) {
      _items.add(ResultadoPesquisaFilme.fromJson(filme));
    }

    notifyListeners();
  }
}
