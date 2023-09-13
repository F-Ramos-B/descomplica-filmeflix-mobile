import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/assistir_filme_provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/genero_provider.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/plataforma_provider.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/models/resultado_pesquisa_filme_list.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/filmes_overview_page.dart';
import 'package:shop/pages/orders_page.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/product_form_page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/pages/products_page.dart';
import 'package:shop/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => ResultadoPesquisaFilmeList(),
        ),
        ChangeNotifierProvider(
          create: (_) => AssistirFilmeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PlataformaProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GeneroProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
      ],
      child: MaterialApp(
        title: 'Filmeflix',
        theme:
            ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurple),
          colorScheme: const ColorScheme.dark(),
        ),
        routes: {
          AppRoutes.home: (ctx) => const ProductsOverviewPage(),
          AppRoutes.dashboard: (ctx) => const FilmesOverviewPage(),
          AppRoutes.productDetail: (ctx) => const ProductDetailPage(),
          AppRoutes.cart: (ctx) => const CartPage(),
          AppRoutes.orders: (ctx) => const OrdersPage(),
          AppRoutes.products: (ctx) => const ProductsPage(),
          AppRoutes.productForm: (ctx) => const ProductFormPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
