import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/playlist_grid.dart';
import 'package:shop/models/playlist_provider.dart';

class PlaylistsOverviewPage extends StatefulWidget {
  const PlaylistsOverviewPage({Key? key}) : super(key: key);

  @override
  State<PlaylistsOverviewPage> createState() => _PlaylistsOverviewPageState();
}

class _PlaylistsOverviewPageState extends State<PlaylistsOverviewPage> {
  bool _isLoading = true;

  Future<void> _carregarPlaylists(BuildContext context) {
    setState(() {
      _isLoading = true;
    });

    return Provider.of<PlaylistProvider>(
      context,
      listen: false,
    ).carregarTodos().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _carregarPlaylists(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlists / Séries'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () => _carregarPlaylists(context),
              child: const PlaylistGrid(),
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
