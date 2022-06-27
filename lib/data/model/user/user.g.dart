// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      uuid: json['id'] as String,
      firstName: json['firstname'] as String,
      lastName: json['lastname'] as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.uuid,
      'firstname': instance.firstName,
      'lastname': instance.lastName,
    };
