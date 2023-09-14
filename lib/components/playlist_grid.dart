import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/playlist_grid_item.dart';
import 'package:shop/models/playlist.dart';
import 'package:shop/models/playlist_provider.dart';

class PlaylistGrid extends StatelessWidget {
  const PlaylistGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Playlist> loadedFilmes =
        Provider.of<PlaylistProvider>(context).resultados;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedFilmes.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loadedFilmes[i],
        child: const PlaylistGridItem(),
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
