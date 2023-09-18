import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/ratings.dart';
import 'package:shop/models/resultado_pesquisa_filme.dart';
import 'package:shop/pages/assistir_filme_page.dart';

class FilmeGridItem extends StatelessWidget {
  const FilmeGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filme = Provider.of<ResultadoPesquisaFilme>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        header: Padding(
          padding: const EdgeInsets.only(top: 1, left: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                Ratings.criarEstrelas(filme.mediaAvaliacoes.round(), size: 15),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            filme.tituloAnoPublicacao,
            overflow: TextOverflow.fade,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        child: GestureDetector(
          child: Image.network(
            filme.linkImagem,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => AssistirFilmePage(filme),
            ));
          },
        ),
      ),
    );
  }
}
