// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Operation _$$_OperationFromJson(Map<String, dynamic> json) => _$_Operation(
      idOperation: json['Id_Op'] as String,
      typeOperation: json['Tyoe'] as String?,
      dateOperation: json['Date_Op'] as String?,
      montantOperation: json['Montant'] as String?,
      idCompte: json['Id_Compte'] as String?,
    );

Map<String, dynamic> _$$_OperationToJson(_$_Operation instance) =>
    <String, dynamic>{
      'Id_Op': instance.idOperation,
      'Tyoe': instance.typeOperation,
      'Date_Op': instance.dateOperation,
      'Montant': instance.montantOperation,
      'Id_Compte': instance.idCompte,
    };
