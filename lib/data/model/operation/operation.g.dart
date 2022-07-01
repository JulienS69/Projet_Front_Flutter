// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Operation _$$_OperationFromJson(Map<String, dynamic> json) => _$_Operation(
      idOperation: json['Id_op'] as int?,
      typeOperation: json['Type'] as String?,
      dateOperation: json['DateOp'] as String?,
      montantOperation: json['Montant'] as String?,
      idCompte: json['Id_Cpt'] as int?,
    );

Map<String, dynamic> _$$_OperationToJson(_$_Operation instance) =>
    <String, dynamic>{
      'Id_op': instance.idOperation,
      'Type': instance.typeOperation,
      'DateOp': instance.dateOperation,
      'Montant': instance.montantOperation,
      'Id_Cpt': instance.idCompte,
    };
