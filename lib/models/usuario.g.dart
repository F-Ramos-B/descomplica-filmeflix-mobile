// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Usuario',
      json,
      ($checkedConvert) {
        final val = Usuario(
          id: $checkedConvert('id', (v) => v as int),
          nome: $checkedConvert('nome', (v) => v as String),
          apelido: $checkedConvert('apelido', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String),
          genero: $checkedConvert('genero', (v) => v as String),
          perfil: $checkedConvert('perfil', (v) => v as int),
          dataNascimento: $checkedConvert('dataNascimento', (v) => v as String),
          idade: $checkedConvert('idade', (v) => v as int),
        );
        return val;
      },
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
