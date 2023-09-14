import 'package:shop/models/base_list_provider.dart';
import 'package:shop/models/playlist.dart';
import 'package:shop/utils/constants.dart';

class PlaylistProvider extends BaseListProvider<Playlist> {
  @override
  Playlist converterEntidade(resultado) => Playlist.fromJson(resultado);

  @override
  String get routePath => '${Constants.filmeflixBasePath}/playlists';

  @override
  String getLabel(Playlist element) => element.nome;

  @override
  String getValue(Playlist element) => element.id.toString();
}
