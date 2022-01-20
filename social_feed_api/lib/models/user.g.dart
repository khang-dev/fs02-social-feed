// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['gender'] as String,
      json['name'] as String,
      json['email'] as String,
      DateTime.parse(json['dob'] as String),
      DateTime.parse(json['registered'] as String),
      json['phone'] as String,
      json['status'] as String,
      Picture.fromJson(json['picture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'gender': instance.gender,
      'name': instance.name,
      'email': instance.email,
      'dob': instance.dob.toIso8601String(),
      'registered': instance.registered.toIso8601String(),
      'phone': instance.phone,
      'status': instance.status,
      'picture': instance.picture,
    };
