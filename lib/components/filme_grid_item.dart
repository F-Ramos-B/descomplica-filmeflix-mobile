import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/resultado_pesquisa_filme.dart';
import 'package:shop/utils/app_routes.dart';

class FilmeGridItem extends StatelessWidget {
  const FilmeGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filme = Provider.of<ResultadoPesquisaFilme>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            filme.titulo,
            textAlign: TextAlign.center,
          ),
        ),
        child: GestureDetector(
          child: Image.network(
            filme.linkImagem,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.assistirFilme,
              arguments: filme.id,
            );
          },
        ),
      ),
    );
  }
}
