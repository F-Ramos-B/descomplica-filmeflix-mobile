import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/filme_grid_item.dart';
import 'package:shop/models/resultado_pesquisa_filme.dart';
import 'package:shop/models/resultado_pesquisa_filme_list.dart';

class FilmeGrid extends StatelessWidget {
  const FilmeGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ResultadoPesquisaFilme> loadedFilmes =
        Provider.of<ResultadoPesquisaFilmeList>(context).items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedFilmes.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loadedFilmes[i],
        child: const FilmeGridItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
