import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shop/models/assistir_filme.dart';
import 'package:shop/utils/constants.dart';
import 'package:http/http.dart' as http;

class AssistirFilmeProvider with ChangeNotifier {
  Map<String, dynamic> _filmeCarregado = {};

  AssistirFilme get filmeCarregado => AssistirFilme.fromJson(_filmeCarregado);

  Future<void> carregarFilme(int idFilme) async {
    final response = await http.get(
      Uri.http(
        Constants.filmeflixUrl,
        '${Constants.filmeflixBasePath}/filmes/assistir/$idFilme',
      ),
      headers: Constants.defaultHeaders,
    );

    var responseBody = response.body;

    print('Assistir Filme carregado:');
    print(responseBody);

    _filmeCarregado = jsonDecode(responseBody);

    notifyListeners();
  }
}
