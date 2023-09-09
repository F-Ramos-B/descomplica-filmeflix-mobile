import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/badge.dart' as badges;
import 'package:shop/components/filme_grid.dart';
import 'package:shop/components/product_grid.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product_list.dart';
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

  Future<void> _refreshFilmes(BuildContext context) {
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
    _refreshFilmes(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.favorite,
                child: Text('Somente Favoritos'),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('Todos'),
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {});
            },
          ),
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.cart);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            builder: (ctx, cart, child) => badges.Badge(
              value: cart.itemsCount.toString(),
              child: child!,
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () => _refreshFilmes(context),
              child: const FilmeGrid(),
            ),
      drawer: const AppDrawer(),
    );
  }
}
