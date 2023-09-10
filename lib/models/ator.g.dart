// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ator _$AtorFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Ator',
      json,
      ($checkedConvert) {
        final val = Ator(
          id: $checkedConvert('id', (v) => v as int),
          nome: $checkedConvert('nome', (v) => v as String),
          sobrenome: $checkedConvert('sobrenome', (v) => v as String),
          biografia: $checkedConvert('biografia', (v) => v as String),
          dataNascimento: $checkedConvert('dataNascimento', (v) => v as String),
          idade: $checkedConvert('idade', (v) => v as int),
          textoSelect: $checkedConvert('textoSelect', (v) => v as String),
          nomeCompleto: $checkedConvert('nomeCompleto', (v) => v as String),
        );
        return val;
      },
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
