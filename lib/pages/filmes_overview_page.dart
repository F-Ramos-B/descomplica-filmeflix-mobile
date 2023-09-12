import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/badge.dart' as badges;
import 'package:shop/components/filme_grid.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/filtro_pesquisa_filme.dart';
import 'package:shop/models/resultado_pesquisa_filme_list.dart';
import 'package:shop/utils/app_routes.dart';

enum FilterOptions {
  favorite,
  all,
}

class FilmesOverviewPage extends StatefulWidget {
  const FilmesOverviewPage({Key? key}) : super(key: key);

  @override
  State<FilmesOverviewPage> createState() => _FilmesOverviewPageState();
}

class _FilmesOverviewPageState extends State<FilmesOverviewPage> {
  bool _isLoading = true;
  FiltroPesquisaFilme filtro = FiltroPesquisaFilme();

  Future<void> _carregarFilmes(BuildContext context) {
    setState(() {
      _isLoading = true;
    });

    return Provider.of<ResultadoPesquisaFilmeList>(
      context,
      listen: false,
    ).loadFilmes().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _carregarFilmes(context);
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
                        height: 900,
                        width: double.infinity,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: const TextField(
                                    showCursor: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Título',
                                    )),
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Idade mínima',
                                          )),
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      child: TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Idade máxima',
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () => Navigator.pop(context),
                                    style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all(
                                          const Size(180, 40)),
                                    ),
                                    child: const Text('Pesquisar'),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                        Colors.grey,
                                      ),
                                      minimumSize: MaterialStateProperty.all(
                                          const Size(180, 40)),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Limpar'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
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
}
