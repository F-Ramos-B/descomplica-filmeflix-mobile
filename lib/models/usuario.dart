import 'package:json_annotation/json_annotation.dart';

part 'usuario.g.dart';

@JsonSerializable(explicitToJson: true, checked: true)
class Usuario {
  final int id;
  final String nome;
  final String apelido;
  final String email;
  final String genero;
  final int perfil;
  final String dataNascimento;
  final int idade;

  Usuario({
    required this.id,
    required this.nome,
    required this.apelido,
    required this.email,
    required this.genero,
    required this.perfil,
    required this.dataNascimento,
    required this.idade,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}
