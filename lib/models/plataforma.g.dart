// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plataforma.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plataforma _$PlataformaFromJson(Map<String, dynamic> json) => Plataforma(
      id: json['id'] as int,
      nome: json['nome'] as String,
      linkPrefixo: json['linkPrefixo'] as String,
    );

Map<String, dynamic> _$PlataformaToJson(Plataforma instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'linkPrefixo': instance.linkPrefixo,
    };
