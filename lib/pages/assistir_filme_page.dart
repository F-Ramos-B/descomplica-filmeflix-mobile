import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/assistir_filme_provider.dart';
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';

class AssistirFilmePage extends StatefulWidget {
  const AssistirFilmePage({Key? key}) : super(key: key);

  @override
  State<AssistirFilmePage> createState() => _AssistirFilmePageState();
}

class _AssistirFilmePageState extends State<AssistirFilmePage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int idFilme = ModalRoute.of(context)?.settings.arguments as int;

    print('Carregando filme id $idFilme');

    if (_isLoading) {
      Provider.of<AssistirFilmeProvider>(
        context,
        listen: false,
      ).carregarFilme(idFilme).then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }

    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Consumer<AssistirFilmeProvider>(
            builder: (context, filmeProvider, child) {
              int mediaAvaliacoes =
                  filmeProvider.filmeCarregado.mediaAvaliacoes.round();

              return Scaffold(
                appBar: AppBar(
                  title: Text(filmeProvider.filmeCarregado.titulo),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Image.network(
                          filmeProvider.filmeCarregado.linkImagem,
                          fit: BoxFit.cover,
                        ),
                      ),
                      DefaultTabController(
                        length: 3,
                        child: Column(
                          children: [
                            TabBar(
                              tabs: [
                                const Tab(
                                  text: 'Descrição',
                                  icon: Icon(Icons.text_snippet),
                                ),
                                const Tab(
                                  text: 'Avaliações',
                                  icon: Icon(Icons.speaker_notes),
                                ),
                                Tab(
                                  text: filmeProvider.filmeCarregado
                                              .avaliacaoUsuarioLogado !=
                                          null
                                      ? 'Minha avaliação'
                                      : 'Postar avaliação',
                                  icon: const Icon(Icons.post_add),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            AutoScaleTabBarView(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          filmeProvider
                                              .filmeCarregado.generosTexto,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          '${filmeProvider.filmeCarregado.numeroVisualizacoes} visualizações',
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      filmeProvider.filmeCarregado.atoresTexto,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: criarEstrelas(mediaAvaliacoes),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      width: double.infinity,
                                      child: Text(
                                        filmeProvider.filmeCarregado.descricao,
                                        textAlign: TextAlign.justify,
                                      ),
                                    )
                                  ],
                                ),
                                ListView(
                                  physics: const ClampingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  children: filmeProvider
                                      .filmeCarregado.avaliacoes
                                      .map(
                                    (avaliacao) {
                                      return Column(
                                        children: [
                                          ListTile(
                                            minVerticalPadding: 20,
                                            leading: CircleAvatar(
                                                child: Text(avaliacao
                                                    .usuario.apelido[0]
                                                    .toUpperCase())),
                                            title: Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 10,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    avaliacao.usuario.apelido,
                                                  ),
                                                  Row(
                                                    children: criarEstrelas(
                                                        avaliacao.nota),
                                                  )
                                                ],
                                              ),
                                            ),
                                            subtitle: Text(
                                              textAlign: TextAlign.justify,
                                              avaliacao.critica,
                                            ),
                                            trailing: const Icon(
                                              Icons.more_vert,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            textAlign: TextAlign.center,
                                            avaliacao.createdAt,
                                          ),
                                          const Divider(
                                            height: 20,
                                            thickness: 5,
                                          )
                                        ],
                                      );
                                    },
                                  ).toList(),
                                ),
                                const Icon(Icons.directions_bike),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }

  List<Icon> criarEstrelas(int mediaAvaliacoes) {
    return List<Icon>.generate(
      5,
      (int index) => Icon(
        mediaAvaliacoes > index ? Icons.star : Icons.star_border,
      ),
    );
  }
}
