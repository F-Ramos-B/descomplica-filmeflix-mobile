import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/assistir_filme_provider.dart';

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
                      const SizedBox(height: 10),
                      Text(
                        filmeProvider.filmeCarregado.generosTexto,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        child: Text(
                          filmeProvider.filmeCarregado.descricao,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
  }
}
