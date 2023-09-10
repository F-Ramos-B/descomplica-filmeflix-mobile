// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ator _$AtorFromJson(Map<String, dynamic> json) => Ator(
      id: json['id'] as int,
      nome: json['nome'] as String,
      sobrenome: json['sobrenome'] as String,
      biografia: json['biografia'] as String,
      dataNascimento: json['dataNascimento'] as String,
      idade: json['idade'] as int,
      textoSelect: json['textoSelect'] as String,
      nomeCompleto: json['nomeCompleto'] as String,
    );

Map<String, dynamic> _$AtorToJson(Ator instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'biografia': instance.biografia,
      'dataNascimento': instance.dataNascimento,
      'textoSelect': instance.textoSelect,
      'idade': instance.idade,
      'nomeCompleto': instance.nomeCompleto,
    };
