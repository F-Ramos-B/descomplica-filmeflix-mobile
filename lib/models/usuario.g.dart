// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) => Usuario(
      id: json['id'] as int,
      nome: json['nome'] as String,
      apelido: json['apelido'] as String,
      email: json['email'] as String,
      genero: json['genero'] as String,
      perfil: json['perfil'] as int,
      dataNascimento: json['dataNascimento'] as String,
      idade: json['idade'] as int,
    );

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'apelido': instance.apelido,
      'email': instance.email,
      'genero': instance.genero,
      'perfil': instance.perfil,
      'dataNascimento': instance.dataNascimento,
      'idade': instance.idade,
    };
