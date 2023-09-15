import 'package:flutter/material.dart';
import 'package:shop/components/ratings.dart';
import 'package:shop/models/avaliacao.dart';

class ListagemAvaliacoes {
  static Widget criarListagemAvaliacoes(List<dynamic>? avaliacoes) {
    if (avaliacoes == null || avaliacoes.isEmpty) {
      return const Text(
        'Nenhuma avaliação',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      );
    }

    return ListView(
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: avaliacoes.map(
        (avaliacao) {
          return Column(
            children: [
              ListTile(
                minVerticalPadding: 20,
                leading: CircleAvatar(
                    child: Text(avaliacao.usuario.apelido[0].toUpperCase())),
                title: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        avaliacao.usuario.apelido,
                      ),
                      Row(
                        children: Ratings.criarEstrelas(avaliacao.nota),
                      )
                    ],
                  ),
                ),
                subtitle: Text(
                  avaliacao.critica,
                  textAlign: TextAlign.justify,
                ),
                trailing: const Icon(
                  Icons.more_vert,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                avaliacao.createdAt,
                textAlign: TextAlign.center,
              ),
              const Divider(
                height: 20,
                thickness: 5,
              )
            ],
          );
        },
      ).toList(),
    );
  }

  static Widget listagemAvaliacaoUsuario(
    Avaliacao? avaliacaoUsuarioLogado,
    double notaInicial,
    Function(double nota) valueFunction,
  ) {
    return avaliacaoUsuarioLogado != null
        ? ListagemAvaliacoes.criarListagemAvaliacoes([avaliacaoUsuarioLogado])
        : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text('Nota:'),
                        Slider(
                          value: notaInicial,
                          min: 1,
                          max: 5,
                          divisions: 4,
                          label: notaInicial.round().toString(),
                          onChanged: valueFunction,
                        )
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Respond to button press
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 18,
                      ),
                      label: const Text(
                        "Postar avaliação",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const TextField(
                  maxLines: 5,
                  showCursor: true,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite sua avaliação',
                  ),
                ),
              ],
            ),
          );
  }

  static Widget listagemAvaliacaoUsuarioDialog(
    Avaliacao? avaliacaoUsuarioLogado,
    double notaInicial,
    Function(double nota) valueFunction,
  ) {
    return avaliacaoUsuarioLogado != null
        ? ListagemAvaliacoes.criarListagemAvaliacoes([avaliacaoUsuarioLogado])
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text('Nota:'),
                  Slider(
                    value: notaInicial,
                    min: 1,
                    max: 5,
                    divisions: 4,
                    label: notaInicial.round().toString(),
                    onChanged: valueFunction,
                  )
                ],
              ),
              const SizedBox(
                width: 280,
                child: TextField(
                  maxLines: 5,
                  showCursor: true,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite sua avaliação',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // Respond to button press
                },
                icon: const Icon(
                  Icons.add,
                  size: 18,
                ),
                label: const Text(
                  "Postar avaliação",
                ),
              ),
            ],
          );
  }
}
