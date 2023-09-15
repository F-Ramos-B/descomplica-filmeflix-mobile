import 'package:flutter/material.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/listagem_avaliacoes.dart';
import 'package:shop/components/playlist_filme_item.dart';
import 'package:shop/components/ratings.dart';
import 'package:shop/models/playlist.dart';

class PlaylistPage extends StatefulWidget {
  final Playlist playlist;

  const PlaylistPage(this.playlist, {Key? key}) : super(key: key);

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  double _notaInicial = 3;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.playlist.nome),
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
                        title: Text(widget.playlist.nome),
                        content: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Criado por: ${widget.playlist.criador.apelido}',
                                  style: styleSubtitulo(),
                                ),
                                const Spacer(),
                                ...Ratings.criarEstrelas(
                                  widget.playlist.mediaAvaliacoes.round(),
                                )
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'Criada em ${widget.playlist.createdAt}',
                                style: styleSubtitulo(),
                              ),
                            ),
                            const Divider(),
                            Text(
                              widget.playlist.descricao,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                        actions: [
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
            ),
            IconButton(
              icon: const Icon(Icons.comment),
              onPressed: () {
                showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        scrollable: true,
                        alignment: Alignment.center,
                        title: const Text('Avaliações'),
                        content: SizedBox(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          child: ListagemAvaliacoes.criarListagemAvaliacoes(
                            widget.playlist.avaliacoes,
                          ),
                        ),
                        actions: [
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
            ),
            IconButton(
              icon: const Icon(Icons.person_add_alt_1),
              onPressed: () {
                showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        scrollable: true,
                        alignment: Alignment.center,
                        title: Text(
                            widget.playlist.avaliacaoUsuarioLogado != null
                                ? 'Minha avaliação'
                                : 'Postar avaliação'),
                        content: SizedBox(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: ListagemAvaliacoes
                                  .listagemAvaliacaoUsuarioDialog(
                                      widget.playlist.avaliacaoUsuarioLogado,
                                      _notaInicial,
                                      (nota) => {
                                            setState(() {
                                              _notaInicial = nota;
                                            })
                                          }),
                            )),
                        actions: [
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
          itemCount: widget.playlist.filmes.length,
          itemBuilder: (ctx, i) =>
              PlaylistFilmeItem(playlistFilme: widget.playlist.filmes[i]),
        ));
  }

  TextStyle styleSubtitulo() {
    return const TextStyle(
      fontSize: 14,
    );
  }
}
