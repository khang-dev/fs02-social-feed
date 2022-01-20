// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['displayName'] as String,
      json['avatarUrl'] as String,
      json['isActive'] as bool,
      json['id'] as int,
      json['hasStory'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'avatarUrl': instance.avatarUrl,
      'isActive': instance.isActive,
      'hasStory': instance.hasStory,
    };
