import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/filme_grid.dart';
import 'package:shop/models/filtro_pesquisa_filme.dart';
import 'package:shop/models/genero_provider.dart';
import 'package:shop/models/plataforma_provider.dart';
import 'package:shop/models/resultado_pesquisa_filme_list.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class FilmesOverviewPage extends StatefulWidget {
  const FilmesOverviewPage({Key? key}) : super(key: key);

  @override
  State<FilmesOverviewPage> createState() => _FilmesOverviewPageState();
}

class _FilmesOverviewPageState extends State<FilmesOverviewPage> {
  bool _isLoading = true;
  bool _isLoadingGeneros = true;
  bool _isLoadingPlataforma = true;
  FiltroPesquisaFilme filtro = FiltroPesquisaFilme();

  Future<void> _carregarFilmes(BuildContext context) {
    setState(() {
      _isLoading = true;
    });

    return Provider.of<ResultadoPesquisaFilmeList>(
      context,
      listen: false,
    ).loadFilmes(filtro).then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  Future<void> _carregarGeneros(BuildContext context) {
    setState(() {
      _isLoadingGeneros = true;
    });

    return Provider.of<GeneroProvider>(
      context,
      listen: false,
    ).carregarTodos().then((value) {
      setState(() {
        _isLoadingGeneros = false;
      });
    });
  }

  Future<void> _carregarPlataformas(BuildContext context) {
    setState(() {
      _isLoadingPlataforma = true;
    });

    return Provider.of<PlataformaProvider>(
      context,
      listen: false,
    ).carregarTodos().then((value) {
      setState(() {
        _isLoadingPlataforma = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _carregarFilmes(context);
    _carregarGeneros(context);
    _carregarPlataformas(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 420,
                        width: double.infinity,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: TextField(
                                    onChanged: (value) {
                                      filtro.titulo = value;
                                    },
                                    showCursor: true,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Título',
                                    )),
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: TextField(
                                  onChanged: (value) {
                                    filtro.descricao = value;
                                  },
                                  maxLines: 2,
                                  showCursor: true,
                                  keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Descrição',
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: TextField(
                                          onChanged: (value) {
                                            filtro.classificacaoIndicativaMin =
                                                value;
                                          },
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Idade mínima',
                                          )),
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: TextField(
                                          onChanged: (value) {
                                            filtro.classificacaoIndicativaMax =
                                                value;
                                          },
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Idade máxima',
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              _isLoadingPlataforma
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Container(
                                      padding: const EdgeInsets.all(5),
                                      child: Consumer<PlataformaProvider>(
                                        builder: (
                                          context,
                                          plataformaProvider,
                                          child,
                                        ) {
                                          return DropdownButtonFormField<
                                              String>(
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Plataforma',
                                            ),
                                            value: filtro.plataforma,
                                            items: plataformaProvider
                                                .toDropdownMenu,
                                            onChanged:
                                                (String? novoSelecionado) {
                                              setState(() {
                                                filtro.plataforma =
                                                    novoSelecionado;
                                              });
                                            },
                                          );
                                        },
                                      ),
                                    ),
                              _isLoadingGeneros
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Container(
                                      padding: const EdgeInsets.all(5),
                                      child: Consumer<GeneroProvider>(
                                        builder: (
                                          context,
                                          generoProvider,
                                          child,
                                        ) {
                                          return MultiSelectDialogField<String>(
                                            items: generoProvider
                                                .toMultiSelectMenu,
                                            chipDisplay:
                                                MultiSelectChipDisplay.none(),
                                            title: const Text("Gêneros"),
                                            cancelText: const Text('Cancelar'),
                                            confirmText:
                                                const Text('Confirmar'),
                                            selectedItemsTextStyle:
                                                textoCorCinza(),
                                            itemsTextStyle: textoCorCinza(),
                                            checkColor: Colors.white70,
                                            selectedColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            unselectedColor: Colors.white70,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    Theme.of(context).hintColor,
                                                width: 1,
                                              ),
                                            ),
                                            buttonIcon: const Icon(
                                              Icons.arrow_drop_down_sharp,
                                            ),
                                            buttonText: Text(
                                              "Gêneros",
                                              style: textoCorCinza(),
                                            ),
                                            onConfirm: (results) {
                                              setState(() {
                                                filtro.generos = results
                                                    .map((e) => e.toString())
                                                    .toSet();
                                              });
                                            },
                                          );
                                        },
                                      ),
                                    ),
                              const Divider(),
                              ElevatedButton(
                                onPressed: () => _carregarFilmes(context),
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                    const Size(double.infinity, 40),
                                  ),
                                ),
                                child: const Text('Pesquisar'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ).whenComplete(() => setState(() {
                    filtro = FiltroPesquisaFilme();

                    final bool isResultadoVazio =
                        Provider.of<ResultadoPesquisaFilmeList>(
                      context,
                      listen: false,
                    ).items.isEmpty;

                    if (isResultadoVazio) {
                      _carregarFilmes(context);
                    }
                  }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () => _carregarFilmes(context),
              child: const FilmeGrid(),
            ),
      drawer: const AppDrawer(),
    );
  }

  TextStyle textoCorCinza() {
    return const TextStyle(
      color: Colors.white70,
    );
  }
}
