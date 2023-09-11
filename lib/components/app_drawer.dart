import 'package:flutter/material.dart';
import 'package:shop/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            AppBar(
              centerTitle: true,
              title: Row(
                children: [
                  Image.asset(
                    'assets/images/logo-filmeflix.png',
                    height: 100,
                    fit: BoxFit.cover,
                    color: const Color.fromARGB(255, 250, 94, 255),
                  ),
                ],
              ),
              automaticallyImplyLeading: false,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  AppRoutes.home,
                );
              },
            ),
            const Divider(),
            const ListTile(
              title: Text(
                'Filmes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Pesquisar'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  AppRoutes.products,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_circle_rounded),
              title: const Text('Incluir'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  AppRoutes.products,
                );
              },
            ),
            const Divider(),
            const ListTile(
              title: Text(
                'Playlists / Séries',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Pesquisar'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  AppRoutes.products,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_circle_rounded),
              title: const Text('Incluir'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  AppRoutes.products,
                );
              },
            ),
            const Divider(),
            const ListTile(
              title: Text(
                'Atores',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Pesquisar'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  AppRoutes.products,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_circle_rounded),
              title: const Text('Incluir'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  AppRoutes.products,
                );
              },
            ),
            const Divider(),
            const ListTile(
              title: Text(
                'Área do usuário',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.star_border),
              title: const Text('Administradores'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  AppRoutes.products,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Usuários'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  AppRoutes.products,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.my_library_books_outlined),
              title: const Text('Minhas avaliações'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  AppRoutes.products,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sair'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  AppRoutes.products,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
