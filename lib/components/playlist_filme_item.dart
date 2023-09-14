import 'package:flutter/material.dart';
import 'package:shop/models/playlist_filme.dart';
import 'package:shop/pages/assistir_filme_page.dart';

class PlaylistFilmeItem extends StatefulWidget {
  final PlaylistFilme playlistFilme;

  const PlaylistFilmeItem({
    Key? key,
    required this.playlistFilme,
  }) : super(key: key);

  @override
  State<PlaylistFilmeItem> createState() => _PlaylistFilmeItemState();
}

class _PlaylistFilmeItemState extends State<PlaylistFilmeItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final PlaylistFilme filme = widget.playlistFilme;

    return Card(
      child: Column(
        children: [
          ListTile(
            dense: true,
            title: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Image.network(
                    filme.linkImagem,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(filme.titulo),
              ],
            ),
            subtitle: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    '${filme.numeroVisualizacoes} visualizações',
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(
                  _expanded
                      ? filme.descricao
                      : '${filme.descricao.substring(0, 201)}...',
                ),
              ],
            ),
            trailing: Wrap(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => AssistirFilmePage(filme),
                        ));
                      },
                      child: const Icon(
                        Icons.keyboard_double_arrow_right,
                        color: Colors.greenAccent,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        _expanded ? Icons.expand_less : Icons.expand_more,
                      ),
                      onPressed: () {
                        setState(() {
                          _expanded = !_expanded;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
