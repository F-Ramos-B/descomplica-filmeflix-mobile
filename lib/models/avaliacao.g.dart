// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avaliacao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Avaliacao _$AvaliacaoFromJson(Map<String, dynamic> json) => Avaliacao(
      id: json['id'] as int,
      idFilme: json['idFilme'] as int,
      idPlaylist: json['idPlaylist'] as int,
      nota: json['nota'] as int,
      critica: json['critica'] as String,
      usuario: Usuario.fromJson(json['usuario'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$AvaliacaoToJson(Avaliacao instance) => <String, dynamic>{
      'id': instance.id,
      'idFilme': instance.idFilme,
      'idPlaylist': instance.idPlaylist,
      'nota': instance.nota,
      'critica': instance.critica,
      'usuario': instance.usuario.toJson(),
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
