// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entidade_dominio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntidadeDominio _$EntidadeDominioFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'EntidadeDominio',
      json,
      ($checkedConvert) {
        final val = EntidadeDominio(
          id: $checkedConvert('id', (v) => v as int),
          nome: $checkedConvert('nome', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$EntidadeDominioToJson(EntidadeDominio instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
    };
