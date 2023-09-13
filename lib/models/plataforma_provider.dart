import 'package:shop/models/base_list_provider.dart';
import 'package:shop/models/plataforma.dart';
import 'package:shop/utils/constants.dart';

class PlataformaProvider extends BaseListProvider<Plataforma> {
  @override
  Plataforma converterEntidade(resultado) => Plataforma.fromJson(resultado);

  @override
  String get routePath => '${Constants.filmeflixBasePath}/plataformas';

  @override
  String getLabel(Plataforma element) => element.nome;

  @override
  String getValue(Plataforma element) => element.id.toString();
}
