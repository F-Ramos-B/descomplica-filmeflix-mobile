import 'package:flutter/material.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/playlist_filme_item.dart';
import 'package:shop/models/playlist.dart';

class PlaylistPage extends StatelessWidget {
  final Playlist playlist;

  const PlaylistPage(this.playlist, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(playlist.nome),
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        scrollable: true,
                        alignment: Alignment.center,
                        title: Text(playlist.nome),
                        content: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Criado por: ${playlist.criador.apelido}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                const Spacer(),
                                ...criarEstrelas(
                                  playlist.mediaAvaliacoes.round(),
                                )
                              ],
                            ),
                            const Divider(),
                            Text(
                              playlist.descricao,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              },
            )
          ],
        ),
        drawer: const AppDrawer(),
        body: ListView.builder(
          itemCount: playlist.filmes.length,
          itemBuilder: (ctx, i) =>
              PlaylistFilmeItem(playlistFilme: playlist.filmes[i]),
        ));
  }

  List<Icon> criarEstrelas(int mediaAvaliacoes) {
    return List<Icon>.generate(
      5,
      (int index) => Icon(
        mediaAvaliacoes > index ? Icons.star : Icons.star_border,
        size: 14,
      ),
    );
  }
}
