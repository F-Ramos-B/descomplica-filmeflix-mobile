// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plataforma.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plataforma _$PlataformaFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Plataforma',
      json,
      ($checkedConvert) {
        final val = Plataforma(
          id: $checkedConvert('id', (v) => v as int),
          nome: $checkedConvert('nome', (v) => v as String),
          linkPrefixo: $checkedConvert('linkPrefixo', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$PlataformaToJson(Plataforma instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'linkPrefixo': instance.linkPrefixo,
    };
