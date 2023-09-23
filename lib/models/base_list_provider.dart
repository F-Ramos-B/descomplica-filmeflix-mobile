import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:shop/utils/constants.dart';
import 'package:http/http.dart' as http;

abstract class BaseListProvider<T> with ChangeNotifier {
  final List<T> _resultados = [];

  List<T> get resultados => List.unmodifiable(_resultados);
  List<DropdownMenuItem<int>> get toDropdownMenu =>
      resultados.map(toDropdownItem).toList();

  List<MultiSelectItem<int>> get toMultiSelectMenu =>
      resultados.map(toMultiSelectItem).toList();

  String getLabel(T element);
  int getValue(T element);

  DropdownMenuItem<int> toDropdownItem(T element) {
    return DropdownMenuItem<int>(
      value: getValue(element),
      child: Text(getLabel(element)),
    );
  }

  MultiSelectItem<int> toMultiSelectItem(T element) {
    return MultiSelectItem<int>(getValue(element), getLabel(element));
  }

  Future<void> carregarTodos() async {
    _resultados.clear();

    final response = await http.get(
      Uri.http(
        Constants.filmeflixUrl,
        routePath,
      ),
      headers: Constants.defaultHeaders,
    );

    String responseBody = response.body;

    List<dynamic> resultados = jsonDecode(responseBody);

    for (dynamic resultado in resultados) {
      _resultados.add(converterEntidade(resultado));
    }

    notifyListeners();
  }

  T converterEntidade(resultado);

  String get routePath;
}
