import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/assistir_filme.dart';
import 'package:shop/models/assistir_filme_provider.dart';
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:shop/models/base_filme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AssistirFilmePage extends StatefulWidget {
  final BaseFilme filme;

  const AssistirFilmePage(this.filme, {Key? key}) : super(key: key);

  @override
  State<AssistirFilmePage> createState() => _AssistirFilmePageState();
}

class _AssistirFilmePageState extends State<AssistirFilmePage> {
  bool _isLoading = true;
  double _notaInicial = 3;
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [];

  @override
  void initState() {
    super.initState();
    _ids.add(widget.filme.linkFilme);

    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;

    Provider.of<AssistirFilmeProvider>(
      context,
      listen: false,
    ).carregarFilme(widget.filme.id).then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Consumer<AssistirFilmeProvider>(
            builder: (context, filmeProvider, child) {
              AssistirFilme filmeCarregado = filmeProvider.filmeCarregado;
              int mediaAvaliacoes = filmeCarregado.mediaAvaliacoes.round();

              bool usuarioPossuiComentario =
                  filmeCarregado.avaliacaoUsuarioLogado != null;

              return Scaffold(
                appBar: AppBar(
                  title: Text(widget.filme.titulo),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      criarYoutubePlayer(),
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
                                  text: usuarioPossuiComentario
                                      ? 'Minha avaliação'
                                      : 'Postar avaliação',
                                  icon: const Icon(Icons.post_add),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            AutoScaleTabBarView(
                              physics: const ClampingScrollPhysics(),
                              children: [
                                criarDescricaoFilme(
                                  filmeCarregado,
                                  mediaAvaliacoes,
                                ),
                                criarListagemAvaliacoes(
                                  filmeCarregado.avaliacoes,
                                ),
                                usuarioPossuiComentario
                                    ? criarListagemAvaliacoes(
                                        [filmeCarregado.avaliacaoUsuarioLogado])
                                    : SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(
                                                  children: [
                                                    const Text('Nota:'),
                                                    Slider(
                                                        value: _notaInicial,
                                                        min: 1,
                                                        max: 5,
                                                        divisions: 4,
                                                        label: _notaInicial
                                                            .round()
                                                            .toString(),
                                                        onChanged: (value) {
                                                          setState(() {
                                                            _notaInicial =
                                                                value;
                                                          });
                                                        }),
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
                                              keyboardType:
                                                  TextInputType.multiline,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText:
                                                    'Digite sua avaliação',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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

  Column criarDescricaoFilme(
      AssistirFilme filmeCarregado, int mediaAvaliacoes) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              filmeCarregado.generosTexto,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            Text(
              '${filmeCarregado.numeroVisualizacoes} visualizações',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          filmeCarregado.atoresTexto,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: criarEstrelas(mediaAvaliacoes),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: Text(
            filmeCarregado.descricao,
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }

  Widget criarListagemAvaliacoes(List<dynamic>? avaliacoes) {
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
                        children: criarEstrelas(avaliacao.nota),
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

  SizedBox criarYoutubePlayer() {
    return SizedBox(
        height: 300,
        width: double.infinity,
        child: YoutubePlayerBuilder(
          onExitFullScreen: () {
            // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
            SystemChrome.setPreferredOrientations(DeviceOrientation.values);
          },
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
            topActions: <Widget>[
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  _controller.metadata.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 25.0,
                ),
                onPressed: () {},
              ),
            ],
            onReady: () {
              _isPlayerReady = true;
            },
            onEnded: (data) {
              _controller
                  .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
              _showSnackBar('Next Video Started!');
            },
          ),
          builder: (context, player) => Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Image.asset(
                  'assets/ypf.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              title: const Text(
                'Youtube Player Flutter',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    icon: const Icon(Icons.video_library), onPressed: () => {}),
              ],
            ),
            body: ListView(
              children: [
                player,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _space,
                      _text('Title', _videoMetaData.title),
                      _space,
                      _text('Channel', _videoMetaData.author),
                      _space,
                      _text('Video Id', _videoMetaData.videoId),
                      _space,
                      Row(
                        children: [
                          _text(
                            'Playback Quality',
                            _controller.value.playbackQuality ?? '',
                          ),
                          const Spacer(),
                          _text(
                            'Playback Rate',
                            '${_controller.value.playbackRate}x  ',
                          ),
                        ],
                      ),
                      _space,
                      TextField(
                        enabled: _isPlayerReady,
                        controller: _idController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter youtube \<video id\> or \<link\>',
                          fillColor: Colors.blueAccent.withAlpha(20),
                          filled: true,
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.blueAccent,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () => _idController.clear(),
                          ),
                        ),
                      ),
                      _space,
                      Row(
                        children: [
                          _loadCueButton('LOAD'),
                          const SizedBox(width: 10.0),
                          _loadCueButton('CUE'),
                        ],
                      ),
                      _space,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.skip_previous),
                            onPressed: _isPlayerReady
                                ? () => _controller.load(_ids[(_ids.indexOf(
                                            _controller.metadata.videoId) -
                                        1) %
                                    _ids.length])
                                : null,
                          ),
                          IconButton(
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                            onPressed: _isPlayerReady
                                ? () {
                                    _controller.value.isPlaying
                                        ? _controller.pause()
                                        : _controller.play();
                                    setState(() {});
                                  }
                                : null,
                          ),
                          IconButton(
                            icon: Icon(
                                _muted ? Icons.volume_off : Icons.volume_up),
                            onPressed: _isPlayerReady
                                ? () {
                                    _muted
                                        ? _controller.unMute()
                                        : _controller.mute();
                                    setState(() {
                                      _muted = !_muted;
                                    });
                                  }
                                : null,
                          ),
                          FullScreenButton(
                            controller: _controller,
                            color: Colors.blueAccent,
                          ),
                          IconButton(
                            icon: const Icon(Icons.skip_next),
                            onPressed: _isPlayerReady
                                ? () => _controller.load(_ids[(_ids.indexOf(
                                            _controller.metadata.videoId) +
                                        1) %
                                    _ids.length])
                                : null,
                          ),
                        ],
                      ),
                      _space,
                      Row(
                        children: <Widget>[
                          const Text(
                            "Volume",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          Expanded(
                            child: Slider(
                              inactiveColor: Colors.transparent,
                              value: _volume,
                              min: 0.0,
                              max: 100.0,
                              divisions: 10,
                              label: '${(_volume).round()}',
                              onChanged: _isPlayerReady
                                  ? (value) {
                                      setState(() {
                                        _volume = value;
                                      });
                                      _controller.setVolume(_volume.round());
                                    }
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      _space,
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: _getStateColor(_playerState),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _playerState.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  List<Icon> criarEstrelas(int mediaAvaliacoes) {
    return List<Icon>.generate(
      5,
      (int index) => Icon(
        mediaAvaliacoes > index ? Icons.star : Icons.star_border,
      ),
    );
  }

  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: const TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700]!;
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900]!;
      default:
        return Colors.blue;
    }
  }

  Widget get _space => const SizedBox(height: 10);

  Widget _loadCueButton(String action) {
    return Expanded(
      child: MaterialButton(
        color: Colors.blueAccent,
        onPressed: _isPlayerReady
            ? () {
                if (_idController.text.isNotEmpty) {
                  var id = YoutubePlayer.convertUrlToId(
                        _idController.text,
                      ) ??
                      '';
                  if (action == 'LOAD') _controller.load(id);
                  if (action == 'CUE') _controller.cue(id);
                  FocusScope.of(context).requestFocus(FocusNode());
                } else {
                  _showSnackBar('Source can\'t be empty!');
                }
              }
            : null,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            action,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
