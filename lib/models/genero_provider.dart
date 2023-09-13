import 'package:shop/models/entidade_dominio.dart';
import 'package:shop/models/base_list_provider.dart';
import 'package:shop/utils/constants.dart';

class GeneroProvider extends BaseListProvider<EntidadeDominio> {
  @override
  EntidadeDominio converterEntidade(resultado) =>
      EntidadeDominio.fromJson(resultado);

  @override
  String get routePath => '${Constants.filmeflixBasePath}/generos';

  @override
  String getLabel(EntidadeDominio element) => element.nome;

  @override
  String getValue(EntidadeDominio element) => element.id.toString();
}
