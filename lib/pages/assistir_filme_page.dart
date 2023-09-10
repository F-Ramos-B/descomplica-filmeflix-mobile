import 'package:flutter/material.dart';
import 'package:shop/models/assistir_filme.dart';
import 'package:provider/provider.dart';

class AssistirFilmePage extends StatefulWidget {
  const AssistirFilmePage({Key? key}) : super(key: key);

  @override
  State<AssistirFilmePage> createState() => _AssistirFilmePageState();
}

class _AssistirFilmePageState extends State<AssistirFilmePage> {
  bool _isLoading = true;
  late AssistirFilme filmeCarregado;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int idFilme = ModalRoute.of(context)!.settings.arguments as int;

    print('Carregando filme id $idFilme');

    Provider.of<AssistirFilme>(
      context,
    ).carregarFilme(idFilme).then((filme) {
      setState(() {
        _isLoading = false;
        filmeCarregado = filme;
        print(filme);
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(filmeCarregado.titulo),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.network(
                      filmeCarregado.linkImagem,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    filmeCarregado.generosTexto,
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
                      filmeCarregado.descricao,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
