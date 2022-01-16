// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) => Conversation(
      json['title'] as String,
      json['lastMessage'] as String,
      json['avatarUrl'] as String,
      DateTime.parse(json['lastUpdatedTime'] as String),
      json['id'] as int,
      json['isUnread'] as bool,
    );

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'lastMessage': instance.lastMessage,
      'avatarUrl': instance.avatarUrl,
      'lastUpdatedTime': instance.lastUpdatedTime.toIso8601String(),
      'isUnread': instance.isUnread,
    };
