// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avaliacao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Avaliacao _$AvaliacaoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Avaliacao',
      json,
      ($checkedConvert) {
        final val = Avaliacao(
          id: $checkedConvert('id', (v) => v as int),
          idFilme: $checkedConvert('idFilme', (v) => v as int?),
          idPlaylist: $checkedConvert('idPlaylist', (v) => v as int?),
          nota: $checkedConvert('nota', (v) => v as int),
          critica: $checkedConvert('critica', (v) => v as String),
          usuario: $checkedConvert(
              'usuario', (v) => Usuario.fromJson(v as Map<String, dynamic>)),
          createdAt: $checkedConvert('createdAt', (v) => v as String),
          updatedAt: $checkedConvert('updatedAt', (v) => v as String),
        );
        return val;
      },
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
