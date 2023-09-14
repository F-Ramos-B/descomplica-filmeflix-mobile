import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/playlist.dart';
import 'package:shop/pages/playlist_page.dart';

class PlaylistGridItem extends StatelessWidget {
  const PlaylistGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filme = Provider.of<Playlist>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            filme.nome,
            textAlign: TextAlign.center,
          ),
        ),
        child: GestureDetector(
          child: Image.network(
            filme.linkImagem,
            fit: BoxFit.contain,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => PlaylistPage(filme),
            ));
          },
        ),
      ),
    );
  }
}
