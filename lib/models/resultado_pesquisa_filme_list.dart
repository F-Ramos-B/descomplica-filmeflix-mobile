import 'dart:developer';
import 'dart:io';

import 'package:shop/models/filtro_pesquisa_filme.dart';
import 'package:shop/models/resultado_pesquisa_filme.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/utils/constants.dart';

class ResultadoPesquisaFilmeList with ChangeNotifier {
  final List<ResultadoPesquisaFilme> _items = [];

  List<ResultadoPesquisaFilme> get items => List.unmodifiable(_items);

  int get itemsCount {
    return _items.length;
  }

  Future<void> loadFilmes([FiltroPesquisaFilme? filtro]) async {
    _items.clear();

    final response = await http.get(
      Uri.http(
        Constants.filmeflixUrl,
        '${Constants.filmeflixBasePath}/filmes/pesquisar',
        filtro?.toJson(),
      ),
      headers: Constants.defaultHeaders,
    );

    var responseBody = response.body;

    List<dynamic> data = jsonDecode(responseBody);
    for (var filme in data) {
      _items.add(ResultadoPesquisaFilme.fromJson(filme));
    }

    notifyListeners();
  }
}
